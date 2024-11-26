<?php

namespace App\Http\Controllers\Admin;

use Exception;
use App\Models\User;
use App\Models\Store;
use App\Mail\GetSupport;
use App\Models\AppSetting;
use Illuminate\Http\Request;
use App\Mail\GetSupportAdmin;
use App\Jobs\SendAdminMailJob;
use Illuminate\Validation\Rule;
use App\Mail\GetSupportResponse;
use Illuminate\Support\Facades\DB;
use libphonenumber\PhoneNumberUtil;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use libphonenumber\PhoneNumberFormat;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;
use Propaganistas\LaravelPhone\PhoneNumber;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function login()
    {

        return view("2_AdminPanel.5_Auth.login");
    }

    public function register()
    {
        return view("2_AdminPanel.5_Auth.register");
    }

    public function admin_register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'email|unique:users|required',
            'phone' => 'required|min:10|numeric|unique:users',
            'password' => ['required', Password::min(8)->mixedCase()->numbers()->symbols()->uncompromised()],
            'password_confirm' => 'required|same:password'
        ])->validate();

        // customer_id = next unique id + 510035

        $UserId = User::insertGetId([
            'customer_id' => 0,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'role_id' => 4,
            'password' => Hash::make($request->password),
        ]);

        $customerId = 510035 + $UserId;

        User::where('id', $UserId)->update(['customer_id' => $customerId]);

        return redirect()->route('LoginView');
    }

    public function login_admin(Request $request)
    {
        Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required'
        ])->validate();
        if (!Auth::attempt($request->only('email', 'password'))) {
            throw ValidationException::withMessages([
                'email' => trans('auth.failed')
            ]);
        }

        if (Auth::user()->role_id == 5) {
            throw ValidationException::withMessages([
                'email' => 'You do not have permission to access the admin section.'
            ]);
        }
        if (Auth::user()->active == 0) {
            throw ValidationException::withMessages([
                'email' => 'You account has been dismissed.'
            ]);
        }
        $request->session()->regenerate();

        return redirect()->route('DashboardView');
    }

    public function logout_admin(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();

        return redirect()->route('LoginView')->withHeaders([

            'Cache-Control' => 'no-cache, no-store, max-age=0, must-revalidate',

            'Pragma' => 'no-cache',

            'Expires' => 'Sat, 01 Jan 2000 00:00:00 GMT',

        ]);;
    }

    public function user_detail()
    {
        if (Auth::user()) {
            $user = Auth::user();
            return ArrayResp(
                Data: $user,
                Message: "User Edited Succesfully!",
                NeedCount: FALSE,
                Misc: []
            );
        } else {
            return ArrayResp(
                Message: "You Should Login First!!",
                NeedCount: FALSE,
                Misc: []
            );
        }
    }

    public function fetch_customer_details(Request $request)
    {

        $user = User::where('users.customer_id', $request->customer_id)->get();



        return ArrayResp(
            Data: $user,
            Message: "User Details Fetched Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function profile()
    {

        $user = User::select('users.*', 'stores.name as store_name')
            ->leftjoin('stores', 'stores.id', 'users.branch')->find(Auth::user()->id);

        $phone_no = '';

        if (Auth::user()->phone != null) {
            $phoneNumberUtil = PhoneNumberUtil::getInstance();
            // Assuming you have a country code, e.g., 'US'
            $countryCode = 'AU';

            try {
                $phoneNumber = $phoneNumberUtil->parse(Auth::user()->phone, $countryCode);
                $phone_no = $phoneNumberUtil->format($phoneNumber, PhoneNumberFormat::INTERNATIONAL);
            } catch (\libphonenumber\NumberParseException $e) {
                // Handle the exception if the phone number is not valid
                $phone_no = Auth::user()->phone; // Or any fallback logic
            }
        }



        return view("2_AdminPanel.2_Pages.Profile.profile", compact('user', 'phone_no'));
    }

    public function edit_profile()
    {

        $user = User::select('users.*', 'stores.name as store_name')
            ->leftjoin('stores', 'stores.id', 'users.branch')->find(Auth::user()->id);

        if (Auth::user()->role_id > 2) {
            $branches = Store::where('stores.id', Auth::user()->branch)->get();
        } else {
            $branches = Store::get();
        }

        return view("2_AdminPanel.2_Pages.Profile.EditProfile", compact('user', 'branches'));
    }

    public function edit(Request $request)
    {
        $request->merge(['phone' => $request->full_phone]);

        $validator = Validator::make($request->all(), [
            'email' => [
                'email',
                Rule::unique('users')->ignore(Auth::user()->id),
                'required',
            ],
            'phone' => [
                Rule::unique('users')->ignore(Auth::user()->id),
                'required',
            ],


        ]);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }


        $user = User::find(Auth::user()->id);

        $user->update([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->full_phone,
            'branch' => $request->branch ?? null,
        ]);

        return ArrayResp(
            Message: "User Details Updates Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function update_image(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'file' => 'mimes:jpeg,jpg,png|max:50000',
        ]);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }
        $user = User::find(Auth::user()->id);

        if ($request->hasFile('file')) {

            $file = $request->file('file');
            $filename = $file->getClientOriginalName();
            $directory = storage_path('app/public/file_uploads/user/' .  $user->id);

            if (!File::exists($directory)) {
                File::makeDirectory($directory, 0775, true, true);
            }

            $file->move($directory, $filename);
        } else {
            $filename = $user->image;
        }

        $user->update([
            'image' => $filename
        ]);

        return ArrayResp(
            Message: "User Details Updates Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function remove_image(Request $request)
    {
        $user = User::find(Auth::user()->id);

        $user->update([
            'image' => null
        ]);
        return ArrayResp(
            Message: "User Image Remove Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function reset_admin_password()
    {
        $user = User::find(1);
        $user->password = Hash::make("Admin@1234");
        $user->save();
    }

    public function change_password(Request $request)
    {
        $messages = [
            'new_password.different' => 'The new password must be different from the current password.',
        ];
        $validator = Validator::make($request->all(), [
            'current_password' => 'required',
            'new_password' => ['required', Password::min(8)->mixedCase()->numbers()->symbols()->uncompromised(), 'different:current_password'],
            'confirm_password' => 'required|same:new_password',
        ], $messages);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }

        $user = User::find(Auth::user()->id);

        $UserData = [
            'name' => $user->name,
            'email' => $user->email
        ];

        if (!Hash::check($request->current_password, $user->password)) {
            $error = [
                'message' => 'The current password is incorrect.',
                'errors' => [
                    'current_password' => [
                        'The current password is incorrect.'
                    ]
                ]
            ];
            return ArrayBadResp(
                Data: $error,
                Message: "The current password is incorrect.",
                Misc: [],
                RespCode: 500,
            );
        } else {
            $user->password = Hash::make($request->new_password);
            $user->save();

            return ArrayResp(
                Data: $UserData,
                Message: "Password Changed Successfully!",
                NeedCount: FALSE,
                Misc: []
            );
        }
    }

    public function support()
    {
        return view("2_AdminPanel.2_Pages.Support.support");
    }

    public function support_form(Request $request)
    {

        try {
            // $adminMail = 'rishikesh@cyberfort.co.in';
            $adminMail_1 = AppSetting::find('contact_mail');

            $hq_info = AppSetting::find('hq_info');

            $json_data = $hq_info->value;

            $data = json_decode($json_data, true);




            $emailData = [
                'adminMail' => $adminMail_1->value,
                'adminMail_2' => $data['email_2'],
                'name' => $request->name,
                'subject' => $request->subject,
                'message' => $request->message,
                'email' => $request->email,
            ];

            // print_r($adminMail->value);
            // exit();

            // dispatch(new SendAdminMailJob($emailData));

            // not queue senario

            Mail::to($emailData['adminMail'])->send(new GetSupportAdmin($emailData));

            if ($emailData['adminMail_2'] != null) {

                Mail::to($data['email_2'])->send(new GetSupportAdmin($emailData));
            }

            $user_mail = $emailData['email'];
            Mail::to($user_mail)->send(new GetSupportResponse($emailData));

            // not queue senario ends

            return ArrayResp(
                Message: "Thank You For Contacting Us.",
                NeedCount: FALSE,
                Misc: []
            );
        } catch (Exception $e) {
            return ArrayBadResp(
                Message: 'Unable To Submit Form.Please Try Again',
                Misc: [],
                RespCode: 500,
            );
        }
    }

    function support_page()
    {
        return view("2_AdminPanel.2_Pages.Support.outerSupport");
    }

    public function navbar(Request $request)
    {

        $user = User::find($request->id);

        $user->update([
            'navbar' => $request->navbar
        ]);


        return ArrayResp(
            Data: $user,
            Message: "Theme Chnaged Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function testing_route()
    {
        $timezone = config('app.timezone');

        $serverTimezone = date_default_timezone_get();

        $DBtimezone = DB::select("SELECT @@global.time_zone as timezone");
        $DBtimezone = $DBtimezone[0]->timezone;

        // Application time zone
        $appTimezone = config('app.timezone');
        $appTime = new \DateTime('now', new \DateTimeZone($appTimezone));
        $appCurrentTime = $appTime->format('Y-m-d H:i:s');

        // Server time zone
        $serverTimezone = date_default_timezone_get();
        $serverTime = new \DateTime('now', new \DateTimeZone($serverTimezone));
        $serverCurrentTime = $serverTime->format('Y-m-d H:i:s');

        // Database time zone
        $DBtimezone = DB::select("SELECT @@global.time_zone as timezone");
        $DBtimezone = $DBtimezone[0]->timezone;
        $dbTime = new \DateTime('now', new \DateTimeZone($DBtimezone));
        $dbCurrentTime = $dbTime->format('Y-m-d H:i:s');

        // return view("2_AdminPanel.5_Auth.Sample", compact('timezone', 'serverTimezone','DBtimezone'));

        return view("2_AdminPanel.5_Auth.Sample", compact('appTimezone', 'appCurrentTime','serverTimezone','serverCurrentTime','DBtimezone'));

    }
}

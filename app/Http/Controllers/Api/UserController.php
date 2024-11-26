<?php

namespace App\Http\Controllers\Api;

use Exception;
use Carbon\Carbon;
use App\Mail\GetSupport;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\Mail\GetSupportResponse;
// use App\Jobs\SendSupportEmailJob;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;
use Propaganistas\LaravelPhone\PhoneNumber;
// use Propaganistas\LaravelPhone\Rules\Phone;

use App\Models\User;
use App\Models\AppSetting;
use App\Models\UserTransaction;
use App\Models\RegisteredDevices;


class UserController extends Controller
{


    public function register(Request $request)
    {

        $messages = [
            'phone.unique' => 'The phone has already been taken.',
            'password.uncompromised' => 'Your password is too weak. Please enter a strong password.',
            'password.numbers' => 'Password must contain atleast one digit.',
            'password.symbols' => 'Password must contain one special character.',
            'password.mixed' => 'Password must contain one uppercase and lowercase.',
            'password.min' => 'Password must be at least 8 characters long.',
            'password_confirm.same' => 'Passwords do not match.',
            'email.email' => 'The email field must be a valid email address.',
            'email.required' => 'The email field is required.',
            'email.regex' => 'The email field must be a valid email address.',
            'phone' => 'The :attribute field must be a valid number.'
        ];

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => [
                'required',
                'email',
                'regex:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/',
                Rule::unique('users')->whereNull('deleted_at')
            ],
            'phone' => [
                'required',
                'phone:mobile', // US mobile number in international format
                Rule::unique('users')->whereNull('deleted_at')
            ],
            'password' => ['required', Password::min(8)->mixedCase()->numbers()->symbols()->uncompromised()],
            'password_confirm' => 'required|same:password'
        ], $messages);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }

        // customer_id = next unique id + 510035

        $UserId = User::insertGetId([
            'customer_id' => 0,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'role_id' => 5,
            'password' => Hash::make($request->password),
        ]);

        $customerId = 510035 + $UserId;

        User::where('id', $UserId)->update(['customer_id' => $customerId]);

        $UserData = [
            'name' => $request->name,
            'email' => $request->email,
        ];

        if (!$UserId) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Not registerd!",
                Misc: [],
                RespCode: 500,
            );
        } else {
            return ArrayResp(
                Data: $UserData,
                Message: "User Registered Successfully!",
                NeedCount: FALSE,
                Misc: []
            );
        }
    }

    public function login(Request $request)
    {

        $messages = [
            'email.email' => 'The email field must be a valid email address.',
            'email.exists' => 'Please register to login',
            'password.uncompromised' => 'Your password is too weak. Please enter a strong password.',
            'password.numbers' => 'Password must contain atleast one digit.',
            'password.symbols' => 'Password must contain one special character.',
            'password.mixed' => 'Password must contain one uppercase and lowercase.',
            'password.min' => 'Password must be at least 8 characters long.',
            'password_confirm.same' => 'Passwords do not match.',
        ];

        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
            'password' => ['required', Password::min(8)->mixedCase()->numbers()->symbols()->uncompromised()],
            'fcm_token' => 'nullable',
        ], $messages);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            $error = [
                'email' => ['User not found.'],
            ];

            return ArrayBadResp(
                Data: $error,
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 404,
            );
        }

        if ($user->active == 0) {
            $error = [
                'email' => ['The Account has been Dismissed.'],
            ];

            return ArrayBadResp(
                Data: $error,
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $token = $user->createToken('AppName')->accessToken;

            if($request->fcm_token) {
                RegisteredDevices::where('fcm_token', $user->fcm_token)
                 ->update(['user_id' => $user->id]);
            }

            $UserData = [
                'name' => $user->name,
                'email' => $user->email,
            ];

            return ArrayResp(
                Data: $UserData,
                Message: "User Loggined Successfully!",
                NeedCount: FALSE,
                Misc: ['access_token' => $token]
            );
        }

        $message = [
            'password' => ['Please enter valid password!']
        ];

        return ArrayBadResp(
            Data: $message,
            Message: "Validation Error!",
            RespCode: 500,
        );
    }

    public function edit_profile(Request $request)
    {

        $messages = [
            'email.email' => 'The email field must be a valid email address.',
            'email.required' => 'The email field is required.',
            'email.regex' => 'The email field must be a valid email address.',
            'phone' => 'The :attribute field must be a valid number.',
            'phone.unique' => 'The phone has already been taken.',
        ];

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => [
                'email',
                'regex:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/',
                Rule::unique('users')->ignore(Auth::user()->id)->whereNull('deleted_at'),
                'required',
            ],
            'phone' => [
                'required',
                'phone:mobile', // US mobile number in international format
                Rule::unique('users')->ignore(Auth::user()->id)->whereNull('deleted_at'),
            ],
            'image' => 'mimes:jpeg,jpg,png|max:50000',
        ], $messages);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }
        $id = Auth::user()->id;
        // $file = $request->file('image');
        // $filename = $file->getClientOriginalName();

        if ($request->hasFile('image')) {

            $file = $request->file('image');
            $filename = $file->getClientOriginalName();
            $directory = storage_path('app/public/file_uploads/user/' . $id);

            if (!File::exists($directory)) {
                File::makeDirectory($directory, 0775, true, true);
            }

            $file->move($directory, $filename);
        } else {
            $UserId = User::find($id);
            $filename = $UserId->image;
        }

        $UserId = User::find($id);


        $UserId->update([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'image' => $filename,
        ]);

        $UserData = [
            'name' => $request->name,
            'email' => $request->email,
        ];

        if (!$UserId) {
            return ArrayBadResp(
                Message: "Something Went Wrong!",
                Misc: [],
                RespCode: 500,
            );
        } else {
            return ArrayResp(
                Data: $UserData,
                Message: "User Details Updated Successfully!",
                NeedCount: FALSE,
                Misc: []
            );
        }
    }

    public function user_detail()
    {
        $user = Auth::user();
        $id = $user->id;

        $user_details = User::find($id);
        $phone = new PhoneNumber($user->phone);

        $country_alpha_code = $phone->getCountry();
        $user_details['country_alpha_code'] = $country_alpha_code;

        $country_code = explode(' ', $phone->formatInternational());
        $user_details['country_code'] = $country_code[0];

        $phone_number = implode(array_slice($country_code, 1));
        $user_details['phone_number'] = $phone_number;

        $img_url = 'https://yl.tekpeak.in/storage/file_uploads/user/' . $user_details->id . '/' . $user_details->image;
        $user_details['img_url'] = $img_url;

        return ArrayResp(
            Data: $user_details,
            Message: "User Details Fetched Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function logout()
    {

        $user = Auth::user()->token();
        $user->revoke();

        return ArrayResp(
            Message: "Logout Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function NotLoginResponse()
    {
        return ArrayBadResp(
            Message: "You Should Login First!",
            RespCode: 500,
            Misc: [],
            Redirect: true
        );
    }

    public function fetch_customer_details(Request $request)
    {

        $user = User::where('customer_id', $request->customer_id)->get();

        return ArrayResp(
            Data: $user,
            Message: "User Details Fetched Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function fetch_transaction(Request $request)
    {

        $query = UserTransaction::select('user_transactions.*', 'stores.name as branch', 'users.name AS cashier_name')
            ->leftjoin('stores', 'stores.id', 'user_transactions.store_id')
            ->leftjoin('users', 'users.id', 'user_transactions.cashier_id')
            ->with('loyality_offer')
            ->where('user_transactions.user_id', Auth::user()->id)
            ->orderBy('user_transactions.created_at', 'DESC');

        if ($request->has('branch_id')) {
            $query->where('user_transactions.store_id', $request->branch_id);
        }

        $transactions = $query->get();

        // print_r($transaction->toArray());
        // exit();

        foreach ($transactions as $transaction) {
            if (isset($transaction->created_at)) {
                $transaction->created_at = Carbon::parse($transaction->created_at)
                    ->setTimezone('Australia/Melbourne')
                    ->format('Y-m-d H:i:s');
            }
        }

        return ArrayResp(
            Data: $transactions,
            Message: "User Details Fetched Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function user_branch(Request $request)
    {
        $user = User::find(Auth::user()->id);

        $user->update([
            'branch' => $request->branch,
        ]);

        $UserData = [
            'id' => $user->id,
            'name' => $user->name,
            'branch' => $request->branch
        ];

        return ArrayResp(
            Data: $UserData,
            Message: "User Branch Updated Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function reset_password_jk(Request $request)
    {
        $user = User::find($request->user_id);

        $UserData = [
            'name' => $user->name,
            'email' => $user->email,
            'password' => 'NewPw@123'
        ];

        $user->password = Hash::make('NewPw@123');
        $user->save();

        return ArrayResp(
            Data: $UserData,
            Message: "Password Changed Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function change_password(Request $request)
    {
        $messages = [
            'password.different' => 'The new password must be different from the current password.',
            'password.uncompromised' => 'Your password is too weak. Please enter a strong password.',
            'password.numbers' => 'Password must contain atleast one digit.',
            'password.symbols' => 'Password must contain one special character.',
            'password.mixed' => 'Password must contain one uppercase and lowercase.',
            'password.min' => 'Password must be at least 8 characters long.',
            'confirm_password.same' => 'Passwords do not match.',
        ];
        $validator = Validator::make($request->all(), [
            'current_password' => 'required',
            'password' => ['required', Password::min(8)->mixedCase()->numbers()->symbols()->uncompromised(), 'different:current_password'],
            'confirm_password' => 'required|same:password',
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
                'current_password' => [
                    'The current password is incorrect.',
                ]
            ];
            return ArrayBadResp(
                Data: $error,
                Message: "The current password is incorrect.",
                Misc: [],
                RespCode: 500,
            );
        } else {
            $user->password = Hash::make($request->password);
            $user->save();

            return ArrayResp(
                Data: $UserData,
                Message: "Password Changed Successfully!",
                NeedCount: FALSE,
                Misc: []
            );
        }
    }

    public function delete()
    {

        $user = User::find(Auth::user()->id);
        if ($user) {
            $user->delete();
            return ArrayResp(
                Message: "Account deleted successfully.",
                NeedCount: FALSE,
                Misc: []
            );
        } else {
            return ArrayBadResp(
                Message: "User not found.",
                Misc: [],
                RespCode: 500,
            );
        }
    }

    public function get_support(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|regex:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/',
            'subject' => 'required',
            'message' => 'required',
        ]);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }


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

            // dispatch(new SendSupportEmailJob($send_to_mails, $emailData));

            // // not queue senario

            Mail::to($adminMail_1->value)->send(new GetSupport($emailData));

            if ($emailData['adminMail_2'] != null) {

                Mail::to($data['email_2'])->send(new GetSupportResponse($emailData));
            }

            $user_mail = $emailData['email'];
            Mail::to($user_mail)->send(new GetSupportResponse($emailData));

            // not queue senario ends

            return ArrayResp(
                Message: "Thank you for contacting us.",
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

    public function register_new_device(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'fcm_token' => 'required',
            'ip_address' => 'required',
            'platform' => 'required',
            'location' => 'required',
            'device_id' => 'nullable', 
            'device_model' => 'nullable',
            'os_version' => 'nullable',
            'device_name' => 'nullable',
            'user_id' => 'nullable|exists:users,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 442); 
        }

        $device = RegisteredDevices::create($validator->validated()); 

        return ArrayResp(
            Message: "Device Registered Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }
}

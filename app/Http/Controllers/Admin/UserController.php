<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use App\Models\Store;
use Illuminate\Http\Request;
use App\Models\UserTransaction;
use Illuminate\Validation\Rule;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;
use App\Exports\UsersExport;
use Maatwebsite\Excel\Facades\Excel;

class UserController extends Controller
{


    public function dashboard()
    {
        $total_customers = User::where('users.role_id', 5)->count();
        $total_branches = Store::count();

        if (Auth::user()->role_id <= 2) {
            $total_transactions = UserTransaction::count();
            $total_points = UserTransaction::where('user_transactions.coin_type', 'credit')->sum('user_transactions.coins');
            $total_managers = User::where('users.role_id', 3)->count();
            $total_cashier = User::where('users.role_id', 4)->count();
        } else {
            $total_transactions = UserTransaction::where('user_transactions.store_id', Auth::user()->branch)->count();
            $total_points = UserTransaction::where('user_transactions.coin_type', 'credit')->where('user_transactions.store_id', Auth::user()->branch)->sum('user_transactions.coins');
            $total_managers = User::where('users.branch', Auth::user()->branch)->where('users.role_id', 3)->count();
            $total_cashier = User::where('users.branch', Auth::user()->branch)->where('users.role_id', 4)->count();
        }



        // dd($total_points);
        return view("2_AdminPanel.2_Pages.Dashboard.dashboard", compact('total_customers', 'total_transactions', 'total_points', 'total_branches', 'total_managers', 'total_cashier'));
    }


    public function user_list()
    {

        $PageData = [
            "Title" => "Users",
            "PageName" => "UserListView",
            "Crumbs" => [
                "Users",
                "List",
            ],
            "PageTilte" => "Users"
        ];

        $Buttons = [
            [
                "type" => "button",
                "link" => "",
                "colour" => "success",
                "class" => "add-btn",
                "id" => "AddDataModelToggle",
                "text" => '<i class="ri-add-line align-bottom me-1"></i> Add',
            ],
            [
                "type" => "button",
                "link" => "",
                "colour" => "danger",
                "class" => "add-btn",
                "id" => "ExportData",
                "text" => '<i class=" ri-chat-download-line align-bottom me-1"></i></i>Export',
            ]
        ];
        return view('2_AdminPanel.4_SingleUseViews.CommonTableView', compact('PageData', 'Buttons'));
    }

    public function user_form(Request $request, $id = NULL)
    {
        $readonly = $request->readonly;
        if (Auth::user()->role_id < 3) {
            $branches = Store::get();
        } else {
            $branches = Store::where('id', Auth::user()->branch)->get();
        }


        if ($id) {
            $User = User::select('users.*', 'stores.name as store_name')
                ->leftJoin('stores', 'stores.id', 'users.branch')->find($id);
            $View = view("2_AdminPanel.3_Components.1_Pages.UserListView.AddDataForm", compact('User', 'readonly', 'branches'))->render();
        } else {
            $View = view("2_AdminPanel.3_Components.1_Pages.UserListView.AddDataForm", compact('branches'))->render();
        }


        return ArrayResp(
            Data: $View,
            Message: "Model Rendered Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function fetch_users(Request $request, $custom_role_id = null)
    {

        $queryParams = $request->query();



        $query = User::select('users.*', 'stores.name AS branch_name')
            ->leftJoin('stores', 'stores.id', 'users.branch');

        foreach ($queryParams as $key => $value) {

            if ($value != null) {
                // Apply 'LIKE' condition if value is not empty
                if ($key == 'active') {
                    $query->where('users.' . $key, $value);
                } else {
                    $query->where('users.' . $key, 'LIKE', '%' . $value . '%');
                }
            }
        }

        $role_id = Auth::user()->role_id;
        $branch = Auth::user()->branch;
        if ($custom_role_id) {
            if (Auth::user()->role_id == 1) {
                $users = $query->where('users.role_id', $custom_role_id)->get();
            } else if (Auth::user()->role_id == 2) {
                $users = $query->where('users.role_id', '>=', $role_id)->where('users.role_id', $custom_role_id)->get();
            } else {
                if ($custom_role_id == 5) {
                    $users = $query->where('users.role_id', $custom_role_id)->get();
                } else {
                    $users = $query->where('users.branch', $branch)->where('users.role_id', 4)->get();
                }
            }
        } else {
            if (Auth::user()->role_id == 1) {
                $users = $query->get();
            } else if (Auth::user()->role_id == 2) {
                $users = $query->where('users.role_id', '>=', $role_id)->get();
            } else {
                $usersWithRole5 = $query->where('users.role_id', 5)->get();
                $usersWithRole4InBranch = $query->where('users.branch', $branch)->where('users.role_id', 4)->get();
                $users = $usersWithRole5->merge($usersWithRole4InBranch);
            }
        }

        return response()->json([
            'data' => $users,
            'message' => 'Users fetched successfully!',
            'need_count' => false,
            'misc' => []
        ]);
    }

    public function fetch_users_jk()
    {
        $role_id = Auth::user()->role_id;
        $branch = Auth::user()->branch;

        if ($role_id) {
            if (Auth::user()->role_id == 1) {
                $users = User::where('role_id', $role_id)->get();
            } else if (Auth::user()->role_id == 2) {
                $users = User::where('role_id', '>=', $role_id);
            } else if (in_array(Auth::user()->role_id, [3, 4])) {
                $users = User::where('branch', $branch)->where('role_id', '>=', $role_id);
            } else {
                $users = User::where('id', Auth::user()->id)->get();
            }
        } else {
            if (Auth::user()->role_id == 1) {
                $users = User::get();
            } else if (Auth::user()->role_id == 2) {
                $users = User::where('role_id', '>=', $role_id)->get();
            } else {
                $usersWithRole5 = User::where('role_id', 5)->get();
                $usersWithRole4InBranch = User::where('branch', $branch)->where('role_id', 4)->get();
                $users = $usersWithRole5->merge($usersWithRole4InBranch);
            }
        }

        return response()->json([
            'data' => $users,
            'message' => 'Users fetched successfully!',
            'need_count' => false,
            'misc' => []
        ]);
    }


    public function add(Request $request)
    {
        $messages = [
            'full_phone.unique' => 'The phone has already been taken.',
            'password.uncompromised' => 'Your password is too weak. Please enter a strong password.',
            'c_password.same'  => 'Passwords do not match Please re-enter to confirm.',
            'email.email' => 'The email field must be a valid email address.',
            'email.required' => 'The email field is required.'
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => [
                'required',
                'email',
                Rule::unique('users')->whereNull('deleted_at')
            ],
            'full_phone' => [
                'required',
                Rule::unique('users', 'phone')->whereNull('deleted_at')
            ],
            'role' => 'required',
            'password' => ['required', Password::min(8)->mixedCase()->numbers()->symbols()->uncompromised()],
            'c_password' => 'required|same:password'
        ], $messages);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }


        $UserId = User::insertGetId([
            'customer_id' => 0,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->full_phone,
            'role_id' => $request->role,
            'branch' => $request->branch ?? null,
            'active' => $request->status,
            'password' => Hash::make($request->password)
        ]);

        $customerId = 510035 + $UserId;

        User::where('id', $UserId)->update(['customer_id' => $customerId]);

        return ArrayResp(
            Message: "User Added Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function edit(Request $request)
    {
        $user = User::find($request->id);

        $messages = [
            'full_phone.unique' => 'The phone has already been taken.',
            'email.email' => 'The email field must be a valid email address.',
            'email.required' => 'The email field is required.'
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => [
                'email',
                Rule::unique('users')->ignore($user->id)->whereNull('deleted_at'),
                'required',
            ],
            'full_phone' => [
                Rule::unique('users', 'phone')->ignore($user->id)->whereNull('deleted_at'),
                'required',
            ]
        ], $messages);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }

        $user->update([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->full_phone,
            'role_id' => $request->role,
            'branch' => $request->branch ?? null,
            'active' => $request->status,
        ]);
        return ArrayResp(
            Message: "User Edited Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function delete($id)
    {
        $record = User::find($id);
        $record->delete();

        return ArrayResp(
            Message: "User Deleted Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function password_form($id)
    {
        $User = User::find($id);
        $View = view("2_AdminPanel.3_Components.1_Pages.UserListView.PasswordDataForm", compact('User'))->render();
        return ArrayResp(
            Data: $View,
            Message: "Model Rendered Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function change_password(Request $request)
    {
        $messages = [
            'password.uncompromised' => 'Your password is too weak. Please enter a strong password.',
            'password_confirm.same'  => 'Passwords do not match Please re-enter to confirm.',
        ];
        $validator = Validator::make($request->all(), [
            'password' => ['required', Password::min(8)->mixedCase()->numbers()->symbols()->uncompromised()],
            'confirm_password' => 'required|same:password'
        ], $messages);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }

        $user = User::find($request->id);
        if (!Hash::check($request->password, $user->password)) {
            $user->update([
                'password' => Hash::make($request->password)
            ]);

            return ArrayResp(
                Message: "Password Changed Succesfully!",
                NeedCount: FALSE,
                Misc: []
            );
        } else {

            $error = [
                'password' => [
                    'The New password would be different from old password.',
                ]
            ];
            return ArrayBadResp(
                Data: $error,
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }
    }

    public function create_user(Request $request)
    {
        $messages = [
            'full_phone.unique' => 'The phone has already been taken.'
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => [
                'required',
                'email',
                Rule::unique('users')->whereNull('deleted_at')
            ],
            'full_phone' => 'required|unique:users,phone'
        ], $messages);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }
        $cleanedPhoneNumber = str_replace(' ', '', $request->phone);

        $UserData = [
            'customer_id' => 0,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->full_phone,
            'role_id' => 5,
            'password' => Hash::make($cleanedPhoneNumber)
        ];

        // Remove customer_id and change it to id. Set initial auto increment value to 510035 // JkWorkz
        $UserId = User::insertGetId($UserData);

        User::where('id', $UserId)->update(['customer_id' => 510035 + $UserId]);

        $UserData['customer_id'] = 510035 + $UserId;

        return ArrayResp(
            Data: $UserData,
            Message: "User Added Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function mode(Request $request)
    {

        $user = User::find($request->id);

        $user->update([
            'mode' => $request->mode
        ]);


        return ArrayResp(
            Data: $user,
            Message: "Theme Chnaged Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function userExist(Request $request)
    {
        $userExist = User::where('customer_id', $request->customer_id)->exists();

        if ($userExist) {
            return response()->json(['user_exists' => $userExist], 200);
        } else {
            return response()->json(['user_exists' => $userExist], 500);
        }
    }

    public function term_conditions()
    {
        return view('2_AdminPanel.2_Pages.Term&Condition.Term&Condition');
    }

    public function privacy_policy()
    {
        return view('2_AdminPanel.2_Pages.PrivacyPolicy.PrivacyPolicy');
    }

    public function export()
    {
        return Excel::download(new UsersExport, 'users.xlsx');
    }
}

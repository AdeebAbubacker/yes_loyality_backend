<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Ichtrojan\Otp\Otp;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;
use Illuminate\Support\Str;



class ResetPasswordController extends Controller
{

    public function verify_otp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'otp' => 'required|numeric'
        ]);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }
        $user = User::where('email', $request->email)->first();

        $otp = $user->otp;
        $otp_expires = $user->otp_expires;

        if (Carbon::now()->lt($otp_expires) && Hash::check($request->otp, $otp)) {

            $user->tokens()->delete();
            $token = Str::random(32);

            $user->remember_token = Hash::make($token);
            $user->save();

            $data['success'] = true;
            $data['remember_token'] = $user->remember_token;

            return ArrayResp(
                Data: $data,
                Message: "OTP Verified Successfully!",
                NeedCount: FALSE,
                Misc: []
            );
        } else {
            if (Carbon::now()->lt($otp_expires)) {

                $error = [
                    'otp' => ['Invalid OTP.'],
                ];
            } else {
                $error = [
                    'otp' => ['The OTP has been Expired.'],
                ];
            }
            return ArrayBadResp(
                Data: $error,
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }
    }

    public function resetpassword(Request $request)
    {

        $messages = [
            'password.uncompromised' => 'Your password is too weak. Please enter a strong password.',
            'password_confirm.same'  => 'Passwords do not match Please re-enter to confirm.',
            'password.numbers' => 'Password must contain atleast one digit.',
            'password.symbols' => 'Password must contain one special character.',
            'password.mixed' => 'Password must contain one uppercase and lowercase.',
            'password.min' => 'Password must be at least 8 characters long.',
        ];
        $validator = Validator::make($request->all(), [
            'password' => ['required', Password::min(8)->mixedCase()->numbers()->symbols()->uncompromised()],
            'password_confirm' => 'required|same:password',
            'remember_token' => 'required'
        ], $messages);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }
        
        $user = User::where('remember_token', $request->remember_token)->first();

        if ($user) {
            $user->password = Hash::make($request->password);
            $user->remember_token = null;
            $user->save();

            $data['success'] = true;

            return ArrayResp(
                Data: $data,
                Message: "Password Chnaged Successfully!",
                NeedCount: FALSE,
                Misc: []
            );
        } else {
            return ArrayBadResp(
                Message: "Something Went Wrong!",
                Misc: [],
                RespCode: 500,
            );
        }
    }
}

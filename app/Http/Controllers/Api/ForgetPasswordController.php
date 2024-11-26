<?php

namespace App\Http\Controllers\Api;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Notifications\ResetPasswordVerificationNotification;



class ForgetPasswordController extends Controller
{
    public function forgotPassword(Request $request)
    {
        $messages = [
            'email.email' => 'The email field must be a valid email address.',
            'email.required' => 'The email field is required.',
            'email.regex' => 'The email field must be a valid email address.',
        ];
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|regex:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/',
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

        if ($user) {
            $otp = random_int(100000, 999999);
            $expiresAt = Carbon::now()->addMinutes(10);

            $user->update([
                'otp' => Hash::make($otp),
                'otp_expires' => $expiresAt
            ]);

            $user->notify(new ResetPasswordVerificationNotification($otp));

            $success['success'] = true;

            return ArrayResp(
                Data: $success,
                Message: "Otp has been sended Successfully!",
                NeedCount: FALSE,
                Misc: []
            );
        } else {

            $error = [
                'email' => ['User Not Found.'],
            ];
            return ArrayBadResp(
                Data: $error,
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }
    }
}

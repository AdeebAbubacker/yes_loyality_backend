<?php

use App\Models\Date;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Api\AppController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\StoreController;
use App\Http\Controllers\Api\ResetPasswordController;
use App\Http\Controllers\Api\ForgetPasswordController;


/*
|--------------------------------------------------------------------------
| Application APIs
|--------------------------------------------------------------------------
*/
// Route::get("date/{time_zome?}", function ($time_zome) {

//     $dates = Date::get();

//         $timezone = $time_zome ?? env('APP_TIMEZONE');

//    return ArrayResp(
//     Data: $dates,
//     Message: 'Dates Fetched Successfully',
//     NeedCount: FALSE,
//     Misc: [
//         'timezome' => $timezone
//     ]
// );
// });

Route::middleware('auth:api')->controller(AppController::class)->group(function () {
    Route::get('dashboard', 'dashboard')->name('dashboard_data');
    Route::post("store/scan", "scan_qr_code")->name("scan_qr");
});

/*
|--------------------------------------------------------------------------
| User
|--------------------------------------------------------------------------
*/

Route::prefix('user')->group(function () {
    /* -- Prefix: [ /user ] -- */

    Route::controller(UserController::class)->group(function () {

        Route::post('register', 'register')->name('UserRegistration');
        Route::post('login', 'login')->name('Userlogin');
        Route::get('notLogin', 'NotLoginResponse')->name('login');
        Route::post('get-support', 'get_support')->name('get_support');
        Route::post('reset-password', 'reset_password')->name('reset_password');
        Route::post('register-new-device', 'register_new_device')->name('register_new_device');

        Route::middleware('auth:api')->group(function () {
            Route::post('logout', 'logout')->name('Userlogout');
            Route::post('modify', 'edit_profile')->name('EditProfile');
            Route::get('info', 'user_detail')->name('UserDetails'); // NOT NEEDED
            Route::get('customer/info', 'fetch_customer_details')->name('fetch_customer_details');
            Route::get('transaction', 'fetch_transaction')->name('fetch_transactions');
            Route::post('branch', 'user_branch')->name('add_branch'); // NOT NEEDED
            Route::post('password', 'change_password')->name('change_password');
            Route::post('account/delete', 'delete')->name('delete_account');
        });
    });

    Route::controller(ForgetPasswordController::class)->group(function () {
        Route::post('password/forgot', 'forgotPassword')->name('ForgotPassword');
    });

    Route::controller(ResetPasswordController::class)->group(function () {
        Route::post('password/reset', 'resetpassword')->name('ResetPassword');
        Route::post('verify/otp', 'verify_otp')->name('VerifyOTP');

    });
});




/*
|--------------------------------------------------------------------------
| Branch
|--------------------------------------------------------------------------
*/

Route::prefix('branch')->controller(StoreController::class)->group(function () {
    /* -- Prefix: [ /branch ] -- */
    Route::get("list", "fetch_store")->name("FetchStore");
    Route::get("offers/list", "fetch_alloffer")->name("FetchAllOffers");

    Route::middleware('auth:api')->group(function () {
        Route::post("change/{branch_id}", "change_branch")->name("ChangeBranch");
    });

    /* -- Prefix: [ /branch/id ] -- */
    Route::prefix('{branch_id}')->group(function () {
        Route::get('/info', 'store_info')->name('StoreInfo');

        Route::prefix('offers')->group(function () {
            /* -- Prefix: [ /store/offers ] -- */
            Route::get("list", "fetch_offer")->name("FetchOffer");
            Route::get("{offer_id}", "offer_info")->name("OfferInfo");
        });
    });
});


// NOT NEEDED
Route::prefix('loyality-offer')->controller(AppController::class)->group(function () {
    /* -- Prefix: [ /branch ] -- */
    Route::post("qr_transaction", "qr_transaction")->name("QrTransaction");
});

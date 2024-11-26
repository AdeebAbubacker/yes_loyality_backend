<?php

use App\Models\Date;
use Illuminate\Support\Facades\Route;
use App\Http\Middleware\PreventBackHistory;
use App\Http\Controllers\Admin\AuthController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\RulesController;
use App\Http\Controllers\Admin\StoreController;
use App\Http\Controllers\Admin\LoyalityController;
use App\Http\Controllers\Admin\MerchantController;
use App\Http\Controllers\Admin\DashBoardController;
use App\Http\Controllers\Admin\UserTransactionController;

use Illuminate\Support\Facades\DB;

Route::get('/', function () {
    return redirect()->to('admin/login');
});

Route::get("reset_admin_password", [AuthController::class, "reset_admin_password"])->name("reset_admin_password");

Route::controller(AuthController::class)->prefix('admin')->group(function () {

    Route::get("login", "login")->name("LoginView");
    // Route::get("register", "register")->name("RegisterView");
    Route::post("admin_register", "admin_register")->name("AdminRegister");
    Route::post("login_admin", "login_admin")->name("AdminLogin");
    Route::get("support/user", "support_page")->name("SupportPageOuter");
    Route::post('support_form', 'support_form')->name('SupportForm');
});

Route::middleware([PreventBackHistory::class])->group(function () {
    Route::prefix('admin')->middleware('auth')->group(function () {

        Route::controller(AuthController::class)->group(function () {
            Route::get("user_detail", "user_detail")->name("AdminDetail");
            Route::get("logout_admin", "logout_admin")->name("AdminLogout");
            Route::get('customer/info', 'fetch_customer_details')->name('fetch_customer_details');

            Route::get('profile', 'profile')->name('Profile');
            Route::get('edit/profile', 'edit_profile')->name('EditProfile');
            Route::post('edit/details', 'edit')->name('EditDetails');

            Route::post('update/image', 'update_image')->name('UpdateImage');
            Route::post('remove/image', 'remove_image')->name('RemoveImage');
            Route::post('change-password', 'change_password')->name('ChangePassword');

            Route::get('support', 'support')->name('SupportPage');
            Route::post('navbar', 'navbar')->name('Navbar');
        });

        Route::controller(UserController::class)->group(function () {

            Route::get("dashboard", "dashboard")->name("DashboardView");

            Route::prefix('users')->group(function () {
                Route::get("list", "user_list")->name("UserListView");
                Route::get("create", "user_form")->name("UserAddFormView");
                Route::post("edit/{id}", "user_form")->name("UserEditFormView");
                Route::post("password_form/{id?}", "password_form")->name("CreatePasswordtView");


                Route::get("fetch/{id?}", "fetch_users")->name("FetchUser");
                Route::post("add", "add")->name("AddUser");
                Route::post("edit", "edit")->name("EditUser");
                Route::post("change_password", "change_password")->name("ChangeUserPassword");
                Route::post("delete/{id}", "delete")->name("DeleteUser");

                Route::post("user/add", "create_user")->name("LoyalitySectionAddUser");

                Route::post("mode", "mode")->name("UserThemeMode");

                Route::get("userExist", "userExist")->name("UserExist");

                Route::get("export", "export")->name("UserExport");

            });
        });

        Route::controller(StoreController::class)->group(function () {

            Route::prefix('store')->group(function () {
                Route::get("list", "store_list")->name("StoreListView");
                Route::get("create", "store_form")->name("StoreAddFormView");
                Route::post("edit/{id}", "store_form")->name("StoreEditFormView");

                Route::get("fetch", "fetch_store")->name("FetchStore");
                Route::post("add", "add")->name("AddStore");
                Route::post("edit", "edit")->name("EditStore");
                Route::post("delete/{id}", "delete")->name("DeleteStore");
                Route::get("export", "export")->name("StoreExport");

            });

            Route::prefix('storeOffers')->group(function () {
                Route::get("list", "offer_list")->name("OfferListView");
                Route::get("create", "offer_form")->name("OfferAddFormView");
                Route::post("edit/{id}", "offer_form")->name("OfferEditFormView");

                Route::get("fetch", "fetch_offer")->name("FetchOffer");
                Route::post("add", "add_offer")->name("AddOffer");
                Route::post("edit", "edit_offer")->name("EditOffer");
                Route::post("delete/{id}", "delete_offer")->name("DeleteOffer");
                Route::get("export", "offer_export")->name("StoreOfferExport");

            });
        });

        Route::controller(UserTransactionController::class)->group(function () {

            Route::prefix('transaction')->group(function () {
                Route::get("list", "transaction_list")->name("TransactionListView");
                Route::get("create", "transaction_form")->name("TransactioneAddFormView");
                Route::post("edit/{id}", "transaction_form")->name("TransactioneEditFormView");

                Route::get("fetch", "fetch_transactions")->name("FetchTransactions");
                Route::get("fetch_cashiers", "fetch_cashiers")->name("FetchCashiers");
                Route::post("add", "add")->name("AddTransactions");
                Route::post("edit", "edit")->name("EditTransactions");
                Route::post("delete/{id}", "delete")->name("DeleteTransactions");


                Route::get('form', 'form_page')->name('TransactionPage');
                Route::get("export", "export")->name("TransactionExport");

            });
        });

        Route::controller(LoyalityController::class)->group(function () {

            Route::prefix('loyality-offer')->group(function () {
                Route::get("list", "loyality_list")->name("LoyalityListView");
                Route::get("create", "loyality_form")->name("LoyalityAddFormView");
                Route::post("edit/{id}", "loyality_form")->name("LoyalityEditFormView");

                Route::get("fetch", "fetch_list")->name("FetchLoyality");

                Route::get("info", "info")->name("LoyalityOfferInfo");
                Route::post("add", "add")->name("AddLoyalityOffer");
                Route::post("edit", "edit")->name("EditLoyalityOffer");
                Route::post("delete/{id}", "delete")->name("DeleteLoyalityOffer");

                Route::get("offer-list", "offer_list")->name("LoyalityOfferList");
                Route::post("transaction", "transaction")->name("AddLoyalityTransaction");
                Route::get("add/user", "add_user")->name("LoyalityAddUser");
                Route::get('rules', 'loyality_rules')->name("LoyalityRulesList");

                Route::get("export", "export")->name("LoyaltyExport");

            });
        });

        Route::controller(MerchantController::class)->group(function () {

            Route::prefix('merchant')->group(function () {
                Route::get("profile", "profile")->name("MerchantProfile");
                Route::post("form/{id}", "form")->name("MerchantForm");
                Route::post("add", "add")->name("AddMerchant");
                Route::post("edit", "edit")->name("EditMerchant");
                Route::post("delete", "delete")->name("DeleteMerchant");
                Route::get("fetch_currency", "fetch_currency")->name("FetchCurrency");
            });
            Route::prefix('store')->group(function () {
                Route::get("profile", "store_profile")->name("StoreProfile");
            });
        });

        Route::controller(RulesController::class)->group(function () {

            Route::prefix('rules')->group(function () {
                Route::get("list", "list")->name("RulesList");
                Route::get("create", "form")->name("RuleAddFormView");
                Route::post("edit/{id}", "form")->name("RuleEditFormView");
                
                Route::post("generate-qr", "generate_rule_qr")->name("RuleGenerateQr");
                Route::post("qr-page/{id}", "qr_page")->name("QrPage");
                Route::get("download-zip", "download_zip")->name("DownloadZip");
                Route::get("latest-qr/{id}", "latest_qr")->name("LatestQr");


                Route::get("fetch", "fetch")->name("FetchRules");
                Route::post("add", "add")->name("AddRules");
                Route::post("edit", "edit")->name("EditRules");
                Route::post("delete/{id}", "delete")->name("DeleteRules");
            });
        });
    });
});

Route::controller(UserController::class)->group(function () {
    Route::get("term-conditions", "term_conditions")->name("Term&Condition");
    Route::get("privacy-policy", "privacy_policy")->name("PrivacyPolicy");
});

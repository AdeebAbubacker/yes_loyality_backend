<?php

namespace App\Providers;

use App\Models\LoyaltyRule;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Schema::defaultStringLength(191);

        $loyality_rules = LoyaltyRule::get();
        Session::put('Loyality_rules', $loyality_rules);

    }
}

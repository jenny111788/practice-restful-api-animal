<?php

namespace App\Providers;

use Laravel\Passport\Passport;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Passport::routes();

        //自訂 Token 過期時間:access_token 設定核發後15天後過期
        Passport::tokensExpireIn(now()->addDays(15));

        //自訂 Token 過期時間:refresh_token 設定核發後30天後過期
        Passport::refreshTokensExpireIn(now()->addDays(30));
    }
}

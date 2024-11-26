<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Laravel\Passport\HasApiTokens;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

use Illuminate\Foundation\Auth\User as Authenticatable;

/**
 * Class User
 * 
 * @property int $id
 * @property string $name
 * @property string $email
 * @property int $role_id
 * @property string $password
 * @property float $wallet_total
 * @property float $wallet_used
 * @property float $wallet_balance
 * @property Carbon|null $email_verified_at
 * @property string|null $remember_token
 * @property string|null $otp
 * @property Carbon|null $otp_expires
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @property string|null $deleted_at

 * 
 * @property Collection|UserTransaction[] $user_transactions
 *
 * @package App\Models
 */
class User extends Authenticatable
{
	use SoftDeletes, HasApiTokens, HasFactory, Notifiable;
	protected $table = 'users';

	public $timestamps = true;

	protected $casts = [
		'role_id' => 'int',
		'wallet_total' => 'float',
		'wallet_used' => 'float',
		'wallet_balance' => 'float',
		'email_verified_at' => 'datetime',
		'otp_expires' => 'datetime',
		'offer_notify' => 'boolean',
	];

	protected $hidden = [
		'password',
		'remember_token',
	];

	protected $fillable = [
		'name',
		'email',
		'role_id',
		'phone',
		'image',
		'password',
		'branch',
		'wallet_total',
		'wallet_used',
		'wallet_balance',
		'email_verified_at',
		'remember_token',
		'mode',
		'navbar',
		'active',
		'device_token',
		'otp',
		'otp_expires',
		'offer_notify',
	];

	public function user_transactions()
	{
		return $this->hasMany(UserTransaction::class);
	}

	public function branch()
	{
		return $this->belongsTo(Store::class);
	}

	public function loyalty_rule_qrs()
	{
		return $this->hasMany(LoyaltyRuleQr::class);
	}
	
    /**
     * Get the devices associated with the user.
     */
    public function devices()
    {
        return $this->hasMany(RegisteredDevices::class);
    }

}

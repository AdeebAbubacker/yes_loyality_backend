<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class RegisteredDevices extends Model
{
	use SoftDeletes;

	protected $fillable = [
		'user_id',
		'fcm_token',
		'ip_address',
		'platform',
		'location',
		'device_id',
		'device_model',
		'os_version',
		'device_name'
	];

	// Relationship to the User model (optional)
	public function user()
	{
		return $this->belongsTo(User::class);
	}

	public static function user_devices($user_id): array
	{
		return self::join('users', 'devices.user_id', '=', 'users.id') // Join with users table
			->where('users.offer_notify', true)
			->where('registered_devices.user_id', $user_id)
			->pluck('fcm_token') // Extract only the FCM tokens
			->toArray();
	}

	public static function all_fcm_tokens(): array
	{
		return self::join('users', 'devices.user_id', '=', 'users.id') // Join with users table
			->where('users.offer_notify', true)
			->pluck('fcm_token') // Extract only the FCM tokens
			->toArray();
	}
}
<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Store
 * 
 * @property int $id
 * @property string $name
 * @property string|null $location
 * @property bool $active
 * @property string|null $address
 * @property string|null $coordinates
 * @property string|null $email_1
 * @property string|null $email_2
 * @property string|null $phone_1
 * @property string|null $phone_2
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @property string|null $deleted_at
 * 
 * @property Collection|LoyalityOffer[] $loyality_offers
 * @property Collection|StoreOffer[] $store_offers
 * @property Collection|UserTransaction[] $user_transactions
 * @property Collection|User[] $users
 *
 * @package App\Models
 */
class Store extends Model
{
	use SoftDeletes;
	protected $table = 'stores';

	protected $casts = [
		'active' => 'bool'
	];

	protected $fillable = [
		'name',
		'location',
		'active',
		'address',
		'coordinates',
		'key_name',
		'support_name',
		'email_1',
		'email_2',
		'phone_1',
		'phone_2'
	];

	public function loyality_offers()
	{
		return $this->hasMany(LoyalityOffer::class, 'branch_id');
	}
	
    public function latest_loyality_offer()
    {
        return $this->hasOne(LoyalityOffer::class, 'branch_id')->latest();
    }

	public function store_offers()
	{
		return $this->hasMany(StoreOffer::class, 'branch_id');
	}

	public function user_transactions()
	{
		return $this->hasMany(UserTransaction::class);
	}

	public function users()
	{
		return $this->hasMany(User::class, 'branch');
	}
	public function loyalty_rule_qrs()
	{
		return $this->hasMany(LoyaltyRuleQr::class);
	}
}

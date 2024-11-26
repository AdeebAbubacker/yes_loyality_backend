<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class UserTransaction
 * 
 * @property int $id
 * @property int $user_id
 * @property int $store_id
 * @property int $cashier_id
 * @property string $invoice_no
 * @property float $invoice_amt
 * @property int|null $offer_id
 * @property string|null $coin_type
 * @property int|null $coins
 * @property float|null $final_amt
 * @property Carbon $created_at
 * @property Carbon|null $updated_at
 * @property string|null $deleted_at
 * 
 * @property User $user
 * @property LoyalityOffer|null $loyality_offer
 * @property Store $store
 *
 * @package App\Models
 */
class UserTransaction extends Model
{
	use SoftDeletes;
	protected $table = 'user_transactions';

	protected $casts = [
		'user_id' => 'int',
		'store_id' => 'int',
		'cashier_id' => 'int',
		'invoice_amt' => 'float',
		'offer_id' => 'int',
		'coins' => 'int',
		'final_amt' => 'float'
	];

	protected $fillable = [
		'user_id',
		'store_id',
		'cashier_id',
		'invoice_no',
		'invoice_amt',
		'offer_id',
		'coin_type',
		'coins',
		'final_amt'
	];

	public function user()
	{
		return $this->belongsTo(User::class);
	}

	public function loyality_offer()
	{
		return $this->belongsTo(LoyalityOffer::class, 'offer_id');
	}

	public function store()
	{
		return $this->belongsTo(Store::class);
	}
}

<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class LoyalityOffer
 * 
 * @property int $id
 * @property string $name
 * @property string|null $comments
 * @property int $branch_id
 * @property string|null $offer_code
 * @property string|null $slug
 * @property float|null $min_inv_amt
 * @property float|null $max_reduction
 * @property int|null $points_required
 * @property float|null $discount_val
 * @property string|null $discount_type
 * @property int $usage_limit
 * @property Carbon|null $expiry_start
 * @property Carbon|null $expiry_end
 * @property bool $active
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @property string|null $deleted_at
 * 
 * @property Store $store
 *
 * @package App\Models
 */
class LoyalityOffer extends Model
{
	use SoftDeletes;
	protected $table = 'loyality_offers';

	protected $casts = [
		'branch_id' => 'int',
		'min_inv_amt' => 'float',
		'max_reduction' => 'float',
		'points_required' => 'int',
		'discount_val' => 'float',
		'usage_limit' => 'int',
		'expiry_start' => 'datetime',
		'expiry_end' => 'datetime',
		'active' => 'bool'
	];

	protected $fillable = [
		'name',
		'comments',
		'branch_id',
		'offer_code',
		'slug',
		'min_inv_amt',
		'max_reduction',
		'points_required',
		'discount_val',
		'discount_type',
		'usage_limit',
		'expiry_start',
		'expiry_end',
		'active'
	];

	public function store()
	{
		return $this->belongsTo(Store::class, 'branch_id');
	}

	public function user_transactions()
	{
		return $this->hasMany(UserTransaction::class, 'offer_id');
	}
}

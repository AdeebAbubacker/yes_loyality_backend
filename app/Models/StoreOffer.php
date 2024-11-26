<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\SoftDeletes;


/**
 * Class StoreOffer
 * 
 * @property int $id
 * @property string $name
 * @property string|null $comments
 * @property int $branch_id
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @property string|null $deleted_at
 * 
 * @property Store $store
 *
 * @package App\Models
 */
class StoreOffer extends Model
{
	use SoftDeletes;

	protected $table = 'store_offers';
	// public $timestamps = false;

	protected $casts = [
		'branch_id' => 'int',
		'expiry_start' => 'datetime',
		'expiry_end' => 'datetime',
	];

	protected $fillable = [
		'name',
		'comments',
		'branch_id',
		'slug',
		'offer_code',
		'offer_tc',
		'offer_rule',
		'min_inv_amt',
		'max_inv_amt',
		'points',
		'discount',
		'type',
		'discount',
		'usage_limit',
		'expiry_start',
		'expiry_end',
		'active',
	];

	public function store()
	{
		return $this->belongsTo(Store::class, 'branch_id');
	}
}

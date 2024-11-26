<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class LoyaltyRuleQr
 * 
 * @property int $id
 * @property int $rule_id
 * @property int $store_id
 * @property int $user_id
 * @property Carbon $date
 * @property string $qr_image
 * @property int $created_by
 * @property Carbon $created_at
 * @property Carbon|null $updated_at
 * @property string|null $deleted_at
 * 
 * @property User $user
 * @property LoyaltyRule $loyalty_rule
 * @property Store $store
 *
 * @package App\Models
 */
class LoyaltyRuleQr extends Model
{
	use SoftDeletes;
	protected $table = 'loyalty_rule_qrs';

	protected $casts = [
		'rule_id' => 'int',
		'store_id' => 'int',
		'user_id' => 'int',
		'date' => 'datetime',
		'created_by' => 'int'
	];

	protected $fillable = [
		'rule_id',
		'qr_id',
		'store_id',
		'user_id',
		'date',
		'qr_image',
		'created_by'
	];

	public function user()
	{
		return $this->belongsTo(User::class);
	}

	public function loyalty_rule()
	{
		return $this->belongsTo(LoyaltyRule::class, 'rule_id');
	}

	public function store()
	{
		return $this->belongsTo(Store::class);
	}
}

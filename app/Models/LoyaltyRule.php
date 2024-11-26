<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class LoyaltyRule
 * 
 * @property int $id
 * @property float $min_amt
 * @property int $point_received
 * @property float $max_amt
 * @property int|null $sort
 * @property Carbon $created_at
 * @property Carbon|null $updated_at
 * @property string|null $deleted_at
 *
 * @package App\Models
 */
class LoyaltyRule extends Model
{
	use SoftDeletes;
	protected $table = 'loyalty_rules';

	protected $casts = [
		'min_amt' => 'float',
		'point_received' => 'int',
		'max_amt' => 'float',
		'sort' => 'int'
	];

	protected $fillable = [
		'min_amt',
		'point_received',
		'max_amt',
		'sort'
	];

	public function loyalty_rule_qrs()
	{
		return $this->hasMany(LoyaltyRuleQr::class, 'rule_id');
	}
}

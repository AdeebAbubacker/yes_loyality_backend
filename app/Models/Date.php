<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Date
 * 
 * @property Carbon|null $php_date
 * @property Carbon|null $sql_date
 * @property Carbon $created_at
 * @property Carbon|null $updated_at
 * @property string|null $deleted_at
 *
 * @package App\Models
 */
class Date extends Model
{
	use SoftDeletes;
	protected $table = 'date';
	public $incrementing = false;

	protected $casts = [
		'php_date' => 'datetime',
		'sql_date' => 'datetime',
	];

	protected $fillable = [
		'php_date',
		'sql_date',
		'zone',
	];
}

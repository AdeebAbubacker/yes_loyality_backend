<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class AppSetting
 * 
 * @property string $name
 * @property string|null $value
 *
 * @package App\Models
 */
class AppSetting extends Model
{
	protected $table = 'app_settings';
	protected $primaryKey = 'name';
	public $incrementing = false;
	public $timestamps = false;

	protected $fillable = [
		'name',
		'value'
	];
}

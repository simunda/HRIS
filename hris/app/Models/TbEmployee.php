<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id_employee
 * @property integer $id_position
 * @property integer $id_golongan
 * @property string $name
 * @property string $address
 * @property string $city
 * @property string $placeof_birth
 * @property string $dayof_birth
 * @property string $gender
 * @property string $religion
 * @property string $status
 * @property integer $no_children
 * @property string $education
 * @property TbAttendance $tbAttendance
 * @property TbCoopcut $tbCoopcut
 * @property TbPosition $tbPosition
 * @property TbGolongan $tbGolongan
 * @property TbOvertime $tbOvertime
 */
class TbEmployee extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'tb_employee';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'id_employee';

    /**
     * @var array
     */
    protected $fillable = ['id_position', 'id_golongan', 'name', 'address', 'city', 'placeof_birth', 'dayof_birth', 'gender', 'religion', 'status', 'no_children', 'education'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function tbAttendance()
    {
        return $this->hasOne('App\Models\TbAttendance', 'id_employee', 'id_employee');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function tbCoopcut()
    {
        return $this->hasOne('App\Models\TbCoopcut', 'id_employee', 'id_employee');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tbPosition()
    {
        return $this->belongsTo('App\Models\TbPosition', 'id_position', 'id_position');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tbGolongan()
    {
        return $this->belongsTo('App\Models\TbGolongan', 'id_golongan', 'id_golongan');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function tbOvertime()
    {
        return $this->hasOne('App\Models\TbOvertime', 'id_employee', 'id_employee');
    }
}

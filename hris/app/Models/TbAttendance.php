<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id_attendance
 * @property integer $id_employee
 * @property string $month
 * @property integer $no_coming
 * @property integer $no_sick
 * @property integer $no_permits
 * @property integer $no_absent
 * @property TbEmployee $tbEmployee
 */
class TbAttendance extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'tb_attendance';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'id_attendance';

    /**
     * @var array
     */
    protected $fillable = ['id_employee', 'month', 'no_coming', 'no_sick', 'no_permits', 'no_absent'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tbEmployee()
    {
        return $this->belongsTo('App\Models\TbEmployee', 'id_employee', 'id_employee');
    }
}

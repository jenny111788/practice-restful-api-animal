<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Animal extends Model
{
    //
    protected $fillable = [
        'type_id',
        'name',
        'birthday',
        'area',
        'fix',
        'description',
        'personality',
    ];

    //物件關聯：取得動物的分類
    public function type()
    {
        return $this->belongsTo('App\Type');
    }
}

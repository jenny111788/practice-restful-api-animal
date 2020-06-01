<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

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

    //取得動物的刊登人
    public function user()
    {
        return $this->belongsTo('App\User');
    }

    //多對多關聯animal與user
    public function like()
    {
        return $this->belongsToMany('App\User')->withTimestamps();
    }
    
    //Carbon套件：是一個很方便的轉換時間的工具，將時間進行轉換，取得想要的特定日期或格式
    public function getAgeAttribute()
    {
        $diff = Carbon::now()->diff($this->birthday);
        return "{$diff->y}歲{$diff->m}月";
    }
}

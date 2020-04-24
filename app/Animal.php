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
}

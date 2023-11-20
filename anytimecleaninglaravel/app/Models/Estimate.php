<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Estimate extends Model
{
    //
    public $fillable = [
        'email',
        'subject',
        'phone_number',
        'service',
        'message'
    ];
}

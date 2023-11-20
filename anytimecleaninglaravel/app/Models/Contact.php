<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    //
    public $fillable = [
        'email',
        'subject',
        'phone_number',
        'message'
    ];
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Entry extends Model
{
    //
    public $fillable = [
        'email',
        'subject',
        'phone_number',
        'message'
    ];

}

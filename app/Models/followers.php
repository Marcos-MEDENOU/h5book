<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class followers extends Model
{
    use HasFactory;
    protected $fillable = [
        "user_id_connect",
        "user_id"
    ];
}

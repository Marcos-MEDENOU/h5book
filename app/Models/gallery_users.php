<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class gallery_users extends Model
{
    use HasFactory;

    protected $fillable = [
        'file_profile',
        'cover_img'
    ];
}

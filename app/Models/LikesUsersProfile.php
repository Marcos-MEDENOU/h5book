<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LikesUsersProfile extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'id_gallery'
    ];
}

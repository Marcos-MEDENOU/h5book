<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommentUserPost extends Model
{
    use HasFactory;
    protected $fillable = [
        'comment',
        'user_id',
        'id_post'
    ];
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
class ChatController extends Controller
{
    //

    public function index(Request $request)
    {
        return Inertia::render('Chat/index');
    }
    public function chatInstance(Request $request)
    {
        return Inertia::render('Chat/chatInstance');
    }
}

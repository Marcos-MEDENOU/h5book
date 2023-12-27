<?php

use App\Http\Controllers\FollowersController;
use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return Inertia::render('Accueil', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
})->middleware(['auth']);


Route::get('/accueil', function () {
    return Inertia::render('Accueil');
})->middleware(['auth', 'verified'])->name('accueil');

Route::get('/friends', [FollowersController::class, 'index'])->middleware(['auth', 'verified'])->name('friends');

Route::get('/about', function () {
    return Inertia::render('Users/About');
})->middleware(['auth', 'verified'])->name('about');

Route::get('/photos', function () {
    return Inertia::render('Users/Photos');
})->middleware(['auth', 'verified'])->name('photos');

Route::get('/newsfeed', function () {
    return Inertia::render('Users/Newsfeed');
})->middleware(['auth', 'verified'])->name('newsfeed');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';

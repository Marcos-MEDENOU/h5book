<?php

use App\Http\Controllers\FollowersController;
use App\Http\Controllers\GalleryUsersController;
use App\Http\Controllers\LikesUsersProfileController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SocialiteController;
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
Route::post('/followingUser', [FollowersController::class, 'followingUser'])->name('followingUser');
Route::post('/searchInputFriend', [FollowersController::class, 'searchInputFriend'])->name('searchInputFriend');
Route::delete('/unsubscribe', [FollowersController::class, 'unsubscribe'])->name('unsubscribe');
Route::get('/getFollowers', [FollowersController::class, 'getFollowers'])->name('getFollowers');

Route::get('/lastImgCover', [GalleryUsersController::class, 'lastImgCover'])->name('lastImgCover');
Route::post('/storeCover', [GalleryUsersController::class, 'storeCover'])->name('galleryUser.storeCover');
Route::post('/store', [GalleryUsersController::class, 'store'])->name('galleryUser.store');
Route::post('/uploadImgUser', [GalleryUsersController::class, 'uploadImgUser'])->name('uploadImgUser');
Route::delete('/deleteCover', [GalleryUsersController::class, 'deleteCover'])->name('deleteCover');
Route::delete('/deleteImage', [GalleryUsersController::class, 'deleteImage'])->name('deleteImage');
Route::get('/showImage/{id}', [GalleryUsersController::class, 'showImage'])->name('showImage');

Route::post('/openCovers', [GalleryUsersController::class, 'openCovers'])->name('openCovers');
Route::delete('/supCovers', [GalleryUsersController::class, 'supCovers'])->name('supCovers');
Route::delete('/supOneCoverImg', [GalleryUsersController::class, 'supOneCoverImg'])->name('supOneCoverImg');
Route::delete('/deleteProfil', [GalleryUsersController::class, 'deleteProfil'])->name('deleteProfil');
Route::get('/postProfil/{id}/{image}', [GalleryUsersController::class, 'postProfil'])->name('postProfil');

Route::post('/addLikeFile', [LikesUsersProfileController::class, 'store'])->name('addLikeFile');
Route::post('/allLikeFile', [LikesUsersProfileController::class, 'allLikeFile'])->name('allLikeFile');


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

# Socialite URLs
// La redirection vers le provider
Route::get("redirect/{provider}", [SocialiteController::class, 'redirect'])->name('socialite.redirect');

// Le callback du provider
Route::get("callback/{provider}", [SocialiteController::class, 'callback'])->name('socialite.callback');

require __DIR__.'/auth.php';

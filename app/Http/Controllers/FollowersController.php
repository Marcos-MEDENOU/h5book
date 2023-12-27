<?php

namespace App\Http\Controllers;

use App\Models\followers;
use Illuminate\Http\Request;
use Inertia\Inertia;

class FollowersController extends Controller
{
    /**
     * Fonction pour afficher la page friends
     * By Kola
     */
    public function index()
    {
        $allUsers = User::all()->toArray();
        return Inertia::render('Users/Friends', []);
    }

    // Fonction pour afficher les amis de l'utilisateur connecté
    // Fonction faite par Kola
    public function getFollowers()
    {

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(followers $followers)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(followers $followers)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, followers $followers)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(followers $followers)
    {
        //
    }
}

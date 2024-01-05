<?php

namespace App\Http\Controllers;

use App\Models\CommentsUsersProfile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentsUsersProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
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
     * By KolaDev
     */
    public function store(Request $request)
    {
        // Récupération de l'identifiant de la personne connectée
        $identifiant = Auth::user()->id;

        // Récupérons l'identifiant de l'image
        $idImage = intval($request->tableau["id"]);
        
        // Récupérons le commentaire fait
        $comment = nl2br($request->comment);

        try {
            CommentsUsersProfile::create([
                'comment' => $comment,
                'user_id' => $identifiant,
                'id_gallery' => $idImage
            ]);
            return response()->json(["success" => true]);
        } catch (\Throwable $th) {
            return response()->json(["error" => "Une erreur est subvenue lors de l'enregistrement"]);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(CommentsUsersProfile $commentsUsersProfile)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(CommentsUsersProfile $commentsUsersProfile)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, CommentsUsersProfile $commentsUsersProfile)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(CommentsUsersProfile $commentsUsersProfile)
    {
        //
    }
}

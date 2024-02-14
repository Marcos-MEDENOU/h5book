<?php

namespace App\Http\Controllers;

use App\Models\CommentUserPost;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentUserPostController extends Controller
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
     */
    public function store(Request $request)
    {
        // Récupération de l'identifiant de la personne connectée
        $identifiant = Auth::user()->id;

        // Récupérons l'identifiant de l'image
        $idPost = intval($request->tableau["id"]);

        // Récupérons le commentaire fait
        $comment = nl2br($request->comment);

        try {
            CommentUserPost::create([
                'comment' => $comment,
                'user_id' => $identifiant,
                'id_post' => $idPost
            ]);
            return response()->json(["success" => true]);
        } catch (\Throwable $th) {
            return response()->json(["error" => "Une erreur est subvenue lors de l'enregistrement"]);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(CommentUserPost $commentUserPost)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(CommentUserPost $commentUserPost)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, CommentUserPost $commentUserPost)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(CommentUserPost $commentUserPost)
    {
        //
    }
}

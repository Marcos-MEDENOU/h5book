<?php

namespace App\Http\Controllers;

use App\Models\gallery_users;
use App\Models\LikeUserPost;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LikeUserPostController extends Controller
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
        $id = Auth::user()->id;
        // Vérifions si l'utilisateur connecté n'a pas aimé cette photo
        $verif = LikeUserPost::where("user_id", $id)->where("id_post", intval($request->image["id"]))->first();
        if ($verif !== null) {
            try {
                $verif->delete();
                return response()->json(["success" => true]);
            } catch (\Throwable $th) {
                return response()->json(["error" => "Une erreur est subvenue lors de la suppression !!!"]);
            }
        } else {
            try {
                LikeUserPost::create([
                    'user_id' => intval($id),
                    'id_post' => intval($request->image["id"])
                ]);
                return response()->json(["success" => "Opération réussie !!!"]);
            } catch (\Throwable $th) {
                return response()->json(["error" => "Une erreur est subvenue lors de l'enregistrement !!!"]);
            }
        }
    }

    /**
     * 
     * By KolaDev
     */
    public function allLikeByPost(Request $request)
    {
        $id = Auth::user()->id;
        // Récupérons le nombre de likes qu'à cette publication
        $countLike = LikeUserPost::where("id_post", intval($request->image["id"]))->count("id_post");

        $verif = LikeUserPost::where("user_id", $id)->where("id_post", intval($request->image["id"]))->first();
        $trueVariable = false;
        if ($verif !== null) {
            $trueVariable = true;
        }

        $userlike = User::select("users.id", "users.name")
        ->join("like_user_posts", "like_user_posts.user_id", "=", "users.id")
        ->where("like_user_posts.id_post", intval($request->image["id"]))->get()->toArray();
        
        $tableau = [];
        for ($i = 0; $i < count($userlike); $i++) {
            // Récupérons la dernière image de profil de l'utilisateur
            $getLast = gallery_users::where("user_id", intval($userlike[$i]["id"]))->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();
            if ($getLast !== null) {
                $tableau[$i] = $userlike[$i];
                $tableau[$i]["image"] = $getLast->file_profile;
            } else {
                $tableau[$i] = $userlike[$i];
            }
        }
        $userlike = $tableau;

        return response()->json(["number" => $countLike, "variable" => $trueVariable, "userLike" => $userlike]);
    }

    /**
     * Display the specified resource.
     */
    public function show(LikeUserPost $likeUserPost)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(LikeUserPost $likeUserPost)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, LikeUserPost $likeUserPost)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(LikeUserPost $likeUserPost)
    {
        //
    }
}

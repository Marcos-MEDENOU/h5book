<?php

namespace App\Http\Controllers;

use App\Models\gallery_users;
use App\Models\LikesUsersProfile;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LikesUsersProfileController extends Controller
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
        $id = Auth::user()->id;
        // Vérifions si l'utilisateur connecté n'a pas aimé cette photo
        $verif = LikesUsersProfile::where("user_id", $id)->where("id_gallery", intval($request->image["id"]))->first();
        if ($verif !== null) {
            try {
                $verif->delete();
                return response()->json(["success" => true]);
            } catch (\Throwable $th) {
                return response()->json(["error" => "Une erreur est subvenue lors de la suppression !!!"]);
            }
        } else {
            try {
                LikesUsersProfile::create([
                    'user_id' => intval($id),
                    'id_gallery' => intval($request->image["id"])
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
    public function allLikeFile(Request $request)
    {
        $id = Auth::user()->id;
        // Récupérons le nombre de likes qu'à cette image
        $countLike = LikesUsersProfile::where("id_gallery", intval($request->image["id"]))->count("id_gallery");

        $verif = LikesUsersProfile::where("user_id", $id)->where("id_gallery", intval($request->image["id"]))->first();
        $trueVariable = false;
        if ($verif !== null) {
            $trueVariable = true;
        }

        $userlike = User::select("users.id", "users.name")
        ->join("likes_users_profiles", "likes_users_profiles.user_id", "=", "users.id")
        ->where("id_gallery", intval($request->image["id"]))->get()->toArray();
        
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
    public function show(LikesUsersProfile $likesUsersProfile)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(LikesUsersProfile $likesUsersProfile)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, LikesUsersProfile $likesUsersProfile)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(LikesUsersProfile $likesUsersProfile)
    {
        //
    }
}

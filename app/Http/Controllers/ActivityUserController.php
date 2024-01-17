<?php

namespace App\Http\Controllers;

use App\Models\CommentsUsersProfile;
use App\Models\gallery_users;
use App\Models\LikesUsersProfile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class ActivityUserController extends Controller
{
    //

    public function index($id)
    {
        // Récupérons toutes les données de la personne
        $gallery = new GalleryUsersController();
        $tableau = $gallery::essentialData($id);
        
        $allFilesProfils = gallery_users::select("gallery_users.file_profile", "gallery_users.id", "gallery_users.user_id", "gallery_users.created_at", "users.name", "users.id as idUser")
        ->join("users", "users.id", "=", "gallery_users.user_id")
        ->where("user_id", $id)->orderBy("created_at", "desc")->whereNotNull("file_profile")->get()->toArray();

        if(count($allFilesProfils) > 0) {
            for($i=0; $i<count($allFilesProfils); $i++) {
                
            // Récupérons le nombre de likes qu'à cette image
            $countLike = LikesUsersProfile::where("id_gallery", $allFilesProfils[$i]["id"])->count("id_gallery");

            // Récupérons le nombre de commentaires qu'à cette image
            $countComment = CommentsUsersProfile::where("id_gallery", $allFilesProfils[$i]["id"])->count("id_gallery");

            $allFilesProfils[$i]["likes"] = $countLike;
            $allFilesProfils[$i]["comments"] = $countComment;

            
            $identifiant = Auth::user()->id;
            // Vérifions si l'utilisateur connecté n'a pas aimé cette photo
            $verif = LikesUsersProfile::where("user_id", $identifiant)->where("id_gallery", $allFilesProfils[$i]["id"])->first();
            $trueVariable = false;
            if ($verif !== null) {
                $trueVariable = true;
            }
            $allFilesProfils[$i]["trueVariable"] = $trueVariable;
            }
        }
        
        $tableau["allFilesProfils"] = $allFilesProfils;
        return Inertia::render("Users/Activity", $tableau);
    }

    public function allFilPro(Request $request)
    {
        // Récupérons toutes les données de la personne
        $gallery = new GalleryUsersController();
        $tableau = $gallery::essentialData($request->user);
        
        $allFilesProfils = gallery_users::select("gallery_users.file_profile", "gallery_users.id", "gallery_users.user_id", "gallery_users.created_at", "users.name", "users.id as idUser")
        ->join("users", "users.id", "=", "gallery_users.user_id")
        ->where("user_id", $request->user)->orderBy("created_at", "desc")->whereNotNull("file_profile")->get()->toArray();

        if(count($allFilesProfils) > 0) {
            for($i=0; $i<count($allFilesProfils); $i++) {
                
            // Récupérons le nombre de likes qu'à cette image
            $countLike = LikesUsersProfile::where("id_gallery", $allFilesProfils[$i]["id"])->count("id_gallery");

            // Récupérons le nombre de commentaires qu'à cette image
            $countComment = CommentsUsersProfile::where("id_gallery", $allFilesProfils[$i]["id"])->count("id_gallery");

            $allFilesProfils[$i]["likes"] = $countLike;
            $allFilesProfils[$i]["comments"] = $countComment;

            
            $identifiant = Auth::user()->id;
            // Vérifions si l'utilisateur connecté n'a pas aimé cette photo
            $verif = LikesUsersProfile::where("user_id", $identifiant)->where("id_gallery", $allFilesProfils[$i]["id"])->first();
            $trueVariable = false;
            if ($verif !== null) {
                $trueVariable = true;
            }
            $allFilesProfils[$i]["trueVariable"] = $trueVariable;
            }
        }
        
        $tableau["allFilesProfils"] = $allFilesProfils;
        return response()->json($tableau);
    }
}

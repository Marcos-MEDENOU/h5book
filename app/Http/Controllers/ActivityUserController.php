<?php

namespace App\Http\Controllers;

use App\Models\CommentsUsersProfile;
use App\Models\followers;
use App\Models\gallery_users;
use App\Models\LikesUsersProfile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;

class ActivityUserController extends Controller
{
    //

    public function index($id)
    {
        // Récupérons l'identifiant de la personne connectée
        $ident = Auth::user()->id;

        // Récupérons la dernière image de profil de l'utilisateur connecté
        $lastImgConnect = gallery_users::where("user_id", $ident)->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();

        // Récupérons toutes les données de la personne
        $gallery = new GalleryUsersController();
        $tableau = $gallery::essentialData($id);

        $allFilesProfils = gallery_users::select("gallery_users.file_profile", "gallery_users.id", "gallery_users.user_id", "gallery_users.created_at", "users.name", "users.id as idUser")
            ->join("users", "users.id", "=", "gallery_users.user_id")
            ->where("gallery_users.user_id", $id)->orderBy("gallery_users.created_at", "desc")->whereNotNull("gallery_users.file_profile")->get()->toArray();

        if (count($allFilesProfils) > 0) {
            for ($i = 0; $i < count($allFilesProfils); $i++) {

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

        $bool = false;

        if ($ident === intval($id)) {
            $bool = true;
        } else {
            // Vérifions si celui qui est connecté est relié avec la personne ayant $id
            $verification = followers::where("user_id_connect", $ident)->where("user_id", $id)->first();
            if ($verification !== null) {
                $bool = true;
            }
        }


        $posts = DB::table('posts as p')
            ->select(
                'u_creator.name as creator_name',
                'p.id',
                'p.uuid',
                'p.body',
                'p.bgc',
                'p.image',
                'p.video',
                'p.created_at',
                DB::raw('GROUP_CONCAT(CONCAT(u_tagged.id, "-", u_tagged.name)) as tagged_names'),
                'p.user_id'
            )
            ->leftJoin('users as u_creator', 'p.user_id', '=', 'u_creator.id')
            ->leftJoin('tags_posts as tp', 'p.uuid', '=', 'tp.uuid')
            ->leftJoin('tags_users as tu', 'tp.uuid', '=', 'tu.uuid')
            ->leftJoin('users as u_tagged', 'tu.user_id', '=', 'u_tagged.id')
            ->groupBy('p.id')
            ->where('p.user_id', $id)
            ->orWhere('u_tagged.id', $id)
            ->orderBy('p.created_at', 'desc')
            ->get();

        foreach ($posts as $key => $post) {
            $lastImg = gallery_users::select("gallery_users.file_profile", "gallery_users.id", "gallery_users.user_id", "gallery_users.created_at")
                ->where("user_id", $post->user_id)->orderBy("created_at", "desc")->whereNotNull("gallery_users.file_profile")->first();
            $post->image_user = $lastImg !== null ? $lastImg->file_profile : null;
        }

        $tableau["allFilesProfils"] = $allFilesProfils;
        $tableau["lastImgConnect"] = $lastImgConnect;
        $tableau["posts"] = $posts;
        $tableau["exist"] = $bool;
        return Inertia::render("Users/Activity", $tableau);
    }

    public function allFilPro(Request $request)
    {
        // Récupérons l'identifiant de la personne connectée
        $ident = Auth::user()->id;

        // Récupérons la dernière image de profil de l'utilisateur connecté
        $lastImgConnect = gallery_users::where("user_id", $ident)->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();

        // Récupérons toutes les données de la personne
        $gallery = new GalleryUsersController();
        $tableau = $gallery::essentialData($request->user);

        $allFilesProfils = gallery_users::select("gallery_users.file_profile", "gallery_users.id", "gallery_users.user_id", "gallery_users.created_at", "users.name", "users.id as idUser")
            ->join("users", "users.id", "=", "gallery_users.user_id")
            ->where("gallery_users.user_id", $request->user)->orderBy("gallery_users.created_at", "desc")->whereNotNull("gallery_users.file_profile")->get()->toArray();

        if (count($allFilesProfils) > 0) {
            for ($i = 0; $i < count($allFilesProfils); $i++) {

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
        $tableau["lastImgConnect"] = $lastImgConnect;
        return response()->json($tableau);
    }

    public function about($id)
    {
        // Récupérons toutes les données de la personne
        $gallery = new GalleryUsersController();
        $tableau = $gallery::essentialData($id);

        return Inertia::render("Users/About", $tableau);
    }
}
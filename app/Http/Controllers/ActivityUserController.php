<?php

namespace App\Http\Controllers;

use App\Models\CommentsUsersProfile;
use App\Models\CommentUserPost;
use App\Models\followers;
use App\Models\gallery_users;
use App\Models\LikesUsersProfile;
use App\Models\LikeUserPost;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;

class ActivityUserController extends Controller
{
    
        // Fonction pour récupérer tous ceux qui sont abonnés à l'utilisateur
        // By KolaDev
    public function searchInputFriendAbonnees(Request $request)
    {
        // Les données de l'utilisateur
        // $idUserConnect = Auth::user()->id;
        $idUserConnect = null;
        $us = User::where("uuid", $request->uuid)->first();
        if($us !== null)
        {
            // Récupérons l'identifiant de l'utilisateur
            $idUserConnect = $us->id;
        }

        // Récupérons les abonnés de l'utilisateur
        $abonnees = followers::where("user_id", $idUserConnect)->get()->toArray();

        if (count($abonnees) === 0) {    
            $getFol = [];
        } else {
            // Récupération de tous les id des utilisateurs
            $identifiants = [];

            foreach ($abonnees as $key => $val) {
                array_push($identifiants, $val["user_id_connect"]);
            }

            $table = [];
            $getFol = User::whereIn("id", $identifiants)->where("name", "like", "%" . $request->search . "%")
            ->get()->toArray();

            for ($i = 0; $i < count($getFol); $i++) {
                // Récupérons la dernière image de profil de l'utilisateur
                $getLast = gallery_users::where("user_id", intval($getFol[$i]["id"]))->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();

                $link = followers::where("user_id", intval($getFol[$i]["id"]))->where("user_id_connect", $idUserConnect)->get()->toArray();

                $link1 = followers::where("user_id_connect", $idUserConnect)->where("user_id", intval($getFol[$i]["id"]))->get()->toArray();
                
                if ($getLast !== null) {
                    $table[$i] = $getFol[$i];
                    $table[$i]["image"] = $getLast->file_profile;
                } else {
                    $table[$i] = $getFol[$i];
                }
                $table[$i]["abonne"] = $link[0]["created_at"] ?? null;
                $table[$i]["lier"] = $link1[0]["created_at"] ?? null;
            }

            $getFol = $table;
        }

        return response()->json($getFol);
    }

    public function getAbonnees(Request $request)
    {
        // Les données de l'utilisateur
        $us = User::where("uuid", $request->uuid)->first();
        if($us !== null)
        {
            // Récupérons l'identifiant de l'utilisateur
            $id = $us->id;

            // Récupérons toutes les données de la personne
            $gallery = new GalleryUsersController();
            $tableau = $gallery::essentialData($id);

            // Récupérons les abonnés de l'utilisateur
            $abonnees = followers::where("user_id", $id)->get()->toArray();
    
            if (count($abonnees) === 0) {    
                $getFol = [];
            } else {
                // Récupération de tous les id des utilisateurs
                $identifiants = [];
    
                foreach ($abonnees as $key => $val) {
                    array_push($identifiants, $val["user_id_connect"]);
                }
    
                $table = [];
                $getFol = User::whereIn("id", $identifiants)->get()->toArray();
                for ($i = 0; $i < count($getFol); $i++) {
                    // Récupérons la dernière image de profil de l'utilisateur
                    $getLast = gallery_users::where("user_id", intval($getFol[$i]["id"]))->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();
    
                    $link = followers::where("user_id", intval($getFol[$i]["id"]))->where("user_id_connect", $id)->get()->toArray();

                    $link1 = followers::where("user_id_connect", $id)->where("user_id", intval($getFol[$i]["id"]))->get()->toArray();
                    
                    if ($getLast !== null) {
                        $table[$i] = $getFol[$i];
                        $table[$i]["image"] = $getLast->file_profile;
                    } else {
                        $table[$i] = $getFol[$i];
                    }
                    $table[$i]["abonne"] = $link[0]["created_at"] ?? null;
                    $table[$i]["lier"] = $link1[0]["created_at"] ?? null;
                }
    
                $getFol = $table;
            }

            $tableau["userFollowing"] = $getFol;

            return response()->json($tableau);
        }
    }

    public function abonnees($uuid)
    {
        // Les données de l'utilisateur
        $us = User::where("uuid", $uuid)->first();
        if($us !== null)
        {
            // Récupérons l'identifiant de l'utilisateur
            $id = $us->id;

            // Récupérons toutes les données de la personne
            $gallery = new GalleryUsersController();
            $tableau = $gallery::essentialData($id);

            // Récupérons les abonnés de l'utilisateur
            $abonnees = followers::where("user_id", $id)->get()->toArray();
    
            if (count($abonnees) === 0) {    
                $getFol = [];
            } else {
                // Récupération de tous les id des utilisateurs
                $identifiants = [];
    
                foreach ($abonnees as $key => $val) {
                    array_push($identifiants, $val["user_id_connect"]);
                }
    
                $table = [];
                $getFol = User::whereIn("id", $identifiants)->get()->toArray();
                for ($i = 0; $i < count($getFol); $i++) {
                    // Récupérons la dernière image de profil de l'utilisateur
                    $getLast = gallery_users::where("user_id", intval($getFol[$i]["id"]))->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();
    
                    $link = followers::where("user_id", intval($getFol[$i]["id"]))->where("user_id_connect", $id)->get()->toArray();

                    $link1 = followers::where("user_id_connect", $id)->where("user_id", intval($getFol[$i]["id"]))->get()->toArray();
                    
                    if ($getLast !== null) {
                        $table[$i] = $getFol[$i];
                        $table[$i]["image"] = $getLast->file_profile;
                    } else {
                        $table[$i] = $getFol[$i];
                    }
                    $table[$i]["abonne"] = $link[0]["created_at"] ?? null;
                    $table[$i]["lier"] = $link1[0]["created_at"] ?? null;
                }
    
                $getFol = $table;
            }

            $tableau["userFollowing"] = $getFol;

            return Inertia::render('Users/Abonnes/Abonne', $tableau);
        }
    }

    // Fonction pour afficher tous ceux que suis l'utilisateur
    public function abonnements($uuid)
    {
        // Les données de l'utilisateur
        $us = User::where("uuid", $uuid)->first();
        if($us !== null)
        {
            // Récupérons l'identifiant de l'utilisateur
            $id = $us->id;

            // Récupérons toutes les données de la personne
            $gallery = new GalleryUsersController();
            $tableau = $gallery::essentialData($id);

            $getFollowing = followers::where("user_id_connect", $id)->get()->toArray();
    
    
            if (count($getFollowing) === 0) {
                $follow = User::whereNotIn("id", [$id])->get()->toArray();
    
                $tab = [];
                for ($i = 0; $i < count($follow); $i++) {
                    // Récupérons la dernière image de profil de l'utilisateur
                    $getLast = gallery_users::where("user_id", intval($follow[$i]["id"]))->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();
                    if ($getLast !== null) {
                        $tab[$i] = $follow[$i];
                        $tab[$i]["image"] = $getLast->file_profile;
                    } else {
                        $tab[$i] = $follow[$i];
                    }
                }
                $follow = $tab;
    
                $getFol = [];
            } else {
                // Récupération de tous les id des utilisateurs
                $identifiants = [];
    
                foreach ($getFollowing as $key => $val) {
                    array_push($identifiants, $val["user_id"]);
                }
    
                $table = [];
                $getFol = User::whereIn("id", $identifiants)->get()->toArray();
                for ($i = 0; $i < count($getFol); $i++) {
                    // Récupérons la dernière image de profil de l'utilisateur
                    $getLast = gallery_users::where("user_id", intval($getFol[$i]["id"]))->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();
    
                    $link = followers::where("user_id_connect", $id)->where("user_id", intval($getFol[$i]["id"]))->get()->toArray();
    
                    if ($getLast !== null) {
                        $table[$i] = $getFol[$i];
                        $table[$i]["image"] = $getLast->file_profile;
                        $table[$i]["abonne"] = $link[0]["created_at"] ?? null;
                    } else {
                        $table[$i] = $getFol[$i];
                        $table[$i]["abonne"] = $link[0]["created_at"] ?? null;
                    }
                }
    
                $getFol = $table;
    
                array_push($identifiants, $id);
    
                $tab1 = [];
                $follow = User::whereNotIn("id", $identifiants)->get()->toArray();
                for ($i = 0; $i < count($follow); $i++) {
                    // Récupérons la dernière image de profil de l'utilisateur
                    $getLast = gallery_users::where("user_id", intval($follow[$i]["id"]))->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();
                    if ($getLast !== null) {
                        $tab1[$i] = $follow[$i];
                        $tab1[$i]["image"] = $getLast->file_profile;
                    } else {
                        $tab1[$i] = $follow[$i];
                    }
                }
    
                $follow = $tab1;
            }

            $tableau["userFollowing"] = $getFol;
            $tableau["follow"] = $follow;

            return Inertia::render('Users/Abonnes/Abonnement', $tableau);
        }
    }

    public function index($id)
    {
        // Récupérons l'identifiant de la personne connectée
        $ident = Auth::user()->id;

        // Récupérons la dernière image de profil de l'utilisateur connecté
        $lastImgConnect = gallery_users::where("user_id", $ident)->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();

        // Récupérons toutes les données de la personne
        $gallery = new GalleryUsersController();
        $tableau = $gallery::essentialData($id);

        $allFilesProfils = DB::table("gallery_users")->select("gallery_users.file_profile", "gallery_users.id", "gallery_users.user_id", "gallery_users.created_at", "users.name", "users.id as idUser")
            ->join("users", "users.id", "=", "gallery_users.user_id")
            ->where("gallery_users.user_id", $id)->orderBy("gallery_users.created_at", "desc")->whereNotNull("gallery_users.file_profile")->get()->toArray();

        if (count($allFilesProfils) > 0) {
            for ($i = 0; $i < count($allFilesProfils); $i++) {

                // Récupérons le nombre de likes qu'à cette image
                $countLike = LikesUsersProfile::where("id_gallery", $allFilesProfils[$i]->id)->count("id_gallery");

                // Récupérons le nombre de commentaires qu'à cette image
                $countComment = CommentsUsersProfile::where("id_gallery", $allFilesProfils[$i]->id)->count("id_gallery");

                $allFilesProfils[$i]->likes = $countLike;
                $allFilesProfils[$i]->comments = $countComment;

                $identifiant = Auth::user()->id;
                // Vérifions si l'utilisateur connecté n'a pas aimé cette photo
                $verif = LikesUsersProfile::where("user_id", $identifiant)->where("id_gallery", $allFilesProfils[$i]->id)->first();
                $trueVariable = false;
                if ($verif !== null) {
                    $trueVariable = true;
                }
                $allFilesProfils[$i]->trueVariable = $trueVariable;
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
            DB::raw('(SELECT GROUP_CONCAT(CONCAT(u_tagged.id, "-", u_tagged.name)) FROM tags_users tu INNER JOIN users u_tagged ON tu.user_id = u_tagged.id WHERE tu.uuid = p.uuid) as tagged_names'),
            'p.user_id'
        )
        ->leftJoin('users as u_creator', 'p.user_id', '=', 'u_creator.id')
        ->where("p.user_id", $id)
        ->orWhere(function($query) use ($id) {
            $query->whereRaw("EXISTS (SELECT 1 FROM tags_users tu WHERE tu.uuid = p.uuid AND tu.user_id = ?)", [$id]);
        })
        ->orderBy('p.created_at', 'desc')
        ->get();
    

            $merges = $allFilesProfils;

            if(count($posts) > 0)
            {
                foreach ($posts as $key => $post) {
                    $lastImg = gallery_users::select("gallery_users.file_profile", "gallery_users.id", "gallery_users.user_id", "gallery_users.created_at")
                        ->where("user_id", $post->user_id)->orderBy("created_at", "desc")->whereNotNull("gallery_users.file_profile")->first();
                    $post->image_user = $lastImg !== null ? $lastImg->file_profile : null;
                    
                // Récupérons le nombre de likes qu'à cette publication
                $countLike = LikeUserPost::where("id_post", $post->id)->count("id_post");

                // Récupérons le nombre de commentaires qu'à cette publication
                $countComment = CommentUserPost::where("id_post", $post->id)->count("id_post");

                $post->likes = $countLike;
                $post->comments = $countComment;
                
                $identifiant = Auth::user()->id;
                // Vérifions si l'utilisateur connecté n'a pas aimé cette photo
                $verif = LikeUserPost::where("user_id", $identifiant)->where("id_post", $post->id)->first();
                $variableTwo = false;
                if ($verif !== null) {
                    $variableTwo = true;
                }
                $post->trueVariable = $variableTwo;
                }
                // On met les deux tableaux ensembles
                $merges = array_merge($allFilesProfils, $posts->toArray());
                
                // Tri du tableau fusionné selon la date de création
                usort($merges, function ($a, $b) {
                    // return strtotime($a->created_at) - strtotime($b->created_at);
                    return strtotime($b->created_at) - strtotime($a->created_at);
                });
            }

        $tableau["mergesTab"] = $merges;
        $tableau["allFilesProfils"] = $allFilesProfils;
        $tableau["lastImgConnect"] = $lastImgConnect;
        $tableau["posts"] = $posts;
        $tableau["exist"] = $bool;
        return Inertia::render("Users/Activity", $tableau);
    }


    // Fonction de comparaison personnalisée
    public function comparer_dates($a, $b)
    {
        return strtotime($a['created_at']) - strtotime($b['created_at']);
    }

    public function allFilPro(Request $request)
    {
        $allFilesProfils = DB::table("gallery_users")->select("gallery_users.file_profile", "gallery_users.id", "gallery_users.user_id", "gallery_users.created_at", "users.name", "users.id as idUser")
            ->join("users", "users.id", "=", "gallery_users.user_id")
            ->where("gallery_users.user_id", $request->table["user_id"])
            ->where("gallery_users.id", $request->table["id"])
            ->orderBy("gallery_users.created_at", "desc")->whereNotNull("gallery_users.file_profile")->first();

        if ($allFilesProfils !== null) {
                // Récupérons le nombre de likes qu'à cette image
                $countLike = LikesUsersProfile::where("id_gallery", $allFilesProfils->id)->count("id_gallery");

                // Récupérons le nombre de commentaires qu'à cette image
                $countComment = CommentsUsersProfile::where("id_gallery", $allFilesProfils->id)->count("id_gallery");

                $allFilesProfils->likes = $countLike;
                $allFilesProfils->comments = $countComment;


                $identifiant = Auth::user()->id;
                // Vérifions si l'utilisateur connecté n'a pas aimé cette photo
                $verif = LikesUsersProfile::where("user_id", $identifiant)->where("id_gallery", $allFilesProfils->id)->first();
                $trueVariable = false;
                if ($verif !== null) {
                    $trueVariable = true;
                }
                $allFilesProfils->trueVariable = $trueVariable;

                // Message à envoyer
                $message = null;

                if($trueVariable && $countLike > 1)
                {
                    $message = "Vous et " . ($countLike - 1) . " autre(s) personne(s) ont aimé cette photo.";
                } elseif($trueVariable && $countLike === 1)
                {
                    $message = "Vous avez aimé cette photo.";
                } elseif($countLike === 1)
                {
                    $message = $countLike . " personne a aimé cette photo.";
                } else {
                    $message = $countLike . " personne(s) ont aimé cette photo.";
                }

                return response()->json(["success" => $message, "countLike" => $countLike, "variableTrue" => $trueVariable]);
            } else {
                
                return response()->json(["error" => "Cette photo de profil n'existe plus !"]);
        }
    }

    public function allFilProPost(Request $request)
    {
        $post =  DB::table('posts as p')
        ->select(
            'u_creator.name as creator_name',
            'p.id',
            'p.uuid',
            'p.body',
            'p.bgc',
            'p.image',
            'p.video',
            'p.created_at',
            DB::raw('(SELECT GROUP_CONCAT(CONCAT(u_tagged.id, "-", u_tagged.name)) FROM tags_users tu INNER JOIN users u_tagged ON tu.user_id = u_tagged.id WHERE tu.uuid = p.uuid) as tagged_names'),
            'p.user_id'
        )
        ->leftJoin('users as u_creator', 'p.user_id', '=', 'u_creator.id')
        ->where('p.id', intval($request->table["id"]))
        ->orderBy('p.created_at', 'desc')
        ->first();

        if ($post !== null) {
                // Récupérons le nombre de likes qu'à cette publication
                $countLike = LikeUserPost::where("id_post", $post->id)->count("id_post");

                // Récupérons le nombre de commentaires qu'à cette publication
                $countComment = CommentUserPost::where("id_post", $post->id)->count("id_post");

                $post->likes = $countLike;
                $post->comments = $countComment;


                $identifiant = Auth::user()->id;
                // Vérifions si l'utilisateur connecté n'a pas aimé cette publication
                $verif = LikeUserPost::where("user_id", $identifiant)->where("id_post", $post->id)->first();
                $trueVariable = false;
                if ($verif !== null) {
                    $trueVariable = true;
                }
                $post->trueVariable = $trueVariable;

                // Message à envoyer
                $message = null;

                if($trueVariable && $countLike > 1)
                {
                    $message = "Vous et " . ($countLike - 1) . " autre(s) personne(s) ont aimé cette publication.";
                } elseif($trueVariable && $countLike === 1)
                {
                    $message = "Vous avez aimé cette publication.";
                } elseif($countLike === 1)
                {
                    $message = $countLike . " personne a aimé cette publication.";
                } else {
                    $message = $countLike . " personne(s) ont aimé cette publication.";
                }

                return response()->json(["success" => $message, "countLike" => $countLike, "variableTrue" => $trueVariable]);
            } else {
                
                return response()->json(["error" => "Cette publication de profil n'existe plus !"]);
        }
    }
    public function about($id)
    {
        // Récupérons toutes les données de la personne
        $gallery = new GalleryUsersController();
        $tableau = $gallery::essentialData($id);

        return Inertia::render("Users/About", $tableau);
    }
}
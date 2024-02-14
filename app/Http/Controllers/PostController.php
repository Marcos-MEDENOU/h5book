<?php

namespace App\Http\Controllers;

use App\Models\CommentUserPost;
use App\Models\gallery_users;
use App\Models\LikeUserPost;
use App\Models\Post;
use App\Models\TagsPosts;
use App\Models\TagsUsers;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;

class PostController extends Controller
{

    public function postUser($id, $user)
    {
        // Récupérons toutes les données de la personne
        $gallery = new GalleryUsersController();
        $tableau = $gallery::essentialData($user);

        // Récupérons les informations basées sur ce post
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
            ->where('p.id', $id)
            ->orderBy('p.created_at', 'desc')
            ->first();

        // Si le post existe, fais :
        if ($posts !== null) {
            $lastImg = gallery_users::select("gallery_users.file_profile", "gallery_users.id", "gallery_users.user_id", "gallery_users.created_at")
                ->where("user_id", $posts->user_id)->orderBy("created_at", "desc")->whereNotNull("gallery_users.file_profile")->first();
            $posts->image_user = $lastImg !== null ? $lastImg->file_profile : null;

            // Récupérons le nombre de likes qu'à cette publication
            $countLike = LikeUserPost::where("id_post", intval($id))->count("id_post");

            $verif = LikeUserPost::where("user_id", Auth::user()->id)->where("id_post", intval($id))->first();
            $trueVariable = false;
            if ($verif !== null) {
                $trueVariable = true;
            }

            // Récupérons tout ceux qui ont aimé cette publication
            $userlike = User::select("users.id", "users.name")
                ->join("like_user_posts", "like_user_posts.user_id", "=", "users.id")
                ->where("like_user_posts.id_post", intval($id))->get()->toArray();

            $table = [];
            for ($i = 0; $i < count($userlike); $i++) {
                // Récupérons la dernière image de profil de l'utilisateur
                $getLast = gallery_users::where("user_id", intval($userlike[$i]["id"]))->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();
                if ($getLast !== null) {
                    $table[$i] = $userlike[$i];
                    $table[$i]["image"] = $getLast->file_profile;
                } else {
                    $table[$i] = $userlike[$i];
                }
            }
            $userlike = $table;

            // Récupérons le nombre de commentaires qu'à cette publication
            $countComment = CommentUserPost::where("id_post", $id)->count("id_post");

            // Récupération de tous les commentaires faits sur cette publication
            $allComments = User::select("users.id", "users.name", "comment_user_posts.id as idComment", "comment_user_posts.comment", "comment_user_posts.created_at", "comment_user_posts.updated_at")
                ->join("comment_user_posts", "comment_user_posts.user_id", "=", "users.id")
                ->where("comment_user_posts.id_post", $id)
                ->orderBy("comment_user_posts.created_at", "desc")->get()->toArray();

            $tableauOne = [];
            for ($i = 0; $i < count($allComments); $i++) {
                // Récupérons la dernière image de profil de l'utilisateur
                $getLast = gallery_users::where("user_id", intval($allComments[$i]["id"]))->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();
                if ($getLast !== null) {
                    $tableauOne[$i] = $allComments[$i];
                    $tableauOne[$i]["image"] = $getLast->file_profile;
                } else {
                    $tableauOne[$i] = $allComments[$i];
                }
            }

            $allComments = $tableauOne;

            $tableau["likeUser"] = $userlike;
            $tableau["countComment"] = $countComment;
            $tableau["allComments"] = $allComments;
            $tableau["trueVariable"] = $trueVariable;
            $tableau["numbers"] = $countLike;
            $tableau["posts"] = $posts;

            return Inertia::render("Users/Posts/PostUser", $tableau);
        } else {
            return redirect("/");
        }
    }

    public function createPost(Request $request)
    {
        // Récupérons l'identifiant de la personne connectée
        $id = Auth::user()->id;

        // Générons un identifiant unique pour chaque post
        $uuid = uniqid("post-uuid-", true);

        try {
            Post::create(
                [
                    "user_id" => $id,
                    "uuid" => $uuid,
                    "body" => nl2br($request->publish),
                    "bgc" => $request->bgc ?? null,
                ]
            );
            if (isset($request->tag)) {
                try {
                    if (gettype($request->tag) === "integer") {
                        TagsPosts::create([
                            "uuid" => $uuid,
                        ]);

                        TagsUsers::create([
                            "uuid" => $uuid,
                            "user_id" => $request->tag,
                        ]);
                    }
                } catch (\Throwable $th) {
                    return response()->json(["error" => "Une erreur est survenue au cours de l'opération !!!"]);
                }
            }
            return response()->json(["message" => "Post créé avec succès !"]);
        } catch (\Throwable $th) {
            return response()->json(["error" => "Une erreur est survenue lors de la création !!!"]);
        }
    }

    public function createPostTwo(Request $request)
    {
        // Récupérons l'identifiant de la personne connectée
        $id = Auth::user()->id;

        // Générons un identifiant unique pour chaque post
        $uuid = uniqid("post-uuid-", true);

        try {
            Post::create(
                [
                    "user_id" => $id,
                    "uuid" => $uuid,
                    "body" => $request->publish !== null ? nl2br($request->publish) : null,
                    "image" => $request->value === "image" ? nl2br($request->fichier) : null,
                    "video" => $request->value === "video" ? nl2br($request->fichier) : null,
                ]
            );
            if (isset($request->tag)) {
                try {
                    if (gettype($request->tag) === "integer") {
                        TagsPosts::create([
                            "uuid" => $uuid,
                        ]);

                        TagsUsers::create([
                            "uuid" => $uuid,
                            "user_id" => $request->tag,
                        ]);
                    }
                } catch (\Throwable $th) {
                    return response()->json(["error" => "Une erreur est survenue au cours de l'opération !!!"]);
                }
            }
            return response()->json(["message" => "Post créé avec succès !"]);
        } catch (\Throwable $th) {
            return response()->json(["error" => "Une erreur est survenue lors de la création !!!"]);
        }
    }

    public function storeImgDeo()
    {
        $name = $_FILES["myCover"]["name"];
        $tmp_name = $_FILES["myCover"]["tmp_name"];
        $size = $_FILES["myCover"]["size"];
        $error = $_FILES["myCover"]["error"];
        // Taille maximale qu'on accepte (30Mo)
        $maximal = 30000000;

        // Les extensions d'image/de vidéo qu'on accepte
        $tableauExtension = ["jpg", "jpeg", "png", "mp4", "webm"];

        // Récupération de l'extension de l'image/la vidéo sélectionnée par l'utilisateur
        $extensionImage = strtolower(pathinfo($name, PATHINFO_EXTENSION));

        // Vérifions si l'extension de l'image/la vidéo se trouve dans notre tableau d'extensions
        if (in_array($extensionImage, $tableauExtension)) {
            if ($size <= $maximal) {
                if ($error == 0) {
                    $newName = uniqid("post_image_video_", true);
                    $file = $newName . "." . $extensionImage;
                    $location = base_path() . "/storage/app/public/post_images_videos/" . $file;
                    move_uploaded_file($tmp_name, $location);
                    $valeur = null;
                    if (in_array($extensionImage, ["mp4", "webm"])) {
                        $valeur = "video";
                    } else {
                        $valeur = "image";
                    }

                    return json_encode(["nameImg" => $file, "valeur" => $valeur]);
                } else {
                    return json_encode(["error" => "Le fichier ne peut être prise en charge !!!"]);
                }
            } else {
                return json_encode(["error" => "La taille de ce fichier dépasse la taille maximale que nous validons (30Mo) !!!"]);
            }
        } else {
            return json_encode(["error" => "L'extension de ce fichier ne figure pas dans la liste d'extension que nous acceptons !!!"]);
        }
    }

    /**
     * Fonction pour supprimer une image ou une vidéo
     * By KolaDev
     */
    public function deleteImgDeo(Request $request)
    {
        if (is_readable(base_path() . "/storage/app/public/post_images_videos/" . $request->nameImg)) {
            unlink(base_path() . "/storage/app/public/post_images_videos/" . $request->nameImg);
            return response()->json(["message" => "Fichier supprimé avec succès !!!"]);
        }
    }

    /**
     * Fonction pour supprimer une publication
     * By KolaDev
     */
    public function deletePost(Request $request)
    {
        try {
            // Vérifions que le post existe
            $postVerif = Post::where("uuid", $request->image["uuid"])->first();
            if ($postVerif !== null) {
                // Suppression de la publication
                $postVerif->delete();

                // Vérifions si cette publication contient une image ou une vidéo
                $nom = null;
                if (isset($request->image["image"]) || (isset($request->image["video"]))) {
                    $nom = $request->image["image"] !== null ?
                        $request->image["image"] :
                        ($request->image["video"] !== null ?
                            $request->image["video"] :
                            null);
                }
                if ($nom !== null) {
                    if (is_readable(base_path() . "/storage/app/public/post_images_videos/" . $nom)) {
                        unlink(base_path() . "/storage/app/public/post_images_videos/" . $nom);
                    }
                }

                // Vérifions que le post à des tags
                $tagPostVerif = TagsPosts::where("uuid", $request->image["uuid"])->first();
                $tagUserVerif = TagsUsers::where("uuid", $request->image["uuid"])->first();

                if ($tagPostVerif !== null) {
                    // Suppression du tag
                    $tagPostVerif->delete();
                }

                if ($tagUserVerif !== null) {
                    // Suppression
                    $tagUserVerif->delete();
                }
            }
            return response()->json(["success" => "Suppression réussie !!!"]);
        } catch (\Throwable $th) {
            return response()->json(["error" => "Une erreur est survenue lors de la suppression !!!"]);
        }
    }

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
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Post $post)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Post $post)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Post $post)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Post $post)
    {
        //
    }
}
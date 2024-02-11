<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\TagsPosts;
use App\Models\TagsUsers;
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
            ->where('p.id', $id)
            ->orderBy('p.created_at', 'desc')
            ->get();

            $tableau["posts"] = $posts;

        return Inertia::render("Users/Posts/PostUser", $tableau);
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
                    if(gettype($request->tag) === "integer")
                    {
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
                    if(gettype($request->tag) === "integer")
                    {
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

    public function deleteImgDeo(Request $request)
    {
        if (is_readable(base_path() . "/storage/app/public/post_images_videos/" . $request->nameImg)) {
            unlink(base_path() . "/storage/app/public/post_images_videos/" . $request->nameImg);
            return response()->json(["message" => "Fichier supprimé avec succès !!!"]);
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
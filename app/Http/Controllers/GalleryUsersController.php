<?php

namespace App\Http\Controllers;

use App\Models\gallery_users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class GalleryUsersController extends Controller
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
        //
    }

    /**
     * Fonction pour enregistrer les images de couverture de chaque utilisateur
     * By KolaDev
     */
    public function storeCover()
    {
        // Récupérons l'identifiant de la personne connectée
        $idUserConnect = Auth::user()->id;

        $name = $_FILES["myCover"]["name"];
        $tmp_name = $_FILES["myCover"]["tmp_name"];
        $size = $_FILES["myCover"]["size"];
        $error = $_FILES["myCover"]["error"];
        // Taille maximale qu'on accepte (10Mo)
        $maximal = 10000000;

        // Les extensions d'image qu'on accepte
        $tableauExtension = ["jpg", "jpeg", "png"];

        // Récupération de l'extension de l'image sélectionnée par l'utilisateur
        $extensionImage = pathinfo($name, PATHINFO_EXTENSION);

        // Vérifions si l'extension de l'image se trouve dans notre tableau d'extensions
        if (in_array($extensionImage, $tableauExtension)) {
            if ($size <= $maximal) {
                if ($error == 0) {
                    $newName = uniqid("cover-image-", true);
                    $file = $newName . "." . $extensionImage;
                    $location = base_path() . "/storage/app/public/coverImage/" . $file;
                    move_uploaded_file($tmp_name, $location);

                    try {
                        // Création d'une ligne dans la table gallery_users
                        gallery_users::create([
                            'cover_img' => $file,
                            'user_id' => $idUserConnect
                        ]);
                        return json_encode(["success" => true]);
                    } catch (\Throwable $th) {
                        return response()->json(['error' => "Une erreur est subvenue au cours de l'opération !!!"]);
                    }

                } else {
                    return json_encode(["error" => "L'image ne peut être prise en charge !!!"]);
                }
            } else {
                return json_encode(["error" => "La taille de cette image dépasse la taille maximale que nous validons (10Mo) !!!"]);
            }
        } else {
            return json_encode(["error" => "L'extension de cette image ne figure pas dans la liste d'extension que nous acceptons !!!"]);
        }
    }

    /**
     * Fonction pour récupérer la dernière image de couverture de l'utilisateur
     * By KolaDev
     */
    public function lastImgCover()
    {
        // Récupérons les utilisateurs qui sont reliés à l'utilisateur connecté
        $idUserConnect = Auth::user()->id;

        // Récupérons la dernière image de couverture de l'utilisateur
        $getLastImg = gallery_users::where("user_id", $idUserConnect)->orderBy("created_at", "desc")->first();
        $cover = null;
        if ($getLastImg !== null) {
            $cover = $getLastImg->cover_img;
        }

        return response()->json(["getLastImg"=> $getLastImg, "cover"=> $cover]);
    }

    /**
     * Fonction pour supprimer la dernière image de couverture de l'utilisateur
     * By KolaDev
     */
    public function deleteCover(Request $request)
    {
        if(isset($request->tableau))
        {
            // Vérifions si l'image existe toujours
            $getLastImg = gallery_users::where("id", intval($request->tableau["id"]))->first();
            if ($getLastImg !== null) {
                $img = $getLastImg->cover_img;
                // suppression de l'image de couverture de l'utilisateur
                unlink(base_path() . "/storage/app/public/coverImage/" . $img);
                try {
                    // Suppression de la ligne dans la table
                    $getLastImg->delete();
                    return response()->json(["success"=> true]);
                } catch(\Throwable $th) {
                    return response()->json(["error"=> "Une erreur est subvenue au cours de l'opération !!!"]);
                }
            }
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(gallery_users $gallery_users)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(gallery_users $gallery_users)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, gallery_users $gallery_users)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(gallery_users $gallery_users)
    {
        //
    }
}

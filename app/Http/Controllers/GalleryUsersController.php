<?php

namespace App\Http\Controllers;

use App\Models\followers;
use App\Models\gallery_users;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

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
        // Récupérons l'identifiant de la personne connectée
        $id = Auth::user()->id;

        $name = $_FILES["myPicture"]["name"];
        $tmp_name = $_FILES["myPicture"]["tmp_name"];
        $size = $_FILES["myPicture"]["size"];
        $error = $_FILES["myPicture"]["error"];
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
                    $newName = uniqid("profil-image-", true);
                    $file = $newName . "." . $extensionImage;
                    $location = base_path() . "/storage/app/public/profilImage/" . $file;
                    try {
                        move_uploaded_file($tmp_name, $location);
                        return json_encode(["success" => true, "nameImg" => $file]);
                    } catch (\Throwable $th) {
                        return response()->json(['error' => "Une erreur est subvenue au cours de l'opération !!!"]);
                    }

                } else {
                    return json_encode(["error" => "L'image ne peut être prise en charge !!!"]);
                }
            } else {
                return json_encode(["error" => "La taille de ce fichier dépasse la taille maximale que nous validons (10Mo) !!!"]);
            }
        } else {
            return json_encode(["error" => "L'extension de ce fichier ne figure pas dans la liste d'extension que nous acceptons !!!"]);
        }
    }

    /**
     * By KolaDev
     */
    public function uploadImgUser(Request $request)
    {
        // Récupérons l'identifiant de la personne connectée
        $id = Auth::user()->id;
        try {
            gallery_users::create([
                'file_profile' => $request->nameImg,
                'user_id' => $id
            ]);
            return json_encode(["success" => true]);
        } catch (\Throwable $th) {
            return response()->json(['error' => "Une erreur est subvenue au cours de l'opération !!!"]);
        }
    }

    /**
     * Fonction pour enregistrer les images de couverture de chaque utilisateur
     * By KolaDev
     */
    public function storeCover()
    {
        // Récupérons l'identifiant de la personne connectée
        $id = Auth::user()->id;

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
                            'user_id' => $id
                        ]);
                        return json_encode(["success" => true]);
                    } catch (\Throwable $th) {
                        return response()->json(['error' => "Une erreur est subvenue au cours de l'opération !!!"]);
                    }

                } else {
                    return json_encode(["error" => "L'image ne peut être prise en charge !!!"]);
                }
            } else {
                return json_encode(["error" => "La taille de ce fichier dépasse la taille maximale que nous validons (10Mo) !!!"]);
            }
        } else {
            return json_encode(["error" => "L'extension de ce fichier ne figure pas dans la liste d'extension que nous acceptons !!!"]);
        }
    }

    /**
     * Fonction pour récupérer la dernière image de couverture de l'utilisateur
     * By KolaDev
     */
    public function lastImgCover()
    {
        // Récupérons les utilisateurs qui sont reliés à l'utilisateur connecté
        $id = Auth::user()->id;

        // Récupérons la dernière image de couverture de l'utilisateur
        $getLastImg = gallery_users::where("user_id", $id)
            ->whereNotNull("cover_img")->orderBy("created_at", "desc")->first();
        $cover = null;
        if ($getLastImg !== null) {
            $cover = $getLastImg->cover_img;
        }

        // Récupérons la dernière image de profil de l'utilisateur
        $getLastImgProfil = gallery_users::where("user_id", $id)->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();
        $profil = null;
        if ($getLastImgProfil !== null) {
            $profil = $getLastImgProfil->file_profile;
        }

        return response()->json(["getLastImg" => $getLastImg, "cover" => $cover, "profil" => $profil, "getLastImgProfil" => $getLastImgProfil]);
    }

    /**
     * Fonction pour supprimer la dernière image de couverture de l'utilisateur
     * By KolaDev
     */
    public function deleteCover(Request $request)
    {
        if (isset($request->tableau)) {
            // Vérifions si l'image existe toujours
            $getLastImg = gallery_users::where("id", intval($request->tableau["id"]))->first();
            if ($getLastImg !== null) {
                $img = $getLastImg->cover_img;
                // suppression de l'image de couverture de l'utilisateur
                unlink(base_path() . "/storage/app/public/coverImage/" . $img);
                try {
                    // Suppression de la ligne dans la table
                    $getLastImg->delete();
                    return response()->json(["success" => true]);
                } catch (\Throwable $th) {
                    return response()->json(["error" => "Une erreur est subvenue au cours de l'opération !!!"]);
                }
            }
        }
    }

    /**
     * Fonction pour supprimer la dernière image de couverture de l'utilisateur
     * By KolaDev
     */
    public function deleteImage(Request $request)
    {
        if (isset($request->nameImg)) {
            // suppression de l'image de couverture de l'utilisateur
            unlink(base_path() . "/storage/app/public/profilImage/" . $request->nameImg);
            try {
                return response()->json(["success" => true]);
            } catch (\Throwable $th) {
                return response()->json(["error" => "Une erreur est subvenue au cours de l'opération !!!"]);
            }
        }
    }

    // Fonction pour afficher les informations essentielles
    // By KolaDev
    public static function essentialData($id)
    {
        // Récupérons la dernière image de couverture de l'utilisateur
        $getLastImg = gallery_users::where("user_id", $id)
            ->whereNotNull("cover_img")->orderBy("created_at", "desc")->first();
        $cover = null;
        if ($getLastImg !== null) {
            $cover = $getLastImg->cover_img;
        }

        // Les données de l'utilisateur
        $user = User::where("id", $id)->first();

        // Récupérons la dernière image de profil de l'utilisateur
        $getLastImgProfil = gallery_users::where("user_id", $id)->orderBy("created_at", "desc")->whereNotNull("file_profile")->first();
        $profil = null;
        if ($getLastImgProfil !== null) {
            $profil = $getLastImgProfil->file_profile;
        }

        $getFollowing = followers::where("user_id_connect", $id)->get()->toArray();

        $getFollowers = followers::where("user_id", $id)->get()->toArray();

        return ["lImg" => $getLastImg, "following" => count($getFollowing), "follower" => count($getFollowers), "cover" => $cover, "profil" => $profil, "getLastImgProfil" => $getLastImgProfil, "user" => $user];
    }

    /**
     * Fonction pour charger la page image
     * By KolaDev
     */
    public function showImage($id, gallery_users $gallery_users)
    {
        $tableau = GalleryUsersController::essentialData($id);

        $countCover = $gallery_users::where("user_id", $id)->orderBy("created_at", "desc")->whereNotNull("cover_img")->get()->toArray();

        $countProfil = $gallery_users::where("user_id", $id)->orderBy("created_at", "desc")->whereNotNull("file_profile")->get()->toArray();
        
        $tableau["countCover"] = count($countCover);
        $tableau["countProfil"] = count($countProfil);
        
        $tableau["id"] = $id;

        return Inertia::render('Users/Photos', $tableau);
    }

    public function openCovers(Request $request, gallery_users $gallery_users)
    {
        $id = $request->input('id');

        $countCover = $gallery_users::where("user_id", $id)->whereNotNull("cover_img")->get()->toArray();

        $countProfil = $gallery_users::where("user_id", $id)->whereNotNull("file_profile")->get()->toArray();

        return response()->json(["coversImages" => $countCover, "profilsImages"=> $countProfil]);
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

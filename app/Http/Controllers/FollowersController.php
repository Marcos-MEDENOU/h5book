<?php

namespace App\Http\Controllers;

use App\Models\followers;
use App\Models\gallery_users;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\User;

class FollowersController extends Controller
{
    /**
     * Fonction pour afficher la page friends
     * By Kola
     */
    public function index()
    {
        // Récupérons les utilisateurs qui sont reliés à l'utilisateur connecté
        $idUserConnect = Auth::user()->id;

        // Récupérons la dernière image de couverture de l'utilisateur
        $getLastImg = gallery_users::where("user_id", $idUserConnect)->orderBy("created_at", "desc")->first();
        $cover = null;
        if ($getLastImg !== null) {
            $cover = $getLastImg->cover_img;
        }

        $getFollowing = followers::where("user_id_connect", $idUserConnect)->get()->toArray();

        $getFollowers = followers::where("user_id", $idUserConnect)->get()->toArray();

        if (count($getFollowing) === 0) {
            $follow = User::whereNotIn("id", [$idUserConnect])->get()->toArray();
            $getFol = [];
        } else {
            // Récupération de tous les id des utilisateurs
            $identifiants = [];

            foreach ($getFollowing as $key => $val) {
                array_push($identifiants, $val["user_id"]);
            }

            $getFol = User::whereIn("id", $identifiants)->get()->toArray();
            array_push($identifiants, $idUserConnect);

            $follow = User::whereNotIn("id", $identifiants)->get()->toArray();
        }
        return Inertia::render('Users/Friends', ["lImg"=> $getLastImg, "follow" => $follow, "following" => count($getFollowing), "userFollowing" => $getFol, "follower" => count($getFollowers), "cover" => $cover]);
    }

    /**
     * Fonction pour suivre des utilisateurs
     * By Kola
     */
    public function followingUser(Request $request)
    {
        // Récupérons l'id de l'utilisateur connecté
        $idUserConnect = Auth::user()->id;
        try {
            // Je vérifie si l'utilisateur connecté suit déjà cet utilisateur $request->id
            $verify = followers::where("user_id_connect", $idUserConnect)->where("user_id", intval($request->id))->first();
            if ($verify === null) {
                followers::create([
                    "user_id_connect" => intval($idUserConnect),
                    "user_id" => intval($request->id)
                ]);
                return response()->json(["success" => true]);
            } else {
                return response()->json(["error" => "Vous suivez déjà cet utilisateur !"]);
            }
        } catch (\Throwable $th) {
            return response()->json(["error" => "Une erreur est subvenue au cours de l'opération !"]);
        }
    }

    // Fonction pour se désabonner d'un utilisateur
    // By KolaDev
    public function unsubscribe(Request $request)
    {
        // Récupérons l'id de l'utilisateur connecté
        $idUserConnect = Auth::user()->id;
        try {
            // Je vérifie si l'utilisateur connecté suit déjà cet utilisateur $request->id
            $verify = followers::where("user_id_connect", $idUserConnect)->where("user_id", intval($request->id))->first();
            if ($verify !== null) {
                $verify->delete();
                return response()->json(["success" => true]);
            }
        } catch (\Throwable $th) {
            return response()->json(["error" => "Une erreur est subvenue au cours de l'opération !"]);
        }
    }

    // Fonction pour afficher les amis de l'utilisateur connecté
    // Fonction faite par Kola
    public function getFollowers()
    {
        // Récupérons les utilisateurs qui sont reliés à l'utilisateur connecté
        $idUserConnect = Auth::user()->id;

        $getFollowing = followers::where("user_id_connect", $idUserConnect)->get()->toArray();

        $getFollowers = followers::where("user_id", $idUserConnect)->get()->toArray();

        if (count($getFollowing) === 0) {
            $follow = User::whereNotIn("id", [$idUserConnect])->get()->toArray();
            $getFol = [];
        } else {
            // Récupération de tous les id des utilisateurs
            $identifiants = [];

            foreach ($getFollowing as $key => $val) {
                array_push($identifiants, $val["user_id"]);
            }

            $getFol = User::whereIn("id", $identifiants)->get()->toArray();
            array_push($identifiants, $idUserConnect);

            $follow = User::whereNotIn("id", $identifiants)->get()->toArray();
        }
        return response()->json(["follow" => $follow, "following" => count($getFollowing), "userFollowing" => $getFol, "follower" => count($getFollowers)]);
    }

    // Fonction pour rechercher des amis
    // KolaDev
    public function searchInputFriend(Request $request)
    {
        $idUserConnect = Auth::user()->id;

        $getFollowing = followers::where("user_id_connect", $idUserConnect)->get()->toArray();
        if ($request->variable === "friends") {
            if (count($getFollowing) > 0) {
                // Récupération de tous les id des utilisateurs
                $identifiants = [];

                foreach ($getFollowing as $key => $val) {
                    array_push($identifiants, $val["user_id"]);
                }

                $getFol = User::whereIn("id", $identifiants)
                    ->where("name", "like", "%" . $request->search . "%")
                    ->get()->toArray();
                return response()->json(["userFollowing" => $getFol]);
            }
        } else {
            if (count($getFollowing) > 0) {
                // Récupération de tous les id des utilisateurs
                $identifiants = [];

                foreach ($getFollowing as $key => $val) {
                    array_push($identifiants, $val["user_id"]);
                }

                array_push($identifiants, $idUserConnect);

                $getFol = User::whereNotIn("id", $identifiants)
                    ->where("name", "like", "%" . $request->search . "%")
                    ->get()->toArray();
                return response()->json(["follow" => $getFol]);
            }
        }
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
    public function show(followers $followers)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(followers $followers)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, followers $followers)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(followers $followers)
    {
        //
    }
}

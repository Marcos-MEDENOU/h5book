<?php

namespace App\Http\Controllers;

use App\Models\followers;
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
        $allUsers = User::all()->toArray();

        // Récupérons les utilisateurs qui sont reliés à l'utilisateur connecté
        $idUserConnect = Auth::user()->id;

        $getFollowing = followers::where("user_id_connect", $idUserConnect)->get()->toArray();

        if (count($getFollowing) === 0) {
            $follow = User::whereNotIn("id", [$idUserConnect])->get()->toArray();
        } else {
            // Récupération de tous les id des utilisateurs
            $identifiants = [];
            
            foreach ($getFollowing as $key => $val) {
                array_push($identifiants, $val["user_id"]);
            }
            
            array_push($identifiants, $idUserConnect);

            $follow = User::whereNotIn("id", $identifiants)->get()->toArray();
        }
        return Inertia::render('Users/Friends', ["follow" => $follow]);
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

    // Fonction pour afficher les amis de l'utilisateur connecté
    // Fonction faite par Kola
    public function getFollowers()
    {
        $allUsers = User::all()->toArray();

        // Récupérons les utilisateurs qui sont reliés à l'utilisateur connecté
        $idUserConnect = Auth::user()->id;

        $getFollowing = followers::where("user_id_connect", $idUserConnect)->get()->toArray();

        if (count($getFollowing) === 0) {
            $follow = User::whereNotIn("id", [$idUserConnect])->get()->toArray();
        } else {
           // Récupération de tous les id des utilisateurs
           $identifiants = [];
            
           foreach ($getFollowing as $key => $val) {
               array_push($identifiants, $val["user_id"]);
           }
           
            array_push($identifiants, $idUserConnect);

            $follow = User::whereNotIn("id", $identifiants)->get()->toArray();
        }
        return response()->json(["follow" => $follow]);
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

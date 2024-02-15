<?php

namespace App\Http\Controllers;

use App\Models\CommentsUsersProfile;
use App\Models\gallery_users;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CommentsUsersProfileController extends Controller
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
        // Récupération de l'identifiant de la personne connectée
        $identifiant = Auth::user()->id;

        // Récupérons l'identifiant de l'image
        $idImage = intval($request->tableau["id"]);

        // Récupérons le commentaire fait
        $comment = nl2br($request->comment);
        // date_default_timezone_set('Europe/Paris');
        
        try {
            CommentsUsersProfile::create([
                'comment' => $comment,
                'user_id' => $identifiant,
                'id_gallery' => $idImage,
                // 'created_at' => date("Y-m-d H:i:s"),
                // 'updated_at' => date("Y-m-d H:i:s"),
            ]);
            return response()->json(["success" => true]);
        } catch (\Throwable $th) {
            return response()->json(["error" => "Une erreur est subvenue lors de l'enregistrement"]);
        }
    }

    /**
     * Fonction pour récupérer tous les commentaires basés sur une image
     * By KolaDev
     */
    public function allCommentaires(Request $request)
    {
        // Récupération de tous les commentaires faits sur cette photo
        $allComments = User::select(
            "users.id",
            "users.name",
            "comments_users_profiles.id as idComment",
            "comments_users_profiles.comment",
            "comments_users_profiles.created_at",
            "comments_users_profiles.updated_at",
            DB::raw("TIMESTAMPDIFF(SECOND, comments_users_profiles.created_at, NOW()) as diff_in_seconds"),
            DB::raw("TIMESTAMPDIFF(MINUTE, comments_users_profiles.created_at, NOW()) as diff_in_minutes"),
            DB::raw("TIMESTAMPDIFF(HOUR, comments_users_profiles.created_at, NOW()) as diff_in_hours"),
            DB::raw("TIMESTAMPDIFF(DAY, comments_users_profiles.created_at, NOW()) as diff_in_days"),
            DB::raw("TIMESTAMPDIFF(WEEK, comments_users_profiles.created_at, NOW()) as diff_in_weeks"),
            DB::raw("TIMESTAMPDIFF(MONTH, comments_users_profiles.created_at, NOW()) as diff_in_months"),
            DB::raw("TIMESTAMPDIFF(YEAR, comments_users_profiles.created_at, NOW()) as diff_in_years")
        )
        ->join("comments_users_profiles", "comments_users_profiles.user_id", "=", "users.id")
        ->where("comments_users_profiles.id_gallery", intval($request->tableau["id"]))
        ->orderBy("comments_users_profiles.created_at", "desc")
        ->get()
        ->toArray();

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

        return response()->json(["allComments" => $allComments]);
    }

    /**
     * Display the specified resource.
     */
    public function show(CommentsUsersProfile $commentsUsersProfile)
    {
        //
    }

    /**
     * Fonction pour retourner un commentaire spécifique
     * By KolaDev
     */
    public function edit(CommentsUsersProfile $commentsUsersProfile, Request $request)
    {
        $comment = $commentsUsersProfile->where("id", intval($request->id))->first();
        if ($comment !== null) {
            $comment->comment = preg_replace("/\<br\s*\/\>/i", "", $comment->comment);
            return response()->json(["comment"=> $comment]);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, CommentsUsersProfile $commentsUsersProfile)
    {
        $comment = $commentsUsersProfile->where("id", intval($request->id))->first();
        if ($comment !== null) {
            // Récupérons le commentaire fait
            $comments = nl2br($request->comment);
            try {
                CommentsUsersProfile::where("id", intval($comment->id))->update([
                    'comment' => $comments
                ]);
                return response()->json(["success" => true]);
            } catch (\Throwable $th) {
                return response()->json(["error" => "Une erreur est subvenue lors de la modification !!!"]);
            }
        }
    }

    /**
     * Fonction pour supprimer un commentaire d'un utilisateur relié à une image
     * By KolaDev
     */
    public function destroy(CommentsUsersProfile $commentsUsersProfile, Request $request)
    {
        // Vérifions si le commentaire existe toujours
        $comment = $commentsUsersProfile->where("id", intval($request->id))->first();
        if ($comment !== null) {
            try {
                $comment->delete();
                return response()->json(["success" => true]);
            } catch (\Throwable $th) {
                return response()->json(["error" => "Une erreur est subvenue lors de la suppression !!!"]);
            }
        } else {
            return response()->json(["error" => "Le commentaire n'existe plus !!!"]);
        }
    }
}

<?php

namespace App\Http\Controllers;

use App\Models\CommentUserPost;
use App\Models\gallery_users;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CommentUserPostController extends Controller
{
    

    /**
     * Fonction pour récupérer tous les commentaires basés sur une image
     * By KolaDev
     */
    public function allCommentairesPost(Request $request)
    {
        // Récupération de tous les commentaires faits sur cette photo
        $allComments = User::select(
            "users.id",
            "users.name",
            "comment_user_posts.id as idComment",
            "comment_user_posts.comment",
            "comment_user_posts.created_at",
            "comment_user_posts.updated_at",
            DB::raw("TIMESTAMPDIFF(SECOND, comment_user_posts.created_at, NOW()) as diff_in_seconds"),
            DB::raw("TIMESTAMPDIFF(MINUTE, comment_user_posts.created_at, NOW()) as diff_in_minutes"),
            DB::raw("TIMESTAMPDIFF(HOUR, comment_user_posts.created_at, NOW()) as diff_in_hours"),
            DB::raw("TIMESTAMPDIFF(DAY, comment_user_posts.created_at, NOW()) as diff_in_days"),
            DB::raw("TIMESTAMPDIFF(WEEK, comment_user_posts.created_at, NOW()) as diff_in_weeks"),
            DB::raw("TIMESTAMPDIFF(MONTH, comment_user_posts.created_at, NOW()) as diff_in_months"),
            DB::raw("TIMESTAMPDIFF(YEAR, comment_user_posts.created_at, NOW()) as diff_in_years")
        )
        ->join("comment_user_posts", "comment_user_posts.user_id", "=", "users.id")
        ->where("comment_user_posts.id_post", intval($request->tableau["id"]))
        ->orderBy("comment_user_posts.created_at", "desc")
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
        // Récupération de l'identifiant de la personne connectée
        $identifiant = Auth::user()->id;

        // Récupérons l'identifiant de l'image
        $idPost = intval($request->tableau["id"]);

        // Récupérons le commentaire fait
        $comment = nl2br($request->comment);
        date_default_timezone_set('Europe/Paris');

        try {
            CommentUserPost::create([
                'comment' => $comment,
                'user_id' => $identifiant,
                'id_post' => $idPost,
                'created_at' => date("Y-m-d H:i:s"),
                'updated_at' => date("Y-m-d H:i:s"),
            ]);
            return response()->json(["success" => true]);
        } catch (\Throwable $th) {
            return response()->json(["error" => "Une erreur est subvenue lors de l'enregistrement"]);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(CommentUserPost $commentUserPost)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(CommentUserPost $commentUserPost, Request $request)
    {
        $comment = $commentUserPost->where("id", intval($request->id))->first();
        if ($comment !== null) {
            $comment->comment = preg_replace("/\<br\s*\/\>/i", "", $comment->comment);
            return response()->json(["comment"=> $comment]);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, CommentUserPost $commentUserPost)
    {
        $comment = $commentUserPost->where("id", intval($request->id))->first();
        if ($comment !== null) {
            // Récupérons le commentaire fait
            $comments = nl2br($request->comment);
            try {
                CommentUserPost::where("id", intval($comment->id))->update([
                    'comment' => $comments
                ]);
                return response()->json(["success" => true]);
            } catch (\Throwable $th) {
                return response()->json(["error" => "Une erreur est subvenue lors de la modification !!!"]);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(CommentUserPost $commentUserPost, Request $request)
    {
         // Vérifions si le commentaire existe toujours
         $comment = $commentUserPost->where("id", intval($request->id))->first();
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

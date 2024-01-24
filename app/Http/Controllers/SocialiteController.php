<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Providers\RouteServiceProvider;
use Socialite;
use App\Models\User;

class SocialiteController extends Controller
{
     // Les tableaux des providers autorisés
     protected $providers = [ "google", "github", "facebook" ];

     # redirection vers le provider
    public function redirect (Request $request) {

        $provider = $request->provider;

        // On vérifie si le provider est autorisé
        if (in_array($provider, $this->providers)) {
            return Socialite::driver($provider)->redirect(); // On redirige vers le provider
        }
        abort(404); // Si le provider n'est pas autorisé
    }

    // Callback du provider
    public function callback (Request $request) {

        $provider = $request->provider;

        if (in_array($provider, $this->providers)) {

        	// Les informations provenant du provider
        	$data = Socialite::driver($request->provider)->user();

            // Les informations de l'utilisateur
            // $user = $data->user;

            # Social login - register
            $email = $data->getEmail(); // L'addresse email
            $name = $data->getName(); // le nom

            # 1. On récupère l'utilisateur à partir de l'adresse email
            $user = User::where("email", $email)->first();

            # 2. Si l'utilisateur n'existe pas, on l'enregistre
            if(!$user) {
                $user = User::create([
                    'name' => $name,
                    'email' => $email,
                    'password' => Hash::make($email) // On attribue un mot de passe
                ]);
            }

            # 3. On connect l'utilisateur
            Auth::login($user);

            # 4. On redirige l'utilisateur vers /home
            if (auth()->check()) {
                return redirect(RouteServiceProvider::HOME);
            }

            // voir les informations de l'utilisateur
            // dd($user, "", $data);
         }
         abort(404);
    }
}

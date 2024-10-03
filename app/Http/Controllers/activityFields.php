<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class activityFields extends Controller
{
    public function Get_info (){
        //pour recuperer les info dans le controller activityFields
        $reponse = http::get('http://127.0.0.1:3001/activityFields') ;
        //verification des requêtes 
        if ($reponse->successful()) {
            $activityFields = $response->json()['activityFields'];

            // Retourner les données à la vue
            return view('activityFields.index', ['activityFields' => $activityFields]);
        } else {
            // Gérer l'erreur
            return redirect()->back()->with('error', 'Erreur lors de la récupération des données.');
        }
    }
 // Fonction pour récupérer un seul activityField par son ID
 public function show($id)
 {
     $response = Http::get("http://127.0.0.1:3001/activityFields");

     if ($response->successful()) {
         $activityField = $response->json()['activityField'];
         return view('activityFields.show', ['activityField' => $activityField]);
     } else {
         return redirect()->back()->with('error', 'Erreur lors de la récupération de l\'activity field.');
     }
 }
}
    


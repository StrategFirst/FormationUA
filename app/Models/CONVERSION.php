<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Support\Facades\DB;

class CONVERSION extends Model
{
    use HasFactory;

    // convertie les données des tables au format csv 
    public static function toCsv() {
        $suivi = array_map( function($couple) {
                return [ $couple->id_etu , $couple->id_mat ];      
            }
            ,
            array_unique(
                array_merge(
                    DB::select(
                        "SELECT choix_etudiants.id AS id_etu, appartenance_matiere.id_sous_matiere AS id_mat
                        FROM choix_etudiants
                            JOIN appartenance_matiere ON choix_etudiants.id_matiere = appartenance_matiere.id_matiere;"
                        ,[]
                    )
                    ,
                    DB::select(
                        "SELECT inscrit_formation.id_etudiant AS id_etu, appartenance_matiere.id_sous_matiere AS id_mat
                         FROM inscrit_formation
                            JOIN ue ON inscrit_formation.id_formation = ue.id_formation
                            JOIN matiere ON ue.id = matiere.id_ue
                            JOIN appartenance_matiere on matiere.id = appartenance_matiere.id_matiere;"
                        ,[]
                    )
                )
            )
        );

        $suivi_fichier = fopen( 'suivi.csv' , 'w+' );
        foreach( $suivi as $ligne ) {
            fputcsv( $suivi_fichier , $ligne );
        }
        fclose($suivi);
    }


}


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
            DB::select("SELECT * FROM suivi_etudiant_sous_matiere")    
        );
        $suivi_fichier = fopen( '../repartition/data/suivi.csv' , 'w+' );
        foreach( $suivi as $ligne ) {
            fputcsv( $suivi_fichier , $ligne );
        }
        fclose($suivi_fichier);


        
        $contrainte = array_map( function($tuple) {
            return [ $tuple->id_mat , $tuple->sorte , $tuple->max_etu ];      
        }
        ,
            DB::select(
                "SELECT 
                    partie.id_sous_matiere AS id_mat,
                    partie.type AS sorte,
                    partie.nb_etudiants AS max_etu
                FROM partie;"
                ,[]
            )
        
        );
        $contrainte_fichier = fopen( '../repartition/data/contrainte.csv' , 'w+' );
        foreach( $contrainte as $ligne ) {
            fputcsv( $contrainte_fichier , $ligne );
        }
        fclose($contrainte_fichier);
    }


}


<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Support\Facades\DB;

class CONVERSION extends Model
{
    use HasFactory;

    // convertie les données des tables au format csv 
    public static function toCSV() {
        $suivi = array_map( function($couple) {
                return [ $couple->id_etu , $couple->id_mat ];      
            }
            ,
            DB::select("SELECT * FROM suivi_etudiant_sous_matiere")    
        );
        $suivi_fichier = fopen( 'repartition/data/suivi.csv' , 'w+' );
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
        $contrainte_fichier = fopen( 'repartition/data/contrainte.csv' , 'w+' );
        foreach( $contrainte as $ligne ) {
            fputcsv( $contrainte_fichier , $ligne );
        }
        fclose($contrainte_fichier);
    }

    public static function fromCSV() {

        function motAleatoire(int $longueur) {
            $chaine = "";
            for( $i = 0 ; $i < $longueur ; $i++ ) {
              $r = random_int(0,62);
              if($r < 26) $chaine .= chr( $r + 97 );
              if($r < 52) $chaine .= chr( $r + 65 - 26 );
              $chaine .= chr( $r + 48 - 52 );
            }
            return utf8_encode($chaine);
        }

        // delete previous
        DB::delete("DELETE FROM choix_groupe;");
        DB::delete("DELETE FROM regroupement;");
        DB::delete("DELETE FROM suivi;");
        DB::delete("DELETE FROM groupe;");
        DB::delete("DELETE FROM classe;");

        // gestion du fichier etudiant_groupe
            $handle = fopen("repartition/data/etudiant_groupe.csv","r");
            //DB::beginTransaction();

            //traitement ( envoi bdd)
            $groupeInserted = [];
            while (( $data = fgetcsv($handle,1000,",")) !== FALSE)
            {
                if( ! isset($groupeInserted[$data[1]]) ) {
                    DB::insert(
                        "INSERT INTO groupe(id,nom) VALUES (:id , :nom)",
                        ['id' => $data[1] , 'nom' => motAleatoire(5)]
                    );
                    $groupeInserted[$data[1]] = true;
                }
                DB::insert(
                    "INSERT INTO choix_groupe(id_etu,id_groupe) VALUES (:id_etu , :id_groupe)",
                    ['id_etu' => $data[0] , 'id_groupe' => $data[1]]
                );
            }

            //DB::commit();
            fclose($handle);


        // gestion du fichier groupe_classe
            $handle = fopen("repartition/data/groupe_classe.csv","r");
            DB::beginTransaction();

            //traitement ( envoi bdd)
            $classeInserted = [];
            while (( $data = fgetcsv($handle,1000,",")) !== FALSE)
            {
                if( ! isset($classeInserted[$data[1]]) ) {
                    DB::insert(
                        "INSERT INTO classe(id,nom) VALUES (:id , :nom)",
                        ['id' => $data[1] , 'nom' => motAleatoire(5)]
                    );
                    $classeInserted[$data[1]] = true;
                }
                DB::insert(
                    "INSERT INTO regroupement(id_groupe,id_classe) VALUES (:id_groupe , :id_classe)",
                    ['id_groupe' => $data[0],'id_classe' => $data[1]]
                    );
            
            }

            //$pdo->commit();
            fclose($handle);

        // gestion du fichier classe_matiere
            $handle = fopen("repartition/data/classe_matiere.csv","r");

            //traitement ( envoi bdd)
            while (( $data = fgetcsv($handle,1000,",")) !== FALSE)
            {
                $id_classe = $data[0];
                $id_sous_mat = $data[1];
                $type_cours = $data[2];

                
                $id_partie = DB::select(
                    "SELECT id FROM partie WHERE id_sous_matiere = :id_sous_matiere and type = :type",
                    ['id_sous_matiere' => $id_sous_mat,'type' => $type_cours]
                )[0]->id;

                DB::insert(
                    "INSERT INTO suivi(id_classe,id_partie) VALUES (:id_classe , :id_partie)",
                    ['id_classe' => $id_classe,'id_partie' => $id_partie]
                );

            }

            fclose($handle);
            return [];
        }

}


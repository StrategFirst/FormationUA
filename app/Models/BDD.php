<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Support\Facades\DB;

class BDD extends Model
{
    use HasFactory;

    public static function get_formations() {
        return DB::select( "SELECT * FROM formation ORDER BY nom;" , [] );
    }

    public static function get_ue(int $formation_id) {
        return DB::select( "SELECT * FROM ue WHERE id_formation = :id_form" , ['id_form'=>$formation_id] );
    }

    public static function get_matieres(int $ue_id) {
        return DB::select( "SELECT * FROM matiere WHERE id_ue = :id_ue" , ['id_ue'=>$ue_id] );
    }

    public static function get_matieres_incompatible(int $matiere_id) {
        $a = array_map( function($v){return $v->id_matiere_a;} , DB::select("SELECT id_matiere_a FROM incompatibilite WHERE id_matiere_b = :id_mat",['id_mat'=>$matiere_id]) );
        $b = array_map( function($v){return $v->id_matiere_b;} , DB::select("SELECT id_matiere_b FROM incompatibilite WHERE id_matiere_a = :id_mat",['id_mat'=>$matiere_id]) );
        return array_unique(array_merge($a,$b));
    }

    public static function get_matieres_incompatible_par_formation_text(int $formation_id) {
        $liste = DB::select(
       "SELECT *
        FROM incompatibilite
        WHERE id_matiere_a IN (
            SELECT mat.id
            FROM matiere AS mat 
                JOIN ue
                ON mat.id_ue = ue.id
            WHERE ue.id_formation = :id_form_a
                AND mat.id_groupe_opt IS NOT NULL)
        OR id_matiere_b IN (
            SELECT mat.id
            FROM matiere AS mat 
                JOIN ue
                ON mat.id_ue = ue.id
            WHERE ue.id_formation = :id_form_b
                AND mat.id_groupe_opt IS NOT NULL);",['id_form_a'=>$formation_id,'id_form_b'=>$formation_id]);
        return array_map( function($in) {
            $a = DB::select("SELECT descriptif FROM matiere WHERE id = :id_mat",['id_mat'=>$in->id_matiere_a])[0]->descriptif;
            $b = DB::select("SELECT descriptif FROM matiere WHERE id = :id_mat",['id_mat'=>$in->id_matiere_b])[0]->descriptif;
            return "L'option {$a} est incompatible avec l'option {$b}";
        }, $liste);
    }

    public static function get_matieres_choix(int $formation_id) {
        $liste = DB::select("SELECT mat.*
        FROM matiere AS mat 
            JOIN ue
            ON mat.id_ue = ue.id
        WHERE ue.id_formation = :id_form
            AND mat.id_groupe_opt IS NOT NULL",['id_form'=>$formation_id]);
        $result = [];
        foreach($liste as $mat) {
            if( ! isset( $result[ $mat->id_groupe_opt ] )) {
                $result[ $mat->id_groupe_opt ] = [
                    "compte" => DB::select("SELECT * FROM groupe_options WHERE id = :id_mat",['id_mat'=>$mat->id_groupe_opt])[0]->compte,
                    "matieres" => []
                ];
            }
            $id_groupe_opt = $mat->id_groupe_opt;
            $id = $mat->id;
            $mat = [ 'nom' => $mat->descriptif , 'incompatible' => BDD::get_matieres_incompatible($mat->id) ];
            $result[ $id_groupe_opt ]['matieres'][$id] = $mat ;
        }
        return $result;
    }

    public static function get_matiere_par_ue(int $formation_id) {
        // Transformation de la reqûete SQL en un format utilisable aisément par la vue
        $ue_liste = [];
        $mat_liste = [];
        foreach(BDD::get_ue($formation_id) as $ue) {
            if( ! isset($ue_liste[ $ue->bloc ]) ) {
                $ue_liste[ $ue->bloc ] = [];
            }
            array_push( $ue_liste[ $ue->bloc ] , $ue );
            $mat_liste[ $ue->id ] = BDD::get_matieres( $ue->id );
        }
        return [$ue_liste,$mat_liste];
    }

    public static function get_nom_choix_par_id(array $id_matiere_choix_liste) {
        return array_map(
            function ($id) { 
                return DB::select(
                    "SELECT descriptif FROM matiere WHERE id = :id_mat",
                    ['id_mat'=>$id]
                ) [0]->descriptif ;
            }
            ,
            $id_matiere_choix_liste
        );
    }

    public static function get_nom_formation_par_id(int $id_formation) {
        return DB::select(
            "SELECT nom FROM formation WHERE id = :id_form" ,
            ['id_form' => $id_formation]
        ) [0]->nom ;
    }

    public static function verification_coherence(int $formation_id,array $choix_matiere_id_list) {
        //vérification appartenance matière à la formation
        foreach($choix_matiere_id_list as $choix_matiere_id) {
            $formation_id_matiere = DB::select( 
            "SELECT ue.id_formation
             FROM ue
                JOIN matiere AS m
                ON m.id_ue = ue.id
             WHERE m.id = :id_mat;" , 
            ['id_mat' => $choix_matiere_id] )[0]->id_formation;
            if($formation_id_matiere != $formation_id) {
                return false;
            }
        }
        //vérification du bon nombre de choix pour la formation
        $attendu = DB::select(
        "SELECT groupe_options.id AS id_groupe, groupe_options.compte AS nmb
        FROM groupe_options
            JOIN matiere AS mat
            ON groupe_options.id = mat.id_groupe_opt
            JOIN ue
            ON mat.id_ue = ue.id
        WHERE ue.id_formation = :id_form
        GROUP BY id_groupe,nmb;",
        ['id_form' => $formation_id] );
        $donner = array_count_values(array_map( function ($mat_id) { return DB::select(
        "SELECT groupe_options.* 
        FROM groupe_options AS groupe_options
            JOIN matiere AS mat
            ON groupe_options.id = mat.id_groupe_opt
        WHERE mat.id = :id_mat;",
        ['id_mat' => $mat_id])[0]->id; } ,
        $choix_matiere_id_list ));
        foreach($attendu as $attente) {
            if($donner[ $attente->id_groupe ] != $attente->nmb) {
                return false;
            }
        }
        //vérification de la présence d'incompatibilité
        foreach($choix_matiere_id_list as $id) {
            if(count(array_intersect(BDD::get_matieres_incompatible($id),$choix_matiere_id_list)) != 0) {
                return false;
            }
        } 
        return true;
    }

    public static function set_etudiant(int $formation_id,array $choix_matiere_id_list) {
		DB::insert('INSERT INTO etudiant(nom,prenom) VALUES ("NTest","PTest")');
		$id = DB::select('SELECT id AS LastID FROM etudiant WHERE id = @@identity')[0]->LastID;
		DB::insert('INSERT INTO inscrit_formation(id_etudiant,id_formation) VALUES (:id_etu,:id_form)',['id_etu'=>$id,'id_form'=>$formation_id]);
		foreach($choix_matiere_id_list as $choix) {
			DB::insert('INSERT INTO choix_etudiants(id_etu,id_matiere) VALUES (:id_etu,:id_mat)',['id_etu'=>$id,'id_mat'=>$choix]);
		}
    }

    public static function get_classe_count_by_formation() {
        return DB::select('
        SELECT count(DISTINCT classe.id) AS "nmb_classe",formation.nom as "nom_formation"
        FROM classe 
          JOIN suivi ON classe.id = suivi.id_classe
          JOIN partie ON suivi.id_partie = partie.id
          JOIN appartenance_matiere ON partie.id_sous_matiere = appartenance_matiere.id_sous_matiere
          JOIN matiere ON appartenance_matiere.id_matiere = matiere.id
          JOIN ue ON matiere.id_ue = ue.id
          JOIN formation ON ue.id_formation = formation.id
          GROUP BY formation.id,formation.nom;
        ');

    }
}

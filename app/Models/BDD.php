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
}

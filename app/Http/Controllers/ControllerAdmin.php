<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use App\Jobs\ProcessRepartition;
use App\Models\TOKEN;
use App\Models\BDD;

use Queue;
class ControllerAdmin extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

	public function render() {
        session_start();
        if(isset($_POST["deco"])) {
            session_destroy();
            return redirect()->to('..');
        } else {
            if(!isset($_SESSION["admin"]))
            {
                if(isset($_POST["token"]) && TOKEN::is_token_admin($_POST["token"])){
                    $_SESSION["admin"] = true ;
                }else{
                    return view('adminConnexion');
                }
            }

            if( isset($_POST['algo']) ) {
                if( isset($_POST['repartition']) ) {
                    $repartition = $_POST['repartition'];
                } else {
                    $repartition = '';
                }
                Queue::push(new ProcessRepartition($repartition));
            }
            
            return view('admin',[
                'classeParFormation' => BDD::get_classe_count_by_formation() ,
                'algoDataCount' => BDD::get_algo_count_data()
            ]);
        }
    }

    public static function get_etudiants() {
        return join( 
            "\n" , 
            array_map(
                function($o) { return "{$o->prenom},{$o->nom},{$o->id}"; },
                BDD::get_export_etudiants()
            )
        );
    }

    public static function get_matieres() {
        return join(
            "\n" ,
            array_map(
                function($o) { return "{$o->mat_nom},{$o->mat_type},{$o->id}"; },
                BDD::get_export_matieres()
            )
        );
    }

    public static function get_formation() {
        return join(
            "\n" ,
            array_map(
                function($o) { return "{$o->id},{$o->formation}"; },
                BDD::get_export_formation()
            )
        );
    }
}

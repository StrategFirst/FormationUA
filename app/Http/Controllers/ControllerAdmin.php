<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class ControllerAdmin extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

	public function render() {
        session_start();
        if(isset($_GET["deco"])) {
            session_destroy();
            return view('welcome');
        } else {
            if(!isset($_SESSION["admin"]))
            {
                if(isset($_GET["token"]) && $_GET["token"] == "OmOOi1Jhsw"){
                    $_SESSION["admin"] = true ;
                }else{
                    return view('adminConnexion');
                }
            }
            return view('admin');
        }
    }    
}

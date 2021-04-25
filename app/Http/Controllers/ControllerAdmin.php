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
        if(isset($_POST["deco"])) {
            session_destroy();
            return view('welcome');
        } else {
            if(!isset($_SESSION["admin"]))
            {
                if(isset($_POST["token"]) && $_POST["token"] == "OmOOi1Jhsw"){
                    $_SESSION["admin"] = true ;
                }else{
                    return view('adminConnexion');
                }
            }
            return view('admin');
        }
    }    
}

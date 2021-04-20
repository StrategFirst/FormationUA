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
        
        if(!isset($_SESSION["admin"]))
        {
            if(isset($_GET["token"]) && $_GET["token"] == "OmOOi1Jhsw"){
                $_SESSION["amdin"] = true ;
            }else{
                return view('adminConnexion');
            }
        }
            return view('adminConnexion');
    }    
}

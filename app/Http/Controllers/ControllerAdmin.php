<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use App\Jobs\ProcessRepartition;
use App\Models\TOKEN;

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
                Queue::push(new ProcessRepartition());
            }

            if( isset($_POST['pdf']) ) {  }
            return view('admin');
        }
    }
    
    public function generation() {
    }
}

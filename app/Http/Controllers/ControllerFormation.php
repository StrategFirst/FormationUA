<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use App\Models\BDD;
use App\Models\OPTI;

class ControllerFormation extends BaseController
{
   use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

	public function render() { 
		if(
			isset($_POST['precedforma'])
		) {
			$formation = BDD::get_formations();
			switch($_POST['precedforma']) {
				case 'bac': //BAC
					$keyword = ['L1' => 2 ,'Licence' => 1, 'Master' => -1 , 'Doctorat' => -2];
					break;
				case 'cpe': //CPGE
				case 'dut': //DUT
				case 'bts': //BTS
					$keyword = ['L3' => 2 ,'Licence' => 1, 'Master' => -1 , 'Doctorat' => -2];
					break;
				case 'lic': //Licence
					$keyword = ['M1' => 2 ,'Master' => 1 , 'Doctorat' => -1];
					break;
				case 'mst': //Master
					$keyword = ['Licence' => -20, 'Master' => -1 , 'Doctorat' => 2];
					break;
				case 'doc': //Doctorat
				case 'oth': //Autre
				default:
					$keyword = [];

			}
			return view( 'formation' , [
				'formation' => OPTI::sort_formation($formation,$keyword)
			] );
		} else {
			return response(view('errors.pattern',['err' => '406 - Parameters missing or not acceptable']),406);

		}
	}
	
}

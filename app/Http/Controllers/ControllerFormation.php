<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class ControllerFormation extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    

	public function render() { return view('formation'); }
}

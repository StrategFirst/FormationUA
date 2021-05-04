<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OPTI extends Model
{
    use HasFactory;


    public static function sort_formation(array $formation,array $keyword) {
        $formation_evalue = [];
        foreach($formation as $form) {
            $valuation = [];
            foreach($keyword as $word => $value ) {
                array_push($valuation , substr_count( strtolower($form->nom) , strtolower($word)  ) * $value * 10
                            +  substr_count( strtolower($form->description) , strtolower($word)  ) * $value );
            }
            array_push( $formation_evalue , [
                "valuation" => array_sum($valuation),
                "formation" => $form
            ]);
        }
        usort( $formation_evalue , function ($a,$b) {
            return $b['valuation'] - $a['valuation'];
        });
        return array_map( function($fe) { return $fe['formation']; } , $formation_evalue);
    }
}

<!DOCTYPE html>
<html lang="fr-FR" dir="ltr">
    <head>
        <meta charset="utf-8"/>
        <title> {{config('app.name')}} </title>

        <link rel="stylesheet" href="{{asset('css/app.css')}}"/>
        <link rel="stylesheet" href="{{asset('css/404.css')}}"/>

        <script src="{{asset('js/diplome.js')}}"></script>
    </head>

    <body>
	 	<img src="{{asset('BrokenGearsUA.svg')}}" id="brokengears"/>

         <h1> <?= isset($err) ? $err : '500 - Internal server errors' ?> </h1>
    </body>
</html>
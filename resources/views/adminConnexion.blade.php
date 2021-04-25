<!DOCTYPE html>
<html lang="fr-FR" dir="ltr">
    <head>
        <meta charset="utf-8"/>
        <title>Laravel</title>

        <link rel="stylesheet" href="{{asset('css/app.css')}}"/>
        <link rel="stylesheet" href="{{asset('css/adminConnexion.css')}}"/>

    </head>

    <body>
        <form action="{{ route('admin') }}" method="POST">
            @csrf
            <input type="text" name="token" placeholder="Token" autocomplete="off">
            <input type="submit" name="" value="Envoyer">
        </form>
    </body>
</html>
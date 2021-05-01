<!DOCTYPE html>
<html lang="fr-FR" dir="ltr">
    <head>
        <meta charset="utf-8"/>
        <title> Formation UA </title>

        <link rel="stylesheet" href="{{asset('css/app.css')}}"/>
        <link rel="stylesheet" href="{{asset('css/home.css')}}"/>

        <script src="{{asset('js/diplome.js')}}"></script>
    </head>

    <body>
        <form action="{{ route('formation') }}" method="POST">
            @csrf
            <h1> Quel est votre dernier diplôme </h1>
            <select name="precedforma">
                <option default value=""> Choisissez . . . </option>
                <option value="bac"> Baccalauréat </option>
                <option value="bts"> BTS </option>
                <option value="cpe"> CPGE </option>
                <option value="lic"> Licence </option>
                <option value="dut"> DUT </option>
                <option value="mst"> Master </option>
                <option value="doc"> Doctorat </option>
                <option value="oth"> Autre </option>
            </select>
        </form>
        <button> Admin </button>
    </body>
</html>
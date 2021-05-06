<!DOCTYPE html>
<html lang="fr-FR" dir="ltr">
    <head>
        <meta charset="utf-8"/>
        <title> {{config('app.name')}} - admin </title>

        <link rel="stylesheet" href="{{asset('css/app.css')}}"/>
        <link rel="stylesheet" href="{{asset('css/admin.css')}}"/>
    </head>

    <body>
        <form action="{{ route('admin') }}" method="POST">
        @csrf
        <button name="deco">Deconnexion</button>

        <fieldset>
            <legend>Repartition</legend>
            <button id="algo" name="algo">Generer </button>
            <button id="pdf" >Recuperer </button>
        </fieldset>
        

        <fieldset title="WIP">
            <legend> Option </legend>
            <button> Répartition even / bourrage </button> <!-- 20 20 20 2 OU 17 17 17 17-->
            <button> Humainement facile </button> <!-- TP1 + TP2 = TD1 & TP3 + TP4 = TD2 & TD1 + TD2 = CM  OU des étudiants peuvent être réparti comme on veut -->
        </fieldset>

        
        <fieldset title="WIP">
            <legend> Insertion </legend>
            <button> Insertion massive Étudiant </button>
            <button> Insertion Formation</button>
        </fieldset>

        </form>

    </body>
</html>
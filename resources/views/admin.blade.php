<!DOCTYPE html>
<html lang="fr-FR" dir="ltr">
    <head>
        <meta charset="utf-8"/>
        <title> {{config('app.name')}} - admin </title>

        <link rel="stylesheet" href="{{asset('css/app.css')}}"/>
        <link rel="stylesheet" href="{{asset('css/admin.css')}}"/>

        <script defer src="{{asset('js/admin.js')}}"></script>
    </head>

    <body>
        <h1> Administration </h1>

        <aside>
            
        </aside>

        <form action="{{ route('admin') }}" method="POST">
            @csrf

            <div>
                <h3>Repartition</h3>
                <button id="algo" name="algo">Generer </button>
                <button id="pdf" >Recuperer </button>
            </div>
            
            <div>
                <h3> Option </h3>
                <label class="custom-radio" for="repartition-equilibre">
                    <input type="radio" name="repartition" id="repartition-equilibre" value="equilibre"/>
                    <span> Even </span>
                </label>
                <label class="custom-radio" for="repartition-bourrage">
                    <input type="radio" name="repartition" id="repartition-bourrage" value="bourrage"/>
                    <span> Bourrage </span>
                </label>
            </div>


            <button name="deco">Deconnexion</button>

        </form>

    </body>
</html>

<!DOCTYPE html>
<html lang="fr-FR" dir="ltr">
    <head>
        <meta charset="utf-8"/>
        <title> {{config('app.name')}} </title>

        <link rel="stylesheet" href="{{asset('css/app.css')}}"/>
        <link rel="stylesheet" href="{{asset('css/formation.css')}}"/>

        <script src="{{asset('js/formation.js')}}"></script>
    </head>

    <body>
        <input type="hidden" name="_token" value="{{ csrf_token() }}" id="_token">
        <nav>
            <input type="search" name="" id="search"/>
        </nav>
        <main>
            <?php
                foreach($formation as $val) {
                    echo "<section id=\"{$val->id}\">";
                    echo "<h3> {$val->nom} </h3>";
                    echo "<p> {$val->description} </p>";
                    echo "</section>";
                }
            ?>
        </main>
    </body>
</html>
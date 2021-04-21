<!DOCTYPE html>
<html lang="fr-FR" dir="ltr">
    <head>
        <meta charset="utf-8"/>
        <title>Laravel</title>

        <link rel="stylesheet" href="{{asset('css/app.css')}}"/>
        <link rel="stylesheet" href="{{asset('css/option.css')}}"/>

    </head>

    <body>

        <form action="{{ route('recap') }}" method="POST">
            @csrf
            <ul>
                <li><label for="DIGA"> <input type="radio" id="DIGA" name="G1"/> <span> DIGA </span> </label></li>
                <li><label for="ISI"> <input type="radio" id="ISI" name="G1"/> <span> ISI </span> </label></li>
            </ul>
            <ul>
                <li><label for="PY"> <input type="radio" id="PY" name="G2"/> <span> PY </span> </label></li>
                <li><label for="SI"> <input type="radio" id="SI" name="G2"/> <span> SI </span> </label></li>
                <li><label for="A"> <input type="radio" id="A" name="G2"/> <span> A </span> </label></li>
            </ul>
            
            <button>Envoyer</button>
        </form>
        
    </body>
</html>
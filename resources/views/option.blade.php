<!DOCTYPE html>
<html lang="fr-FR" dir="ltr">
    <head>
        <meta charset="utf-8"/>
        <title>Laravel</title>

        <link rel="stylesheet" href="{{asset('css/app.css')}}"/>
        <link rel="stylesheet" href="{{asset('css/option.css')}}"/>

    </head>

    <body>
        <pre> <?php print_r($test) ?> </pre>
        <main>
            <h2> Enseignement </h2>
            <?php
                //Variable pour conserver une indentation correct coté client
                $i1 = "\t\t\t";
                $i2 = "\t\t\t\t";
                $i3 = "\t\t\t\t\t";
                $nl = "\n";
                foreach($ues as $numero => $block) {
                    echo "$nl";
                    echo "$i1<section>$nl";
                    echo "$i2<h3> Bloc n° {$numero} </h3>$nl";
                    echo "$i2<details>$nl";
                    foreach($block as $ue) {
                        echo "$i2<article>$nl ";
                        echo "$i3<h4> {$ue->nom} </h4>$nl";
                        echo "$i3<p> {$ue->description} </p>$nl";
                        echo "$i3<h6> Matières : </h6>$nl";
                        echo "$i3<ul>$nl";
                        foreach($matieres[$ue->id] as $matiere) {
                            echo "$i3$i1<li>{$matiere->descriptif}</li>$nl";
                        }
                        echo "$i3</ul>$nl";
                        echo "$i2</article>$nl";
                    }
                    echo "$i2</details>$nl";
                    echo "$i1</section>$nl$nl";
                }
            ?>
        </main>

        <form action="{{ route('recap') }}" method="POST">
            <input type="hidden" value="<?= $_POST['formation_id'] ?>"/>
            <h2> Choisissez vos options </h2>
            @csrf
            <!--
            <ul>
                <li><label for="DIGA"> <input type="checkbox" id="DIGA" name="G1"/> <span> DIGA </span> </label></li>
                <li><label for="ISI"> <input type="checkbox" id="ISI" name="G1"/> <span> ISI </span> </label></li>
            </ul>
            <ul>
                <li><label for="PY"> <input type="checkbox" id="PY" name="G2"/> <span> PY </span> </label></li>
                <li><label for="SI"> <input type="checkbox" id="SI" name="G2"/> <span> SI </span> </label></li>
                <li><label for="A"> <input type="checkbox" id="A" name="G2"/> <span> A </span> </label></li>
            </ul>
            -->
            <button>Envoyer</button>
        </form>
        
    </body>
</html>
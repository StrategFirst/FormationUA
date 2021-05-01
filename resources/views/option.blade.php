<!DOCTYPE html>
<html lang="fr-FR" dir="ltr">
    <head>
        <meta charset="utf-8"/>
        <title> Formation UA </title>

        <link rel="stylesheet" href="{{asset('css/app.css')}}"/>
        <link rel="stylesheet" href="{{asset('css/option.css')}}"/>

        <script>
            let incompatible = {
            <?php
                foreach($choix as $ele) {
                    foreach($ele['matieres'] as $id => $matiere) {
                        echo '"'.$id.'": [' . join($matiere['incompatible'] , ',') . '],';
                    }
                }
            ?>
            };
        </script>
        <script defer src="{{asset('js/incompatibilite.js')}}"></script>

    </head>

    <body>
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
                            echo "$i1$i1<li>{$matiere->descriptif}</li>$nl";
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
            <input type="hidden" name="id_formation" value="<?= $_POST['formation_id'] ?>"/>
            <h2> Choisissez vos options </h2>
            <details id="incompatible_desc">
            <ul> <?= join('',array_map(function ($in){return "<li>$in</li>";},$incompatible)) ?> </ul>
            </details>
            @csrf
            <?php
            foreach($choix as $ele) {
                echo '<div class="choix-groupe choix-count-'.$ele['compte'].'">';
                echo "<i> Requiert {$ele['compte']} choix </li>";
                foreach($ele['matieres'] as $id => $matiere) {
                    echo '<label for="Opt'.$id.'"> <input type="checkbox" id="Opt'.$id.'" name="opt_choix[]" value="'.$id.'"/> <span class="choix"> '.$matiere['nom'].' </span> </label>';
                }
                echo '</div>';
            }
            ?>
            <button>Envoyer</button>
        </form>
        
    </body>
</html>
<!DOCTYPE html>
<html lang="fr-FR" dir="ltr">
    <head>
        <meta charset="utf-8"/>
        <title> Formation UA </title>

        <link rel="stylesheet" href="{{asset('css/app.css')}}"/>
        <link rel="stylesheet" href="{{asset('css/recap.css')}}"/>

    </head>

    <body>
        <div>
        <h2> Récapitulatif </h2>
        <p>Vous avez choisi <strong>Licence 3 INFORMATIQUE</strong></p>
        <p>Avec les options suivantes : 
        <ul>
            <li>DIGA</li>
            <li>SI</li>
        </ul></p>

        <section id="info">
            Vous pouvez retrouver sur le campus : 
            <ul>
                <li>
                    <a href="https://www.univ-angers.fr/fr/vie-des-campus/sport.html" target="_blank">
                        <abbr title="Service Universitaire d'Activité Physique et Sportive">SUAPS</abbr>
                    </a>
                </li>
                <li>
                    <a href="https://www.univ-angers.fr/fr/vie-des-campus/sante.html" target="_blank">
                        <abbr title="Service Universitaire de Médecine Préventive et la Santé">SUMPS</abbr>
                    </a>
                </li>
                <li><a href="http://www.fneb.fr/corpo-sciences-angers/" target="_blank">Corpo Science Angers</a></li>
                <li>
                    <a href="https://projetcohesion.info/" target="_blank">
                        <abbr title="Projet et Cohésion en Informatique">PC[I]</abbr>
                    </a>
                </li>
                <li>
                    <a href="https://bu.univ-angers.fr/accueil" target="_blank">
                        <abbr title="Bibliotheques Universitaire">BU</abbr>
                    </a>
                </li>
            </ul>
        </section>

        <p> Votre groupe vous sera communiquer prochainement </p>

        <pre>
        <?php print_r($_POST); ?>

        </pre>
    </body>
</html> 
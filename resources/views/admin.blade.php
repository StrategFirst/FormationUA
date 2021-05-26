<!DOCTYPE html>
<html lang="fr-FR" dir="ltr">
    <head>
        <meta charset="utf-8"/>
        <title> {{config('app.name')}} - admin </title>

        <link rel="stylesheet" href="{{asset('css/app.css')}}"/>
        <link rel="stylesheet" href="{{asset('css/admin.css')}}"/>

        <script defer src="{{asset('js/admin.js')}}"></script>
        <script src="{{asset('js/graph.js')}}"></script>
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

            <div id="data">
                <h3> Information </h3>
                <span title="Ces données ne sont pas mises à jour automatiquement!"> &#x26a0;</span>
                <h6> Nombre de classe par formation : </h6>
                <div id="data-classe">
                    <script> 
                        let data = <?php
                            echo 
                                "{" .
                                implode( 
                                    ',' , 
                                    array_map( 
                                        function($data) { return "'{$data->nom_formation}':{$data->nmb_classe}"; },
                                        $classeParFormation
                                    )
                                )
                                . "}; ";
                        
                        ?>;
                        Repartition(document.getElementById('data-classe'),data);
                    </script>
                </div>
            </div>
            <button name="deco">Deconnexion</button>

        </form>

    </body>
</html>
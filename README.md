# FormationUA
Application pour s'inscrire au différente formation de l'université d'Angers
et permettre la création et répartition des étudiants dans différents groupes

## Installation
Avant l'installation assuez-vous d'avoirs installer Laravel 8.x, et g++ avec c++17 ou supérrieur, os linux
1. Télécharger ce répertoire
2. créé le fichier .env avec votre config et via le modèle .env.example
3. Lancer le serveur avec ./run (une fois dans le répertoire du projet, l'utilisateur éxécutant le programme doit avoirs les permissions sur les fichiers et de lancer un serveur)


## Information pour développeur 
### Format des fichiers CSV pour algorithme de réparition
##### Entrée
 - suivi.csv
`<Identifiant étudiant>,<Identifiant matière suivi par l'étudiant>`
 - contrainte.csv
`<Identifiant du cours>,<Type du cours>,<Volume maximum d'étudiants>`
##### Sortie
 - etudiant_groupe.csv
`<Identifiant étudiant>,<Identifiant du groupe de l'étudiant>`
 - groupe_classe.csv
`<Identifiant du groupe de l'étudiant>,<Identifiant de la classe>`
 - classe_matiere.csv
`<Identifiant de la classe>,<Identifiant du cours>,<Type du cours>`

### API
Une API au format JSON est disponible, avec une limitation d'une requête toutes les 10 secondes,
et avec un token en restriction, en voici la structure :
<pre>
 /api
 | Retourne des informations général sur l'application (a utiliser pour vérifié votre code externe)
 |
 ├ /etudiant
 |  Par défaut : une liste d'étudiant, et un étudiant étant un identifiant, une catégorie, un nom et un prénom
 |  Si un `id` est fournis : 
 |  	si l'étudiant avec l'id éxiste : un objet d'étudiant avec en plus groupe qui contient l'id de ses groupes
 |  	si l'étudiant n'éxiste pas : un objet avec le champ "Pas d'étudiant pour l'id"
 |
 ├ /groupe
 |  Par défaut : une liste de groupe, c'est à dire une liste de pair (id,nom)
 |  Si un `id` est fournis :
 |  	si le groupe avec l'id éxiste : un objet de groupe, avec en plus les étudiants et les classes liés
 |  	si le groupe n'éxiste pas : un objet avec le champ "Pas de groupe pour l'id"
 |
 ├ /classe
 |  Par défaut : une liste de groupe, c'est à dire une liste de pair (id,nom)
 |  Si un `id` est fournis :
 |  	si la classe avec l'id éxiste : un objet de classe, avec en plus les groupes et les matières liés
 |  	si le groupe n'éxiste pas : un objet avec le champ "Pas de classe pour l'id"
 |
 ├ /formation
 |  Retourne la liste des formations
 |
 └ /admin
    Retourne des informations relativent au statut du serveur
    ⚠️ Cette partie de l'API requiert des droits suplémentaire (connecter en tant qu'administrateur)
 
</pre>

### Executable :
`/run`
script bash de lancement automatique du serveur

`/repartition/run`
execute le programme de répartition 

`/repartition/compile`
compile le programme de répartition 

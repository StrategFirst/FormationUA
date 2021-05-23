# FormationUA
Application pour s'inscrire au différente formation de l'université d'Angers
et permettre la création et répartition des étudiants dans différents groupes

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
###### TO DO

### Executable :
`/run`
script bash de lancement automatique du serveur

`/repartition/run`
execute le programme de répartition (plus de détails dans le repertoire du fichier)

### Avancement projet :

- [x] Modélisation de la BDD
- [x] Architecture du site
- [x] Parti "étudiant"
	- [x] Déterminer la structure
	- [x] Front-end
		- [x] Page : Précédente formation
		- [x] Page : Choix formation
		- [x] Page : Choix option
		- [x] Page : Récapitulatif
		- [x] Contrainte : Empécher la saisie d'option "impossible"
	- [x] Back-end
		- [x] Afficher les options en fonction de la formation
		- [x] Afficher le récapitulatif en fonction de la formation et des options
		- [x] Vérifier que les formations et options sont bien compatibles
		- [x] Inséré dans la BDD les données de l'étudiant
		- [x] Trié les formations en fonction de la précédente formation éffectuer
		- [x] Empécher les accès aux pages via l'url direct pour ignoré des étapes
		- [x] Changer les headers des réponses
		- [x] Gestion personnalisé des pages d'erreur (404,500 etc)
	- [ ] Faire des test de sécurité (insertion sql etc)
- [ ] Parti "admin"
	- [x] Déterminer la structure
	- [ ] Front-end
	- [ ] Back-end
		- [x] Programme d'extraction de la BDD vers CSV (php)
		- [x] Programme d'insertion de CSV vers la BDD (php)
		- [x] Algorithme de réparatition (c++)
			- [x] Récupération des données depuis le CSV
			- [x] formatage des données obtenu pour leur traitement CSV
			- [ ] Traitement "even" CSV
			- [x] Traitement "bourrage" CSV
			- [x] Ecriture dans les fichier CSV
		- [x] Programme d'extraction des données de l'algo en page web
		- [ ] Programme d'extraction des données de l'algo pdf
- [ ] Parti "api"
	- [x] Choix de fonctionnement
		- [x] Choix du format d'entrée
		- [x] Choix du format de sortie (json)
	- [ ] Récupération des données depuis la BDD
	- [ ] Transformation et expositions des données
	- [ ] Restriction d'accès (token ?)


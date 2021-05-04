# FormationUA
Application pour s'inscrire au différente formation de l'université d'Angers
et permettre la création et répartition des étudiants dans différents groupes

### Avancement projet :

- [x] Modélisation de la BDD
- [x] Architecture du site
- [x] Parti "étudiant"
	- [x] Déterminer la structure
	- [x] Front-end
		- [x] Précédente formation
		- [x] Choix formation
		- [x] Choix option
		- [x] Récapitulatif
		- [x] Empécher la saisie d'option "impossible"
	- [x] Back-end
		- [x] Afficher les options en fonction de la formation
		- [x] Afficher le récapitulatif en fonction de la formation et des options
		- [x] Vérifier que les formations et options sont bien compatibles
		- [x] Inséré dans la BDD les données de l'étudiant
		- [ ] Trié les formations en fonction de la précédente formation éffectuer
		- [ ] Empécher les accès aux pages via l'url direct pour ignoré des étapes
		- [ ] Changer les headers des réponses
	- [ ] Faire des test de sécurité (insertion sql etc)
- [ ] Parti "admin"
	- [x] Déterminer la structure
	- [ ] Front-end
	- [ ] Back-end
		- [ ] Programme d'extraction de la BDD vers CSV (php)
		- [ ] Programme d'insertion de CSV vers la BDD (php)
		- [ ] Algorithme de réparatition (c++)
		- [ ] Programme d'extraction des données de l'algo en page web
		- [ ] Programme d'extraction des données de l'algo pdf
- [ ] Parti "api"
	- [x] Choix de fonctionnement
		- [x] Choix du format d'entrée
		- [x] Choix du format de sortie (json)
	- [ ] Récupération des données depuis la BDD
	- [ ] Transformation et expositions des données
	- [ ] Restriction d'accès (token ?)


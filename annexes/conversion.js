/*
Programme pour node.js
petit script de transformation d'un fichier source au format JSON (généré via un script nodejs de webscraping)
vers un fichier d'insertion SQL
*/

let liste_etudiant = require('./etudiant.json');

liste_etudiant =
	liste_etudiant
		.filter( etudiant => 
			etudiant.Formation == 'L1 MPCIE' ||
			etudiant.Formation == 'L3 Informatique'
		)
		.map( etudiant => {
			// Formation
			switch(etudiant.Formation) {
				case 'L1 MPCIE': etudiant.Formation = 10; break;
				case 'L2 MPCIE': etudiant.Formation = 11; break;
				case 'L3 Informatique': etudiant.Formation = 12; break;
			}
			// Matiere
			etudiant.Choix = etudiant.Choix.map( c => {
				switch(c) {
					case 'Informatique': return 24;
					case 'Macro Économie': return 35;
					case 'Mathématique': return 23;
					case 'Méca2': return 34;
					case 'Physique Chimie': return 22;
					case 'DIGA': return 13;
					case 'ISI': return 15;
					case 'PY': return 12;
					case 'SI': return 11;
				}
			} );
			// Renvoie
			return etudiant;
		} );

liste_etudiant.forEach( etudiant => {
	console.log(
		`INSERT INTO etudiant(nom,prenom) VALUES ("${etudiant.Nom}","${etudiant.Prenom}");`
	);
	console.log(
		`INSERT INTO inscrit_formation(id_etudiant,id_formation) VALUES ((SELECT id FROM etudiant WHERE nom="${etudiant.Nom}" AND prenom="${etudiant.Prenom}" LIMIT 1),${etudiant.Formation});`
	);
	etudiant.Choix.forEach( choix => {
		console.log(
			`INSERT INTO choix_etudiants(id_matiere,id_etu) VALUES (${choix},(SELECT id FROM etudiant WHERE nom="${etudiant.Nom}" AND prenom="${etudiant.Prenom}" LIMIT 1));`
		); 
	} );
});

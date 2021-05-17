-- Requête utilisé pour généré la vue suivi_etudiant sous matières
-- Cette vue permet de directement prendre tous les couples possibles et uniques de sous_matieres et d'étudiant
-- en mémorisant que leurs identifiant

--La première sous requête récupère tous les couples possibles via les matières/ue/parcours obligatoires
--La seconde sous requête récupère tous les couples possibles via les matières/ue/parcours a choix / optionnel
SELECT DISTINCT 
	   inscrit_formation.id_etudiant AS id_etu,
       appartenance_matiere.id_sous_matiere AS id_mat
	FROM inscrit_formation
		JOIN ue ON inscrit_formation.id_formation = ue.id_formation
        JOIN matiere ON ue.id = matiere.id_ue
        JOIN appartenance_matiere on matiere.id = appartenance_matiere.id_matiere
    WHERE matiere.id_groupe_opt IS NULL
UNION
SELECT DISTINCT 
	   choix_etudiants.id_etu AS id_etu,
       appartenance_matiere.id_sous_matiere AS id_mat
	FROM choix_etudiants
       JOIN appartenance_matiere ON choix_etudiants.id_matiere = appartenance_matiere.id_matiere;

--Une requête permettant (une fois la vue créé) une vérification de l'unicité des couples serait :
-- SELECT * FROM `suivi_etudiant_sous_matiere` WHERE `id_etu` = 5 AND `id_mat` = 44
/*
SELECT count(*),a.*
	FROM suivi_etudiant_sous_matiere AS a
    JOIN suivi_etudiant_sous_matiere AS b
    	ON a.id_etu = b.id_etu
        AND a.id_mat = b.id_mat
    GROUP BY a.id_etu,a.id_mat
    HAVING count(*) > 1;
*/
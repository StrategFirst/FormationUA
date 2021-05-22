#include <iostream>
#include <string>
#include <vector>
#include <array>
#include <algorithm>
#include <utility>
#include <cmath>

// Constante de configuration
const int TAILLE_GRP_MAX = 5;

// Code externe
#include "csv_read.cc"

#include "etudiant.cc"
#include "matiere.cc"

// Code principal

// Une classe est un ensemble de groupe (dont le cardinal est borné de 0 à X, X étant prédéfini) qui suit un ensemble de matière
// Un groupe est un ensemble d'étudiant (dont le cardinal est borné de 0 à TAILLE_GRP_MAX, TAILLE_GRP_MAX étant une constante ajustable)
// Un étudiant est ici représenté par un id unique qui lui a été attribué
// Une matière est ici représenté par un id unique qui lui a été attribué et un type de cours (td,tp,cm,...)
struct Classe {
	std::vector<std::array<size_t,TAILLE_GRP_MAX>> etudiants;
	std::vector<std::pair<size_t,TypeCour>> matiere_suivi;
};

// Une promotion est un ensemble de classe
using Promotion = std::vector<Classe>;

void AffichageRepartition(const std::vector<Promotion> & promotions) {
	for(auto promotion:promotions) {
		std::cout << "Parcours : " << std::endl;
		
		for(auto classe:promotion) {
			std::cout << "\t" << "La classe : " << std::endl;
			
			std::cout << "\t\t" << "étudiants : (" << classe.etudiants.size() * TAILLE_GRP_MAX << ")" << std::endl;
			std::cout << "\t\t\t";
			for(auto groupes:classe.etudiants) {
				for(auto etudiant:groupes) {
					std::cout << etudiant << ", ";
				}
			}
			std::cout << std::endl;

			std::cout << "\t\t" << "matières : (" << classe.matiere_suivi.size() << ")" << std::endl;
			std::cout << "\t\t\t";
			for(auto matiere:classe.matiere_suivi) {
				std::cout << matiere.first << "(" << StringFromTypeCour(matiere.second) << "), ";
			}
			std::cout << std::endl;

			std::cout << std::endl;
		}
		std::cout << std::endl;
	}

}

std::vector<Promotion> repartitition(Info* data,Matiere* mat,bool repartititionLisse) {
	bool alpha = true;
	bool beta = true;
	std::vector<Promotion> promotions;
	for(auto & promo:*data) { // Pour chaque futurs promotion
		Promotion promotion;
		std::cout << std::endl;
		//on liste tous les volumes d'étudiants demander, et on garde chaque matière qui le demande
		std::map<size_t,std::vector<std::pair<size_t,TypeCour>>> volEtu;
		for(const size_t id_mat:promo.id_mat) {
			for(auto const & ite:mat->at(id_mat)) {
				try {
					volEtu.at(ite.second).push_back( {id_mat,ite.first} );
				} catch(std::out_of_range & e) {
					volEtu.insert( { ite.second , {{id_mat,ite.first}} } );
				}
			}
		}
		

		for(auto v:volEtu) {
			if(repartititionLisse) { // répartition : "even" / "lisse"
				/*
					Nombre d'étudiant par groupe	= TAILLE_GRP_MAX 	 = *donnée*
					Nombre d'étudiant par classe	= v.first 			 = *donnée*
					Nombre de groupe					= promo.etudiants.size() = *donnée*
					Nombre de groupe par classe	= nb_grp_par_classe= ⌊ NombreEtudiantParClasse / NombreEtudiantParGroupe ⌋
					Nombre de classe					= nb_classe			 = ⌈ NombreDeGroupe / NombreDeGroupeParClasse ⌉
				*/
				int nb_grp_par_classe = floor(((float)(v.first)) / ((float)(TAILLE_GRP_MAX)));
				int nb_classe = ceil( promo.etudiants.size() / nb_grp_par_classe);
				int nb_goupe_suplement = v.first % TAILLE_GRP_MAX;

				int pos = 0;
				for(int c=0 ; c<nb_classe ; c++) {
					Classe cl;
					cl.matiere_suivi = v.second;
					for(int g=0 ; g<nb_grp_par_classe ; g++) {
						cl.etudiants.push_back(promo.etudiants[pos]);
						pos++;
					}
					if(nb_goupe_suplement > 0) {
						cl.etudiants.push_back(promo.etudiants[pos]);
						pos++;
					}
					promotion.push_back(cl);
				}
			} else { // répartition : "bumpy" / "bourage"
				for(size_t c=0 ; c<promo.etudiants.size() ;) {
					Classe cl;
					cl.matiere_suivi = v.second;
					for(size_t g=0 ; g<v.first && c<promo.etudiants.size(); g+=TAILLE_GRP_MAX) {
						cl.etudiants.push_back(promo.etudiants[c]);
						c++;
					}
					promotion.push_back(cl);
				}
			}
		}

		promotions.push_back(promotion);
	}

	return promotions
}

int main(int argc,char* argv[]) {
	// Paramètre et valeur par défaut :
	bool repartititionLisse = false;
	bool debug = false;

	//Lecture des paramètres en entrée
	for(int i=0 ; i<argc ; i++) {
		std::string arg(argv[i]);
		if(arg == "--debug") debug = true;
		if(arg == "--repartition:balanced") repartititionLisse = true;
		if(arg == "--repartition:unbalanced") repartititionLisse = false;
	}

	//Récupération depuis les différents fichier csv, obtenu via php
	Info* data = getEtudiant();
	Matiere* mat = getMatiere();

	if(debug) {
		std::cout << " ■ Liste des étudiants réparti dans les petits groupes" << std::endl;
		afficheInfo(*data);
	}

	//Traitement des données pour répartittions des étudiants
	auto resultat = resulrepartitition(data,mat,repartititionLisse);

	if(debug) {
		std::cout << " ■ Liste des répartitions des étudiants avec leurs matières" << std::endl;
		AffichageRepartition(resultat);
	}

	//On peut désormais supprimé les données extraites des fichiers car elles sont correctement formaté ailleurs
	delete data;
	delete mat;

	//Ré-écriture dans un fichier csv

	return EXIT_SUCCESS;
}
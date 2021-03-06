#include <iostream>
#include <string>
#include <vector>
#include <array>
#include <algorithm>
#include <utility>
#include <cmath>
#include <map>

// Constante de configuration
const int TAILLE_GRP_MAX = 5;

// Code externe
#include "type.hh"
#include "convert.hh"

#include "csv_read.cc"
#include "csv_write.cc"

#include "etudiant.cc"
#include "matiere.cc"


// Code principal

void AffichageRepartition(const std::vector<Promotion> & promotions) {
	for(auto promotion:promotions) {
		std::cout << "Parcours : " << std::endl;
		
		for(auto classe:promotion) {
			std::cout << "\t" << "La classe : " << std::endl;
			
			std::cout << "\t\t" << "étudiants : (" << classe.etudiants.size() * TAILLE_GRP_MAX << ")" << std::endl;
			std::cout << "\t\t\t";
			for(auto groupes:classe.etudiants) {
				for(auto etudiant:groupes.etudiants) {
					std::cout << etudiant << ", ";
				}
			}
			std::cout << std::endl;

			std::cout << "\t\t" << "matières : (" << classe.matiere_suivi.size() << ")" << std::endl;
			std::cout << "\t\t\t";
			for(auto matiere:classe.matiere_suivi) {
				std::cout << matiere.first << "(" << StringFromTypeCours(matiere.second) << "), ";
			}
			std::cout << std::endl;

			std::cout << std::endl;
		}
		std::cout << std::endl;
	}

}

std::vector<Promotion> repartitition(Info* data,Matiere* mat,bool repartititionLisse) {
	std::vector<Promotion> promotions;
	size_t offset_id_groupe = 1;
	for(auto & promo:*data) { // Pour chaque futurs promotion
		Promotion promotion;
		//on liste tous les volumes d'étudiants demander, et on garde chaque matière qui le demande
		std::map<size_t,std::vector<std::pair<size_t,TypeCours>>> volEtu;
		for(const size_t id_mat:promo.id_mat) {
			for(auto const & ite:mat->at(id_mat)) {
				try {
					volEtu.at(ite.second).push_back( {id_mat,ite.first} );
				} catch(std::out_of_range & e) {
					volEtu.insert( { ite.second , {{id_mat,ite.first}} } );
				}
			}
		}

		//affectation d'un UID à chaque groupe
		std::vector<Groupe> lesGroupes;
		for(auto & grp:promo.etudiants) {
			lesGroupes.push_back({ offset_id_groupe , grp});
			offset_id_groupe++;
		}
		

		for(auto v:volEtu) {
			if(repartititionLisse) { // répartition : "even" / "lisse"
				/*
					max etu par groupe = TAILLE_GRP_MAX
					max etu par classe = v.first
					nombre groupe = lesGroupes.size()
					nombre etu = lesGroupes.size() * TAILLE_GRP_MAX
					nombre classe = nombre etu / nombre etu par classe
				*/
				int nmbEtu = lesGroupes.size() * TAILLE_GRP_MAX;
				int nmbClasse = ceil( ((float)nmbEtu) / ((float)(v.first)) );
				std::vector<Classe> cls;
				for(int i=0 ; i<nmbClasse ; i++) {
					Classe cl;
					cl.matiere_suivi = v.second;
					cls.push_back(cl);
				}
				for(size_t j=0; j<lesGroupes.size() ; j++ ) {
					cls.at( j % nmbClasse ).etudiants.push_back( lesGroupes[j]  );
				}
				for(Classe & cl:cls) {
					promotion.push_back(cl);
				}
			} else { // répartition : "bumpy" / "bourage"
				for(size_t c=0 ; c<lesGroupes.size() ;) {
					Classe cl;
					cl.matiere_suivi = v.second;
					for(size_t g=0 ; g<v.first && c<lesGroupes.size(); g+=TAILLE_GRP_MAX) {
						cl.etudiants.push_back(lesGroupes[c]);
						c++;
					}
					promotion.push_back(cl);
				}
			}
		}

		promotions.push_back(promotion);
	}

	return promotions;
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
	auto resultat = repartitition(data,mat,repartititionLisse);

	if(debug) {
		std::cout << " ■ Liste des répartitions des étudiants avec leurs matières" << std::endl;
		AffichageRepartition(resultat);
	}

	//On peut désormais supprimé les données extraites des fichiers car elles sont correctement formaté ailleurs
	delete data;
	delete mat;

	//Ré-écriture dans un fichier csv
	writeCSV(resultat);

	return EXIT_SUCCESS;
}
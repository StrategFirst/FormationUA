#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <array>
#include <algorithm>

#include "csv_read.cc"

struct Etudiant {
	size_t id_etu;
	std::vector<size_t> id_mat;
};
struct Parcour {
	std::vector<size_t> id_etu;
	std::vector<size_t> id_mat;
};

const int TAILLE_GRP_MAX = 5;

struct Parcours {
	std::vector<std::array<size_t,TAILLE_GRP_MAX>> etudiants;
	std::vector<size_t> id_mat;
};
using Info = std::vector<Parcours>;

void getEtudiant() {
	FichierCSV csv = getCSV("data/suivi.csv");
	std::vector<Etudiant> liste;
	for(auto & ligne:csv) {
		bool find = false;
		for(auto & etudiant:liste) {
			if(etudiant.id_etu == std::stoi(ligne.at(0))) {
				etudiant.id_mat.push_back(std::stoi(ligne.at(1)));
				find = true;
				break;
			}
		}
		if( !find ) {
			Etudiant t;
			t.id_etu = std::stoi(ligne.at(0));
			t.id_mat.push_back( std::stoi(ligne.at(1)) );
			liste.push_back( t );
		}
	}
	std::vector<Parcour> result;
	for(auto & etudiant:liste) {
		bool find = false;
		for(auto & parcour:result) {
			if( std::is_permutation(etudiant.id_mat.begin(),etudiant.id_mat.end(),parcour.id_mat.begin())) {
				parcour.id_etu.push_back( etudiant.id_etu );
				find = true;
				break;
			}
		}
		if( !find ) {
			Parcour p;
			p.id_etu.push_back( etudiant.id_etu );
			p.id_mat = etudiant.id_mat;
			result.push_back(p);
		}
	}
	std::cout << result.size() << std::endl;

	Info data;
	for(auto & parcours:result) {
		Parcours p;
		p.id_mat = parcours.id_mat;
		int pos = TAILLE_GRP_MAX;
		for(auto & etudiants:parcours.id_etu) {
			if(pos >= TAILLE_GRP_MAX) {
				p.etudiants.push_back( std::array<size_t,TAILLE_GRP_MAX>() );
				pos = 0;
			}
			p.etudiants.back()[pos] = etudiants;
			pos++;
		}
		data.push_back(p);
	}

	/////// AFFFICHAGE
	for(auto p:data) {
		std::cout << "Pour les étudiants du parcours avec les matières : " <<std::endl<<"\t";
		for(auto m:p.id_mat) {
			std::cout << m << ";";
		}
		std::cout << std::endl  << std::endl;
		for(auto g:p.etudiants) {
			std::cout << "\t\t - ";
			for(auto e:g) {
				std::cout << "[" << e << "]";
			}
			std::cout << std::endl;
		}
		std::cout << std::endl << "________________________________________" << std::endl;
	}
}

int main() {
	FichierCSV temp = getCSV("data/suivi.csv");
	getEtudiant();
	return EXIT_SUCCESS;
}
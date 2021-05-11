#include <iostream>
#include <fstream>
#include <string>
#include <vector>

const float SEUIL_NV_GROUPE = 0.0;

using id_t = unsigned int;
enum class cour_t {CM, TD, TP, CMTD};
struct Suivi {
	id_t id_etu;
	id_t id_mat;
};
struct Contrainte {
	id_t id_mat;
	cour_t type;
	size_t max_etu;
};

void affichageFichier(const std::vector<Suivi> & suivis,const std::vector<Contrainte> & contraintes) {
	for(Suivi s:suivis) {
		std::cout << "\033[92m" << s.id_etu << "\033[0m,\033[93m" << s.id_mat << "\033[0m" << std::endl;
	}
	for(Contrainte c:contraintes) {
		std::cout << "\033[93m" << c.id_mat << "\033[0m,\033[96m" << c.max_etu << "\033[0m,\033[95m" << (int)c.type << "\033[0m" << std::endl;
	}
}
std::vector<Suivi> lectureSuivi() {
	std::vector<Suivi> liste;
	std::ifstream fichier("data/suivi.csv");
	if(fichier.is_open()) {
		char* chars = new char[256];
		while(!  fichier.eof() ) {
			fichier.getline(chars,256);
			std::string line(chars);
			if(line.length() > 0) {
				int pos = line.find(',');
				Suivi s;
				s.id_etu = std::stoi(line.substr(0,pos));
				s.id_mat = std::stoi(line.substr(pos+1,line.length()));
				liste.push_back(s);
			}
		}
		delete[] chars;
		return liste;
	} else {
		throw "An error occured while openning the file!";
	}
}
std::vector<Contrainte> lectureContrainte() {
	std::vector<Contrainte> liste;
	std::ifstream fichier("data/contrainte.csv");
	if(fichier.is_open()) {
		char* chars = new char[256];
		while(! fichier.eof() ) {
			fichier.getline(chars,256);
			std::string line(chars);
			if(line.length() > 0) {
				Contrainte c;
				int posa = line.find(',');
				c.id_mat = std::stoi(line.substr(0,posa));
				line = line.substr(posa+1,line.length());
				int posb = line.find(',');
				c.max_etu = std::stoi(line.substr(posb+1,line.length()));
				std::string t = line.substr(0,posb);
				if(t == "TP") {
					c.type = cour_t::TP;
				} else if(t == "TD") {
					c.type = cour_t::TD;
				} else if(t == "CM") {
					c.type = cour_t::CM;
				} else if(t == "CM-TD") {
					c.type = cour_t::CMTD;
				} else {
					throw std::invalid_argument("Type de cours non reconnu : [" + t + "]");
				}
				liste.push_back(c);
			}
		}
		delete[] chars;
		return liste;
	} else {
		throw "An error occured while openning the file!";
	}
}

void test(const std::vector<Suivi> & suivis,const std::vector<Contrainte> & contraintes) {
	for(Contrainte c:contraintes) {
		std::vector<id_t> suive;
		for(Suivi s:suivis) {
			if(s.id_mat == c.id_mat) {
				suive.push_back(s.id_etu);
			}
		}
		float k = ( (float)suive.size() ) / ( (float)c.max_etu);
		int grp_count = k;
		k = k - grp_count;
		if( k > SEUIL_NV_GROUPE) {
			grp_count++;
		}

		std::vector<std::vector<id_t>> Liste;
		Liste.reserve(grp_count);
		for(int i=0 ; i<grp_count ; i++) {
			Liste.push_back({});
		}

		int grp_i = 0;
		for(auto etu:suive) {
			Liste[grp_i].push_back(etu);
			grp_i = (grp_i + 1)%grp_count;
		}

		// Affichage
		std::cout << "	Pour la matière " << c.id_mat << " de type " << (int)c.type << " : " << std::endl;
		for(int groupe=0 ; groupe<grp_count ; groupe++) {
			std::cout << "\t" << "Pour le groupe " << groupe+1 << ":" << std::endl << "\t\t";
			for(auto etu:Liste[groupe]) {
				std::cout << etu << ";";
			}
			std::cout << std::endl;
		}
	}
}

int main() {
	auto suivi = lectureSuivi();
	auto contrainte = lectureContrainte();
	affichageFichier(suivi,contrainte);
	test(suivi,contrainte);
	return EXIT_SUCCESS;
}
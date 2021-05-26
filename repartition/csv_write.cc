#include <fstream>
#include <string>
#include <vector>

void writeCSV(const std::vector<Promotion> & promotions) {

	std::ofstream csv_etudiant_groupe_fs;
	std::ofstream csv_groupe_classe_fs;
	std::ofstream csv_classe_matiere_fs;

	csv_etudiant_groupe_fs.open("data/etudiant_groupe.csv", std::ofstream::out | std::ofstream::trunc);
	csv_groupe_classe_fs.open("data/groupe_classe.csv", std::ofstream::out | std::ofstream::trunc);
	csv_classe_matiere_fs.open("data/classe_matiere.csv", std::ofstream::out | std::ofstream::trunc);

	if( ! csv_etudiant_groupe_fs.is_open() ) throw std::invalid_argument(" Unable to open file ");
	if( ! csv_groupe_classe_fs.is_open() ) throw std::invalid_argument(" Unable to open file ");
	if( ! csv_classe_matiere_fs.is_open() ) throw std::invalid_argument(" Unable to open file ");

	// Those count serve for creating id, used for linking student to subject passing through groupes and classes
	unsigned int cmpt_id_classe = 1;

	for(auto promotion:promotions) {

		std::vector<size_t> already_seen_etu;
		std::vector<std::pair<size_t,size_t>> already_seen_grp_classe;
		std::vector<std::pair<size_t,std::pair<size_t,TypeCours>>> already_seen_classe_mat;

		for(auto classe:promotion) {
			for(auto groupe:classe.etudiants) {
				for(auto etudiant:groupe.etudiants) {
					if( etudiant != 0) {

						bool seen = false;
						for(auto ele:already_seen_etu) {
							if(ele == etudiant) {
								seen = true; break;
							}
						}
						if(!seen) {
							already_seen_etu.push_back(etudiant);
							csv_etudiant_groupe_fs << etudiant << "," << groupe.uid << std::endl;
						}

					}
				}

				bool seen = false;
				for(auto ele:already_seen_grp_classe) {
					if(ele.first == groupe.uid && ele.second == cmpt_id_classe) {
						seen = true; break;
					}
				}
				if(!seen) {
					already_seen_grp_classe.push_back({groupe.uid,cmpt_id_classe});
					csv_groupe_classe_fs << groupe.uid << "," << cmpt_id_classe << std::endl;
				}
				
			}

			for(auto matiere:classe.matiere_suivi) {
				// First element correspond to the subject id, the second correspond to the subject type of course (TD,TP,CM,CMTD)
				bool seen = false;
				for(auto ele:already_seen_classe_mat) {
					if(ele.first == cmpt_id_classe && ele.second.first == matiere.first && ele.second.second == matiere.second) {
						seen = true;
						break;
					}
				}
				if(!seen) {
					already_seen_classe_mat.push_back({cmpt_id_classe,{matiere.first,matiere.second}});
					csv_classe_matiere_fs << cmpt_id_classe << "," << matiere.first << "," << StringFromTypeCours(matiere.second) << std::endl;
				}
			}
		}
		cmpt_id_classe++;
	}

	csv_etudiant_groupe_fs.close();
	csv_groupe_classe_fs.close();
	csv_classe_matiere_fs.close();
}
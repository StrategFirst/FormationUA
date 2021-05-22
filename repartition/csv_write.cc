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
	unsigned int cmpt_id_groupe = 1;
	unsigned int cmpt_id_classe = 1;

	for(auto promotion:promotions) {
		for(auto classe:promotion) {
			for(auto groupe:classe.etudiants) {
				for(auto etudiant:groupe) {
					csv_etudiant_groupe_fs << etudiant << "," << cmpt_id_groupe << std::endl;
				}
				csv_groupe_classe_fs << cmpt_id_groupe << "," << cmpt_id_classe << std::endl;
				cmpt_id_groupe++;
			}

			for(auto matiere:classe.matiere_suivi) {
				// First element correspond to the subject id, the second correspond to the subject type of course (TD,TP,CM,CMTD)
				csv_classe_matiere_fs << cmpt_id_classe << "," << matiere.first << "," << StringFromTypeCours(matiere.second) << std::endl;
			}
		}
		cmpt_id_classe++;
	}

	csv_etudiant_groupe_fs.close();
	csv_groupe_classe_fs.close();
	csv_classe_matiere_fs.close();
}
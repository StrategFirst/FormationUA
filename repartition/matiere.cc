#include <stdexcept>
#include <string>
#include <map>

Matiere* getMatiere(){
	FichierCSV csv = getCSV("./repartition/data/contrainte.csv");
	Matiere* m = new Matiere();
	for(auto ligne:csv) {
		size_t id = std::stoi(ligne.at(0));
		TypeCours tc = TypeCoursFromString(ligne.at(1));
		size_t h = std::stoi(ligne.at(2));
		try {
			m->at(id).insert({tc,h});
		} catch(std::out_of_range & e) {
			std::map<TypeCours,size_t> temp({{tc,h}});
			m->insert({id,temp});
		}
	}
	return m;
}
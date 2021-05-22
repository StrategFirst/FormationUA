#include <stdexcept>
#include <string>
#include <map>

Matiere* getMatiere(){
	FichierCSV csv = getCSV("data/contrainte.csv");
	Matiere* m = new Matiere();
	for(auto ligne:csv) {
		size_t id = std::stoi(ligne.at(0));
		TypeCour tc = TypeCourFromString(ligne.at(1));
		size_t h = std::stoi(ligne.at(2));
		try {
			m->at(id).insert({tc,h});
		} catch(std::out_of_range & e) {
			std::map<TypeCour,size_t> temp({{tc,h}});
			m->insert({id,temp});
		}
	}
	return m;
}
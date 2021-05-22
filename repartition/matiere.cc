#include <stdexcept>
#include <string>
#include <map>

enum class TypeCour { CM , CMTD , TD , TP };


using Matiere = std::map<size_t,std::map<TypeCour,size_t>>;
/*
Matiere :
	Pour chaque pair de matière on a des pairs type de cours + volume étudiants 
	et pour chaque pair type de cour et id du cour on a un unique volume étudiants 
*/

TypeCour TypeCourFromString(std::string k) {
	if(k == "CM") return TypeCour::CM;
	if(k == "TD") return TypeCour::TD;
	if(k == "TP") return TypeCour::TP;
	if(k == "CM-TD") return TypeCour::CMTD;
	throw std::domain_error("Type de cour non définie : " + k);
}
std::string StringFromTypeCour(TypeCour k) {
	switch(k) {
		case TypeCour::CM: return "CM";
		case TypeCour::TD: return "TD";
		case TypeCour::TP: return "TP";
		case TypeCour::CMTD: return "CMTD";
		default: throw std::domain_error("Type de cour non définie");
	}
}
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
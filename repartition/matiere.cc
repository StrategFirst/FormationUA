#include <stdexcept>
#include <string>
#include <map>

enum class TypeCour { CM , CMTD , TD , TP };
class Cour {
private:
	size_t _id_mat;
	TypeCour _type;
public:
	Cour(size_t id_mat,TypeCour type):_id_mat(id_mat),_type(type){}
	~Cour() = default;
	Cour(Cour const & c) = default;
public:
	bool operator<(const Cour & a) const {
		if(this->_id_mat == a.get_id_mat())
			return this->_type > a.get_type();
		else
			return this->_id_mat > a.get_id_mat();
	}
public:
	size_t get_id_mat() const { return _id_mat; }
	TypeCour get_type() const { return _type; }

};


using Matiere = std::map<Cour,size_t>;
/*
Matiere :
	Pour chaque pair de matière et de forme de cour, on a un volume horaire
*/

TypeCour TypeCourFromString(std::string k) {
	if(k == "CM") return TypeCour::CM;
	if(k == "TD") return TypeCour::TD;
	if(k == "TP") return TypeCour::TP;
	if(k == "CM-TD") return TypeCour::CMTD;
	throw std::domain_error("Type de cour non définie : " + k);
}
Matiere* getMatiere(){
	FichierCSV csv = getCSV("data/contrainte.csv");
	Matiere* m = new Matiere();
	for(auto ligne:csv) {
		size_t id = std::stoi(ligne.at(0));
		TypeCour tc = TypeCourFromString(ligne.at(1));
		size_t h = std::stoi(ligne.at(2));
		m->insert(std::pair<Cour,size_t>({id,tc},h));
	}
	return m;
}
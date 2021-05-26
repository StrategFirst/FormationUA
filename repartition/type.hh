// Chaque cours a un ou plusieurs type :
enum class TypeCours { CM , CMTD , TD , TP };

// Une matière sera de manière général représenté par son identifiant et pour chacun d'entre eux
//  on peut affecter une paire de clé(unique) valeurs correspondant a un type/format de cours ainsi que son volume horaire
using Matiere = std::map<size_t,std::map<TypeCours,size_t>>;

// Une classe est un ensemble de groupe (dont le cardinal est borné de 0 à X, X étant prédéfini) qui suit un ensemble de matière
// Un groupe est un ensemble d'étudiant (dont le cardinal est borné de 0 à TAILLE_GRP_MAX, TAILLE_GRP_MAX étant une constante ajustable)
// Un étudiant est ici représenté par un id unique qui lui a été attribué
// Une matière est ici représenté par un id unique qui lui a été attribué et un type de cours (td,tp,cm,...)
struct Groupe {
	size_t uid;
	std::array<size_t,TAILLE_GRP_MAX> etudiants;
};
struct Classe {
	std::vector<Groupe> etudiants;
	std::vector<std::pair<size_t,TypeCours>> matiere_suivi;
};

// Une promotion est un ensemble de classe
using Promotion = std::vector<Classe>;
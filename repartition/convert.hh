TypeCours TypeCoursFromString(std::string k) {
	if(k == "CM") return TypeCours::CM;
	if(k == "TD") return TypeCours::TD;
	if(k == "TP") return TypeCours::TP;
	if(k == "CM-TD") return TypeCours::CMTD;
	throw std::domain_error("Type de cour non définie : " + k);
}
std::string StringFromTypeCours(TypeCours k) {
	switch(k) {
		case TypeCours::CM: return "CM";
		case TypeCours::TD: return "TD";
		case TypeCours::TP: return "TP";
		case TypeCours::CMTD: return "CMTD";
		default: throw std::domain_error("Type de cour non définie");
	}
}
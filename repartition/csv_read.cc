
#include <fstream>
#include <string>
#include <vector>

using LigneCSV = std::vector<std::string>;
using FichierCSV = std::vector<LigneCSV>;
LigneCSV parseCSV(std::string line) {
	LigneCSV resultat;
	size_t begin = 0;
	while(begin < line.length()) {
		size_t end = line.find(',',begin);
		if(end == std::string::npos) {
			resultat.push_back(line.substr(begin,line.length()));break;}
		resultat.push_back(line.substr(begin,end-begin));
		begin = end + 1;
	}
	return resultat;
}
FichierCSV getCSV(std::string fileName) {
	std::ifstream fichier( fileName.c_str() );
	if( fichier.is_open() ) {
		FichierCSV result;
		char* chars = new char[256];
		while( ! fichier.eof() ) {
			fichier.getline(chars,256);
			std::string line(chars);
			result.push_back(parseCSV(line));
		}
		delete[] chars;
		return result;
	} else {
		throw std::invalid_argument("An error occured while openning the file!");
	}
}
std::ostream& operator<<(std::ostream & os,const FichierCSV & file) {
	for(auto const & line:file) {
		bool k = true;
		for(auto const & column:line) {
			if(k)
				os << " " << column << " | ";
			else
				os << " " << column << " | ";
			k = !k;
		}
		os << std::endl;
	}
	return os;
}
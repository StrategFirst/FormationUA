#include <iostream>
#include <string>
#include <vector>
#include <array>
#include <algorithm>

#include "csv_read.cc"

#include "etudiant.cc"
#include "matiere.cc"


void repartitition(Info data) {

}

int main() {
	Info* data = getEtudiant();
	Matiere* mat = getMatiere();
	//afficheInfo(*data);
	std::cout << mat << std::endl;
	delete data;
	return EXIT_SUCCESS;
}
#!/bin/bash

# Couleur console
colorUA="\033[1;38;2;10;187;239m"
colorOK="\033[1;38;2;69;255;69m"
colorERR="\033[1;38;2;255;69;69m"
colorLOG="\033[1;38;2;255;255;40m"
colorGREY="\033[2;38;3;25;25;25m"
colorRESET="\033[0m"

#Texte marco
encour="\033[5m. . .\033[0m"
valide="$colorOK✓$colorRESET"

# Compilation
echo -e -n "$colorUA ► Compilation de(s) programme(s) $encour $colorRESET \r"
cd repartition/
./compile
cd ../
echo -e "$colorUA ► Compilation de(s) programme(s) terminé(s) ! $colorRESET $valide"

# Création repertoires log
if [[ ! -d "./logs" ]]
then
	echo -e "$colorUA ► Création d'un répertoire de log $colorRESET"
	mkdir logs -p
fi

prefixLogFile=$(date +%F)

# Lancement
echo -e -n "$colorUA ► Lancement du serveur web $encour $colorRESET \r"
pidServerWeb=$(php artisan serve --port 8000 --host 0.0.0.0 >> logs/$prefixLogFile-serv.log & echo $!)
echo -e "$colorUA ► Serveur web lancer $colorRESET$valide$colorGREY ( logs/$prefixLogFile-serv.log ) $colorRESET "
echo -e -n "$colorUA ► Lancement du serveur des taches de fond $encour $colorRESET \r"
pidServerTask=$(php artisan queue:work --timeout=600 --tries=1 >> logs/$prefixLogFile-task.log & echo $!)
echo -e "$colorUA ► Serveur de taches de fond lancer $colorRESET$valide$colorGREY ( logs/$prefixLogFile-task.log ) $colorRESET "

# Arrêt
trap " \
echo -e -n \"\n$colorUA ► Arrêt du serveur $encour\r\"; \
kill $pidServerTask 2> /dev/null ;\
kill $pidServerWeb 2> /dev/null ;\
echo -e \"$colorUA ► Serveur correctement arrêter ! \$valide \"; \
exit \
" SIGINT

echo -e "$colorUA ► Serveur opérationnel $valide"

# Attente
while true; do
	: sleep 1 d # Attente d'interruption
done





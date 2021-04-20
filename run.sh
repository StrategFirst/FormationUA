
echo -e "\n\033[40;96m Arret des services en concurence avec Laravel \033[0m\n"
sudo service mysql stop 2> /dev/null
sudo service apache2 stop 2> /dev/null

echo -e "\n\033[40;96m Lancement de Laravel \033[0m\n"
./vendor/bin/sail up

echo -e "\n\033[40;96m Relancement des services en concurence avec Laravel \033[0m\n"
sudo service mysql start 2> /dev/null
sudo service apache2 start 2> /dev/null

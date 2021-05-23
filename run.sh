# Predefine console color
colorUA="\033[1;38;2;10;187;239m"
colorRESET="\033[0m"

# Compile
echo -e "$colorUA ► Compiling programs $colorRESET"
cd repartition/
./compile
cd ../

# Create log file if it doesn't exist
mkdir logs -p

prefixLogFile=$(date +%F)

# Run
echo -e "$colorUA ► Starting server $colorRESET"
php artisan serve --port 8000 --host 0.0.0.0 > logs/$prefixLogFile-serv.log & \
echo -e "$colorUA ► Starting background tasks $colorRESET" &&
php artisan queue:work --timeout=600 --tries=1 > logs/$prefixLogFile-task.log && fg





#/usr/bin/env bash
echo "--- Criando projeto laravel"
echo "--- larablog"

# Criar variaves para senha mysql, nome do projeto, projeto laravel e git
echo "--- Definir nome da pasta e nome do projeto laravel ---"
PROJECTNAME="larablog"

echo "-- gerar projeto laravel"
#gera a versao do laravel
# composer create-project --prefer-dist laravel/laravel /var/www/html/${PROJECTNAME} 
composer create-project --prefer-dist laravel/laravel /var/www/html/${PROJECTNAME} "6.*" 

# instalar no diretorio execuldado
# composer create-project --prefer-dist laravel/laravel app "6.*" 
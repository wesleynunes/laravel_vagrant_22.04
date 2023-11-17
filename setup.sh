#/usr/bin/env bash
echo "--- Instalando pacotes para desenvolvimento [PHP 8, LARAVEL]"

# Criar variaves para senha mysql e git e verssao do
echo "--- definir senha, nome email git e versao do php ---"
PASSWORD='123'
GITNAME="Wes"
GITEMAIL="wesleysilva.ti@gmail.com"

echo "repository"
sudo add-apt-repository ppa:ondrej/php -y

echo "--- update / upgrade ---"
sudo apt-get update
sudo apt-get -y upgrade

echo "--- instalando git ---"
sudo apt-get -y install git 
git config --global user.name ${GITNAME} 
git config --global user.email ${GITEMAIL}

echo "--- instalando curl wget zip unzip ---"
sudo apt-get -y install curl wget zip unzip

echo "--- instalar apache2---"
sudo apt-get -y install apache2

echo "--- instalar php8 e extensoes"
sudo apt-get -y install php 
sudo apt-get -y install libapache2-mod-php 
sudo apt-get -y install php-pear 
sudo apt-get -y install php-dev 
sudo apt-get -y install php-zip 
sudo apt-get -y install php-curl 
sudo apt-get -y install php-xmlrpc 
sudo apt-get -y install php-gd 
sudo apt-get -y install php-mbstring 
sudo apt-get -y install php-xml mcrypt 
sudo apt-get -y install php-common 
sudo apt-get -y install php-cli 
sudo apt-get -y install php-intl 
sudo apt-get -y install php-bcmath 
sudo apt-get -y install php-imap 
sudo apt-get -y install php-tokenizer 
sudo apt-get -y install php-json 
sudo apt-get -y install php-pgsql 
sudo apt-get -y install php-soap 
sudo apt-get -y install php-xs 
sudo apt-get -y install php-odbc 
sudo apt-get -y install php-apcu 
sudo apt-get -y install php-imagick 
sudo apt-get -y install php-fpm
sudo apt-get -y install php-ldap
sudo apt-get -y install php-mysql 
sudo apt-get -y install php-sqlite
sudo apt-get -y install php-sqlite3
sudo apt-get -y install php-redis


echo "--- instalar mysql e fornercer senha para o instalador -- "
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get -y install mysql-server

echo "--- instalar phpmyadmin e fornecer senha para o instalador"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo apt-get -y install phpmyadmin

echo "--- instalando nodejs ---"
sudo apt-get -y install nodejs
sudo apt-get -y install npm

echo "--- instalando redis ---"
sudo apt-get -y install redis-server

echo "-- instalar dependecias do yarn"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo "--Instalar yarn"
sudo apt update
sudo apt install yarn

echo "--- habilitar mod-rewrite do apache ---"
sudo a2enmod rewrite

echo "--- reiniciar apache ---"
sudo service apache2 restart

echo "--- reiniciar mysql ---"
sudo service mysql restart

echo "--- reiniciar redis ---"
sudo systemctl restart redis.service

echo "-- dependecias composer --"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

echo "--- instalar composer --"
sudo composer install

echo "--- reiniciar apache ---"
sudo service apache2 restart
    
echo "[OK] --- Ambiente de desenvolvimento concluido ---"
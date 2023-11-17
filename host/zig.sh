#/usr/bin/env bash
echo "--- Criando projeto laravel"
echo "--- zig"

# Criar variaves para senha mysql, nome do projeto, projeto laravel e git
echo "--- Definir nome da pasta e nome do projeto laravel ---"
PROJECTNAME="zig"
PROJECTURL='dev.com'
SERVERADMIN="wesleysilva.ti@gmail.com"

echo "--- arquivo host ---"
VHOST=$(cat <<EOF
<VirtualHost *:80>
    ServerAdmin ${SERVERADMIN}
    ServerName  ${PROJECTNAME}.${PROJECTURL}
    ServerAlias ${PROJECTNAME}.${PROJECTURL}
    DocumentRoot "/var/www/html/${PROJECTNAME}/public"
    <Directory "/var/www/html/${PROJECTNAME}/public">
        AllowOverride All
        Require all granted
    </Directory>    
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/${PROJECTNAME}.conf

echo "--- habilitar mod-rewrite do apache ---"
sudo a2ensite ${PROJECTNAME}.conf
sudo a2enmod rewrite

echo "--- reiniciar apache ---"
sudo service apache2 restart

echo "--- reiniciar mysql ---"
sudo service mysql restart

echo "-- gerar projeto laravel"
#gera a versao do laravel
# composer create-project --prefer-dist laravel/laravel /var/www/html/${PROJECTNAME} "6.*" 

#gera projeto com a versão mais atual
composer create-project --prefer-dist laravel/laravel /var/www/html/${PROJECTNAME}

echo "-- permissão nas pastas"
chown -R www-data.www-data /var/www/html/${PROJECTNAME}
sudo chmod -R 777 /var/www/html/${PROJECTNAME}
sudo chmod -R 777 /var/www/html/${PROJECTNAME}/storage

echo "--- reiniciar apache ---"
sudo service apache2 restart
    
echo "[OK] --- Projeto laravel criado!!! ---"
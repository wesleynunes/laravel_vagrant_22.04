#/usr/bin/env bash
echo "--- Criando projeto PHP"
echo "--- PHP"

# Criar variaves para senha mysql, nome do projeto, projeto laravel e git
echo "--- Definir nome do projeto PHP e URL ---"
PROJECTNAME="public"
PROJECTURL='dev.com'
SERVERADMIN="wesleysilva.ti@gmail.com"

echo "--- arquivo host ---"
VHOST=$(cat <<EOF
<VirtualHost *:80>
    ServerAdmin ${SERVERADMIN}
    ServerName  ${PROJECTNAME}.${PROJECTURL}
    ServerAlias ${PROJECTNAME}.${PROJECTURL}
    DocumentRoot "/var/www/html/${PROJECTNAME}"
    <Directory "/var/www/html/${PROJECTNAME}">
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

echo "-- gerar projeto php"
sudo mkdir "/var/www/html/${PROJECTNAME}"

echo "-- permissão nas pasta do projetos"
chown -R www-data.www-data /var/www/html/${PROJECTNAME}
sudo chmod -R 777 /var/www/html/${PROJECTNAME}

echo "--- reiniciar apache ---"
sudo service apache2 restart
    
echo "[OK] --- Projeto PHP criado!!! ---"
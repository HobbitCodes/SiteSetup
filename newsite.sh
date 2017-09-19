read -p "New local site name: " SITE
read -p "Site path (ex:/Users/{username}/Sites/): " SITEPATH
read -p "Database Host: " DBHOST
read -p "Database Name: " DBNAME
read -p "Database Password: " DBPASS
read -p "Database User: " DBUSER

VHOSTFILE="/private/etc/apache2/extra/httpd-vhosts.conf"


echo "<VirtualHost *:80>" >> $VHOSTFILE
echo "\tSetEnv WP_ENV development" >> $VHOSTFILE
echo "\tSetEnv DB_HOST \"${DBHOST}\"" >> $VHOSTFILE
echo "\tSetEnv DB_NAME \"${DBNAME}\"" >> $VHOSTFILE
echo "\tSetEnv DB_PASSWORD \"${DBPASS}\"" >> $VHOSTFILE
echo "\tSetEnv DB_USER \"${DBUSER}\"" >> $VHOSTFILE
echo "\tVirtualDocumentRoot \"${SITEPATH}\"" >> $VHOSTFILE
echo "\tServerName ${SITE}.dev" >> $VHOSTFILE
echo "\tServerAlias ${SITE}.dev" >> $VHOSTFILE
echo "</VirtualHost>" >> $VHOSTFILE

apachectl restart

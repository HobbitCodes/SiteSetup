read -p "New local site name: " SITE
read -p "Site path (ex:/Users/{username}/Sites/): " SITEPATH
read -p "Database Host: " DBHOST
read -p "Database Name: " DBNAME
read -p "Database Password: " DBPASS
read -p "Database User: " DBUSER

VHOSTFILE="/usr/local/etc/httpd/extra/httpd-vhosts.conf"
HOSTSFILE="/etc/hosts"
LOGPATH="/Users/harrywiseman/Sites/logs"

mkdir $LOGPATH/${SITE}

echo "<VirtualHost *:80>" >> $VHOSTFILE
echo "\tSetEnv WP_ENV development" >> $VHOSTFILE
echo "\tSetEnv DB_HOST \"${DBHOST}\"" >> $VHOSTFILE
echo "\tSetEnv DB_NAME \"${DBNAME}\"" >> $VHOSTFILE
echo "\tSetEnv DB_PASSWORD \"${DBPASS}\"" >> $VHOSTFILE
echo "\tSetEnv DB_USER \"${DBUSER}\"" >> $VHOSTFILE
echo "\tVirtualDocumentRoot \"${SITEPATH}\"" >> $VHOSTFILE
echo "\tServerName ${SITE}.local" >> $VHOSTFILE
echo "\tServerAlias ${SITE}.local" >> $VHOSTFILE
echo "\tErrorLog \"$LOGPATH/${SITE}/error_log\"" >> $VHOSTFILE
echo "\tCustomLog \"$LOGPATH/${SITE}/access_log\" common" >> $VHOSTFILE
echo "</VirtualHost>" >> $VHOSTFILE

echo "127.0.0.1\t${SITE}.local" >> $HOSTSFILE

apachectl -k restart

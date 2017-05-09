#!/bin/bash
if [ "$EUID" -ne 0 ]
 then echo "Please run this script as root"
 exit
fi

apt-get update
apt-get --assume-yes install apache2

apt-get --assume-yes install mysql-server php5-mysql
mysql_install_db

apt-get --assume-yes install php5 libapache2-mod-php5 php5-mcrypt

echo "<IfModule mod_dir.c>" > /etc/apache2/mods-enabled/dir.conf
echo "DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm" >> /etc/apache2/mods-enabled/dir.conf
echo "</IfModule>" >> /etc/apache2/mods-enabled/dir.conf

service apache2 restart


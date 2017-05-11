#!/bin/bash

#check uid
if [ "$EUID" -ne 0 ]
        then
        echo "Please run this script as root"
        exit
fi

#Version checks
VER=$(lsb_release -sr)
if [ "$VER" != "14.04" ]
        then
        echo "this script currently supports Ubuntu 14.04"
        exit
fi

apt-get update

#install apache
apt-get --assume-yes install apache2
#install php
apt-get --assume-yes install mysql-server
#configure mysql
mysql_secure_installation
mysql_install_db
#install phpmysql
apt-get install php5-mysql
#install php mods
apt-get --assume-yes install php5 libapache2-mod-php5 php5-mcrypt

#configure directory index
echo "<IfModule mod_dir.c>" > /etc/apache2/mods-enabled/dir.conf
echo "        DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm" >> /etc/apache2/mods-enabled/dir.conf
echo "</IfModule>" >> /etc/apache2/mods-enabled/dir.conf

#install phpmyadmin
apt-get install phpmyadmin
php5enmod mcrypt

#restarting apache2
service apache2 restart


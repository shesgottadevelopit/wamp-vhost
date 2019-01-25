#!/bin/sh

# This script is based on https://github.com/MattSkala/apache-vhost script.

# A simple bash script that creates a virtual host in Apache on Windows Msysgit
# Usage: sh ./vhost.sh myweb.dev 'c:\Projects\myweb\www'

HOSTS=/mnt/c/Windows/System32/drivers/etc/hosts
HTTPDCONF=/mnt/c/wamp/bin/apache/apache2.4.17/conf/extra/httpd-vhosts.conf

# 2 arguments are required
if [ -o $1 ]
	then
		echo "You have to provide a domain name"
		exit
fi

if [ -o $2 ]
	then
		echo "You have to provide a path"
		exit
fi

# Map domain to localhost in hosts file
echo -e "127.0.0.1		$1" >> $HOSTS

# Add virtual host to httpd.conf
echo "
# $1 site
<VirtualHost *:80>
	ServerName $1
	DocumentRoot '$2'
	<Directory '$2'>
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Require local
	</Directory>
</VirtualHost>" >> $HTTPDCONF

echo "$1 mapped to $2"

# Restart Apache
#net stop wampapache

#net start wampapache

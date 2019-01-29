#!/bin/bash

# This script is based on https://github.com/MattSkala/apache-vhost script.

# A simple bash script that creates a virtual host in Apache on WSL
# Usage: ./vhost.sh myproject.local 'c:\Projects\myproject\www'

HOSTS=/mnt/c/Windows/System32/drivers/etc/hosts
HTTPDCONF=/mnt/c/wamp/bin/apache/apache2.4.17/conf/extra/httpd-vhosts.conf


# Escape backslash
tmp=$2 # Assign command prompt input to variables
dirpath=${tmp//\\/\\\\} # find all single backslashes and replace with double backslashes

# Map domain to localhost in hosts file
echo -e "127.0.0.1		$1" >> $HOSTS
echo -e "::1			$1 \n" >> $HOSTS

echo "$1 was added to the hosts file"

# Add virtual host to httpd.conf
echo "
# $1 site
<VirtualHost *:80>
	ServerName $1
	DocumentRoot $2
	<Directory \"$2\">
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Require local
	</Directory>
</VirtualHost>" >> $HTTPDCONF

echo "$1 mapped to \"$2\""

# Restart Apache
cmd.exe /c NET STOP wampapache64
cmd.exe /c NET START wampapache64

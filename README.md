WAMP - Apache VirtualHost Script (WSL)
==========================================
A simple bash script that creates a virtual host in Apache on Windows with WAMP using Windows Subsystem for Linux.

How to use
----------
``./vhost.sh <domain> <path>``

(e.g. ``./vhost.sh project.local 'c:\project'``)

What it does
------------
- [x] Adds a domain mapping to C:/windows/drives/etc/hosts
- [x] Adds VirtualHost to C:\wamp_directory\bin\apache\apache2.2.22\conf\extra\httpd-vhosts.conf
- [ ] Restarts WampApache service (this is broken)

Thanks
------
This script is based on https://github.com/renekopcem/wamp-vhost script.

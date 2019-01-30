WAMP - Apache VirtualHost Script (WSL)
==========================================
A simple bash script that creates a virtual host in Apache on Windows with WAMP using Windows Subsystem for Linux.

How to use
----------
`./vhost.sh <domain> <path>`

(e.g. `./vhost.sh project.local 'c:\project\directory'`)

What it does
------------
- [x] Adds a domain mapping to `C:\windows\drives\etc\hosts`
- [x] Adds VirtualHost to `C:\wamp_directory\bin\apache\apache2.2.22\conf\extra\httpd-vhosts.conf`
- [x] Restarts WampApache service


What can be done later
------------
- [] Add the script to PATH via `~/bin`
- [] Create an alias for the command `./vhost.sh` to easily use the command

Thanks
------
This script is based on https://github.com/renekopcem/wamp-vhost script.

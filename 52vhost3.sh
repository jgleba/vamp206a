#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

# Purpose:  vhosts part 3 

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#

# example config...
#http://stackoverflow.com/questions/21084791/flask-hello-world-using-apache-and-mod-wsgi-shows-files-in-webroot-only

vhosts3()
{
sudo tee /etc/apache2/sites-available/vhost3.conf <<EOF
############
#
# http://l10.4.10.141:917/flask213d
# http://10.4.11.19:917/flask213d
# http://192.168.88.58:917/flask213d
# http://localhost:917/flask213d
listen 917
<VirtualHost *:917>
    DocumentRoot /var/www/html/python/flask213d
    ServerName 127.0.0.1
    #
    WSGIDaemonProcess hello1 processes=1 threads=5 python-path=/var/www/html/python/flask213d
    WSGIProcessGroup hello1
    WSGIApplicationGroup %{GLOBAL}
    #
    WSGIScriptAlias /flask213d /var/www/html/python/apache/flask213d.wsgi
    #
    #allow access to wsgi file...
    <Directory /var/www/html/python/apache>
       Order deny,allow
       Allow from all
     </Directory>
     # deny directory listing of this folder... http://localhost:917
    <Directory /var/www/html/python/flask213d>
       Order deny,allow
       Deny from all
     </Directory>
</VirtualHost>
############
#
############
#
# http://10.4.11.19:918
# http://l10.4.10.141:918/flask213e
# http://192.168.88.58:918/flask213e
# http://localhost:918/flask213e
listen 918
<VirtualHost *:918>
    AllowOverride All
    DocumentRoot /var/www/html/python/flask213e/examples/sqla
    ServerName 127.0.0.1
    #
    WSGIDaemonProcess app1 user=albe group=www-data processes=1 threads=5 python-path=/var/www/html/python/flask213e/examples/sqla
    WSGIProcessGroup app1
    WSGIApplicationGroup %{GLOBAL}
    #
    WSGIScriptAlias / /var/www/html/python/apache/flask213e.wsgi
    #
    #allow access to wsgi file...
    <Directory /var/www/html/python/apache>
       Order deny,allow
       Allow from all
     </Directory>
     # deny directory listing of this folder... http://localhost:918
    <Directory /var/www/html/python/flask213e>
       Order deny,allow
       Deny from all
     </Directory>
    <Directory /var/www/html/python/flask213e/examples/sqla>
       AllowOverride All
     </Directory>
</VirtualHost>
############
#
EOF





}

apache3()
{
  sudo a2dissite vhost3.conf
  sudo a2ensite vhost3.conf
  #sudo service apache2 restart
  sudo service apache2 reload
}

#main section....................................................................

vhosts3
apache3
date
#

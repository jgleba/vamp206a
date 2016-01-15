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
# http://localhost:917/flask213d
listen 917
<VirtualHost *:917>
    DocumentRoot /var/www/html/python/flask213d
    ServerName 127.0.0.1
    #
    #Alias /static/ /var/www/html/django/django161c/static/
    #
    WSGIDaemonProcess hello1 processes=1 threads=5 python-path=/var/www/html/python/flask213d
    #WSGIDaemonProcess hello1 processes=1 threads=5 
    WSGIProcessGroup hello1
    WSGIApplicationGroup %{GLOBAL}
    #
    WSGIScriptAlias /flask213d /var/www/html/python/flask213d/apache/flask213d.wsgi
    #
    #allow access to wsgi file...
    <Directory /var/www/html/python/flask213d/apache>
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

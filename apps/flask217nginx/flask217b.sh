#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:   nginx  uwsgi  flask_admin auth example

cd;sudo ls; sudo shc/100/215nginxflaskad1.sh


https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uwsgi-and-nginx-on-ubuntu-14-04
# not.. https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-gunicorn-and-nginx-on-ubuntu-14-04


END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#

#main: 


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2016-01-20[Jan-Wed]22-32PM


substitute flask admin auth example in for hellothere from 214nginx.sh...

copy flask-admin auth example files in place..

cd /srv/web/flask217
#virtualenv flask217env
source flask217env/bin/activate
sudo pip install -r 'requirements.txt'
deactivate
sudo service flask217 restart
sudo service nginx restart


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# sudo apt-get update
sudo apt-get install python-pip python-dev nginx

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#change nginx default port to 82 so apache still works on 80..

#sudo leafpad /etc/nginx/sites-enabled/default
# orig settings...
#    listen 80 default_server;
#    listen [::]:80 default_server ipv6only=on;

# backup..
sudo cp  /etc/nginx/sites-enabled/default  /etc/nginx/sites-enabled/default.$(date "+%Y-%m-%d_%s").bak
sudo cp  /etc/nginx/sites-available/default  /etc/nginx/sites-available/default.$(date "+%Y-%m-%d_%s").bak
# remove line containing  '?????'  and replace the line completely with the new text...
nowdg1=`date +'__%Y-%m-%d_%a_%H.%M.%S-%Z'`
sudo sed -i "/.*listen 80 .*/i # \n# David Gleba kdg54 $nowdg1 ...\n#"  /etc/nginx/sites-enabled/default # add marker above the change.
#Use double quotes to make the shell expand variables while keeping whitespace:
sudo sed -i "s/.*listen 80 .*/       listen 82 default_server;/g" /etc/nginx/sites-enabled/default
sudo sed -i "s/.*80 default_server.*/       listen [::]:82 default_server ipv6only=on;/g" /etc/nginx/sites-enabled/default

cat /etc/nginx/sites-enabled/default

# move unneeded config out of the way...
sudo mkdir /etc/nginx/offlinedg
sudo mv  /etc/nginx/sites-available/default /etc/nginx/offlinedg/default
sudo mv /etc/nginx/sites-enabled/*.bak /etc/nginx/offlinedg

sudo service nginx stop
sleep 3
sudo service nginx start
sudo service apache2 restart

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# make folder and change permissions...
# my standard practice for shared web stuff...

sudo mkdir -p /srv/web/flask217
#
sudo chgrp -hR www-data /srv/web # change group to www-data ( apache group. apache already was installed.)
sudo chown -R root /srv/web 
sudo chmod -R g+rw  /srv/web # writable for group
sudo chmod -R o-rw /srv/web # not viewable for others..
# make only folders +x so they can be cd into.
sudo find /srv/web -type d -exec chmod g+x {} +
#
cd /srv/web/flask217

# create readme
nowdg1=`date +'_%Y.%m.%d_%H.%M.%S'`
tee /srv/web/00readme.txt <<EOF
Purpose: for nginx served projects, and possibly other projects.
This folder - /srv/web
made by David Gleba
echo $nowdg1
.
EOF


#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sudo pip install virtualenv

virtualenv flask217env
source flask217env/bin/activate
pip install uwsgi flask


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# create app flask217
tee /srv/web/flask217/flask217.py <<EOF
from flask import Flask
application = Flask(__name__)
@application.route("/")
def hello():
    return "<h1 style='color:blue'>Hello There! flask217-2</h1>"
if __name__ == "__main__":
    application.run(host='0.0.0.0')
EOF

#  python flask217.py

#visit localhost:5000


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#create flask217.wsgi
tee /srv/web/flask217/flask217.wsgi <<EOF
#from flask217 import application
#if __name__ == "__main__":
#    application.run()
#
from flask217 import app as application
#if __name__ == "__main__":
application.run()
EOF

#test uwsgi...
#  uwsgi --socket 0.0.0.0:8000 --protocol=http -w flask217

#visit localhost:8000 and use localip:8000 from another pc on the local network..

deactivate

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#create uwsgi ini file..
tee /srv/web/flask217/flask217.ini <<EOF
[uwsgi]
module = flask217
master = true
processes = 5
socket = flask217.sock
chmod-socket = 660
vacuum = true
die-on-term = true
EOF

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo tee /etc/init/flask217.conf <<EOF
#
description "uWSGI server instance configured to serve myproject"
#
start on runlevel [2345]
stop on runlevel [!2345]
#
setuid albe
setgid www-data
#
env PATH=/srv/web/flask217/flask217env/bin
chdir /srv/web/flask217
exec uwsgi --ini flask217.ini
#
EOF

sudo start flask217


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo tee /etc/nginx/sites-available/flask217 <<EOF
#
server {
    listen 951;
    #worked.. server_name v206b1;
    #server_name 127.0.0.1;
    server_name v206b2;

    location / {
        include uwsgi_params;
        uwsgi_pass unix:/srv/web/flask217/flask217.sock;
    }
}
#
EOF

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo ln -s /etc/nginx/sites-available/flask217 /etc/nginx/sites-enabled


# oops.. cleaning up mistakes...
#sudo rm /etc/nginx/sites-available/flask217.conf
#sudo rm /etc/nginx/sites-enabled/myproject
sudo rm /etc/nginx/sites-available/hello217
sudo rm /etc/init/hello217.conf


sudo service flask217 restart
sudo service nginx restart


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# backup folder
sudo mkdir -p /home/file
#
sudo chgrp -hR www-data /home/file # change group to www-data ( apache group. apache already was installed.)
sudo chown -R root /home/file 
sudo chmod -R g+rw  /home/file # writable for group
sudo chmod -R o-rw /home/file # not viewable for others..
# make only folders +x so they can be cd into.
sudo find /home/file -type d -exec chmod g+x {} +
#
cd /home/file
mkdir -p /home/file/backup
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#
date
#

#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#Purpose:  flask prodrptdb app in flask, start with flaskadmin auth example

 ip:922
http://v206b1:922/admin/#

 shc/apps/flask/pdb218.sh

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#

#main...

mkdir -p /var/www/html/python/
cd       /var/www/html/python/

git clone https://github.com/dgleba/pdb218.git pdb218
cd pdb218

sudo pip install -r 'requirements.txt'

# the app throws an error when it is called app.py, rename it...
#file "/var/www/html/python/apache/cif207.wsgi", line 5, in <module> [:error] [pid 6602] from app import app as application [:error] ImportError: No module named app
#mv /var/www/html/python/cif207/examples/sqla/app.py /var/www/html/python/cif207/examples/sqla/app1.py

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# deployment

tbd

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


git pull https://github.com/dgleba/pdb218.git 

# start dev server . visit localhost:5000
python /var/www/html/python/pdb218/pdb218.py

#show apache log..
#sudo tail /var/log/apache2/error.log

#

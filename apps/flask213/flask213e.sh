#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#Purpose:  flask admin examples

ref:
https://github.com/petrus-jvrensburg/flask-admin-examples
http://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-xvii-deployment-on-linux-even-on-the-raspberry-pi

shc/apps/flask213/flask213e.sh

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#

#main...


# flask admin
#   https://github.com/flask-admin/Flask-Admin/tree/master/examples/sqla

mkdir -p /var/www/html/python/
cd       /var/www/html/python/

git clone https://github.com/flask-admin/flask-admin.git flask213e
cd flask213e

sudo pip install -r 'examples/sqla/requirements.txt'

# the app throws an error when it is called app.py, rename it...
#file "/var/www/html/python/apache/flask213e.wsgi", line 5, in <module> [:error] [pid 6602] from app import app as application [:error] ImportError: No module named app
mv /var/www/html/python/flask213e/examples/sqla/app.py /var/www/html/python/flask213e/examples/sqla/app1.py

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# redirect to 918 if "flask213e/" is matched. so localhost/flask213e/ redirects to: localhost:917
#
cat <<EOF > /var/www/html/python/flask213e/examples/sqla/.htaccess
RewriteEngine on
#
# redirect to 918 if "flask213e/" is matched
RewriteCond %{SERVER_PORT} !^918$
RewriteRule ^flask213e/(.*[^/])/?$ http://%{HTTP_HOST}:918/$1/ [R=301,L]
#
EOF
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#deployment

# deploy with apache...

mkdir -p /var/www/html/python/apache
cat <<EOF > /var/www/html/python/apache/flask213e.wsgi
import sys
sys.stdout = sys.stderr
# path is in vhost file, not here like in docs at..  http://flask.pocoo.org/docs/0.10/deploying/mod_wsgi/#creating-a-wsgi-file
# sys.path.insert(0, '/var/www/html/python/flask213e')
from app1 import app as application
EOF

# virtual host config for apache is here... run it ...
source ~/shc/52vhost3.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# start dev server . visit localhost:5000
python /var/www/html/python/flask213e/examples/sqla/app1.py

#show apache log..
sudo tail /var/log/apache2/error.log

#

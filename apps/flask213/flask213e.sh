#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#Purpose:  flask admin examples

ref:
https://github.com/petrus-jvrensburg/flask-admin-examples

http://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-xvii-deployment-on-linux-even-on-the-raspberry-pi

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#

#main...

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

python /var/www/html/python/flask213e/examples/sqla/app1.py

sudo tail /var/log/apache2/error.log

#

#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#Purpose:  flask admin example

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#


#main...


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# flask admin
#   https://github.com/flask-admin/Flask-Admin/tree/master/examples/sqla

cd /var/www/html/python

git clone https://github.com/flask-admin/flask-admin.git flaskad213e
cd flaskad213e


sudo pip install -r 'examples/sqla/requirements.txt'

python examples/sqla/app.py

#


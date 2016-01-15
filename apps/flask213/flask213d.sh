#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#

#main...

# flask213d
# first flask d 2016-01-13

cd /var/www/html
mkdir -p python
cd python

mkdir flask213d
cd flask213d

sudo pip install Flask

#create hello1.py ...

cat <<EOF > hello1.py
from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello_world():
    return 'Hello World! -flask213'
if __name__ == '__main__':
    app.run()
EOF


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# deploy with apache...

cat <<EOF > apache/flask213d.wsgi
#import sys
#sys.path.insert(0, '/var/www/html/python/flask213d')
#
from hello1 import app as application
EOF

# virtual host config for apache is here... run it ...
source ~/shc/52vhost3.sh


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# using dev server...

#works 2016-01-14
python hello1.py

#visit:
#    http://127.0.0.1:5000/
#works.
#

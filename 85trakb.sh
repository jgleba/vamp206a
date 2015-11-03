#!/usr/bin/env bash

cd
# echo off
set +vx
# echo on
set -vx

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#update trakberry

cd /var/www/html/django/trakberry
git pull origin master
sudo service apache2 reload


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function offline()
{
exit 999

# begin block comment =============================
: <<'END'

ls

END
# end block comment ===============================

}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#
date
#


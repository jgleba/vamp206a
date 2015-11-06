#!/usr/bin/env bash

cd
set +vx # echo off
set -vx # echo on

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:preferred mysql dump
:to get prompt for password use -p, use --password=x for no prompt or -px for password=x

mkdir -p /home/$userv/backup
bakdir="/home/$userv/backup"
#sudo  chmod 777 $bakdir

if  [ 1 = 1 ] ; then
    mysqldump -uroot -p$mysqlrootpassw --all-databases --complete-insert --quote-names --add-drop-database \
    --allow-keywords > /var/www/html/backup/mysql/pmdsdata-all-mysql.sql
    read -t  5 -p "Hit ENTER or wait some seconds" ; echo ;

    #:htdocs files... 
    7z a -y -t7z -xr!templates_c -xr!testnobackup "$bakdir/htdocs.$(date +"%Y.%m.%d_%k.%M").$HOSTNAME.7z" /var/www/html
    cp "$bakdir/htdocs.$(date +"%Y.%m.%d_%k.%M").$HOSTNAME.7z" "$bakdir/htdocs.latest.$HOSTNAME.7z"
fi

timeout1.sh 14
7z a -y -tzip -xr!templates_c -xr!testnobackup "$bakdir/htdocs.latest.$HOSTNAME.zip" /var/www/html

timeout1.sh 9
tar -cvzf "$bakdir/htdocs.latest.$HOSTNAME.tgz"  /var/www/html --exclude={templates_c,testnobackup} 


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function offline()
{
exit 999
# begin block comment =============================
: <<'END'

echo C:\p2\xampp\htdocs\0docs-pmdsdata\7zxata-htdocs.bat done at %dhms% >> c:\backup\log.7zxata-htdocs.bat.txt

END
# end block comment ===============================
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#
date
#


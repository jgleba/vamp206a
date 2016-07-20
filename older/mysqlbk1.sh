#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  backup mysql
END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#cd ; 
date ; set +vx  ; set -vx ; # echo off, then echo on
#

# :preferred mysql dump  :to get prompt for password use -p, use --password=x for no prompt
mkdir -p /var/www/html/backup/mysql
cd        /var/www/html/backup/mysql

mysqldump --user=root --password=lean --all-databases --complete-insert  --quote-names --add-drop-database --allow-keywords > pmdsdata3-all-mysql.sql

# cp pmdsdata3-all-mysql.sql pmdsdata3-all-mysql$(date +"__%Y.%m.%d_%H.%M.%S").sql
mkdir -p /home/albe/backup/mysql/
cp pmdsdata3-all-mysql.sql /home/albe/backup/mysql/pmdsdata3-all-mysql$(date +"__%Y.%m.%d_%H.%M.%S").sql
cp pmdsdata3-all-mysql.sql /home/albe/backup/mysql


#C:\p\1ziptar\7-Zip\7z.exe a -y -t7z -xr!templates_c  -xr!testnobackup "c:\backup\htdocs\htdocs.%dhms%.%computername%.7z" C:\p2\xampp\htdocs\
#copy "c:\backup\htdocs\htdocs.%dhms%.%computername%.7z"  "c:\backup\htdocs\htdocs.%computername%.latest.7z"
# dateh1=$(date +"__%Y.%m.%d_%H.%M.%S")
# mkdir -p /home/albe/backup/htdocs
# 7z a -y -t7z -xr!templates_c  -xr!testnobackup "/home/albe/backup/htdocs/htdocs.$dateh1.$HOSTNAME.7z" /var/www/html/
# cp "/home/albe/backup/htdocs/htdocs.$dateh1.$HOSTNAME.7z" "/home/albe/backup/htdocs/htdocs.$HOSTNAME.latest.7z"

#
date
#

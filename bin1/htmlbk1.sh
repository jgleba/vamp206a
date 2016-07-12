#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  backup htdocs
END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#cd ; 
date ; set +vx  ; set -vx ; # echo off, then echo on
#

#C:\p\1ziptar\7-Zip\7z.exe a -y -t7z -xr!templates_c  -xr!testnobackup "c:\backup\htdocs\htdocs.%dhms%.%computername%.7z" C:\p2\xampp\htdocs\
#copy "c:\backup\htdocs\htdocs.%dhms%.%computername%.7z"  "c:\backup\htdocs\htdocs.%computername%.latest.7z"

dateh1=$(date +"__%Y.%m.%d_%H.%M.%S")
mkdir -p /home/albe/backup/htdocs
7z a -y -t7z -xr!templates_c  -xr!testnobackup "/home/albe/backup/htdocs/htdocs.$dateh1.$HOSTNAME.7z" /var/www/html/
cp "/home/albe/backup/htdocs/htdocs.$dateh1.$HOSTNAME.7z" "/home/albe/backup/htdocs/htdocs.$HOSTNAME.latest.7z"

#
date
#

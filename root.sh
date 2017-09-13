#!/usr/bin/env bash
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
#
echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, "$0" $(date +"__%Y-%m-%d_%H.%M.%S")
#https://stackoverflow.com/questions/38978650/run-a-script-in-the-same-directory-as-the-current-script
echo "${BASH_SOURCE[${#BASH_SOURCE[@]} - 1]}"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#clear
# check for root privilege
if [ "$(id -u)" != "0" ]; then
   echo " This script must be run as root." 1>&2
   echo '    You are not root. Exiting...'
   exit 1; exit 1; exit 1
fi
echo You are root, continuing..

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


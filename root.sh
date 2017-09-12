#!/usr/bin/env bash
set +x

#clear
# check for root privilege
if [ "$(id -u)" != "0" ]; then
   echo " This script must be run as root." 1>&2
   echo '    You are not root. Exiting...'
   exit 1; exit 1; exit 1
fi
echo You are root, continuing..

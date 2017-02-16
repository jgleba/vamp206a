#!/usr/bin/env bash
set -x


#clear
# check for root privilege
if [ "$(id -u)" != "0" ]; then
   echo " this script must be run as root" 1>&2
   echo
   exit 1
fi

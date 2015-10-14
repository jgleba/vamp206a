#!/usr/bin/env bash

smbmn() {


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#edit these lines to match your windows machines shares...
#

#get ip address of windows machine...
ipredwe = nmblookup -S REDWE | grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'  | head -n1
echo "$ipredwe\n"

mkdir -p /mnt/REDWE/c
:chmod -R 777 /mnt/REDWE/c

# this is a share for drive c - the whole drive
sudo mount -t cifs //$ipredwe/c /mnt/REDWE/c -o username=$uredwe,password=$predwe

# this is a share where the web root files are..
mkdir -p /var/www/html
sudo mount -t cifs //$ipredwe/htocs /var/www/html -o username=$uredwe,password=$predwe

}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

saynow() {
date
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

saynow
set -x
smbmn
date

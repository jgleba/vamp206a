#!/usr/bin/env bash

smbmn() {

mkdir -p /var/www/html

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#edit these lines for your windows machines...
#

#get ip address of windows machine...
ipredwe = nmblookup -S REDWE | grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'  | head -n1
echo "$ipredwe\n"

mkdir -p /mnt/REDWE/c
:chmod -R 777 /mnt/REDWE/c

sudo mount -t cifs //$ipredwe/c /mnt/REDWE/c -o username=$uredwe,password=$predwe
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

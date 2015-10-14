#!/usr/bin/env bash

source shc/12env.sh

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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#get ip address of windows machine...
ip3hz = nmblookup -S PMDS-3HZGD42 | grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'  | head -n1
echo "$ip3hz\n"

mkdir -p /mnt/3hz/c
:chmod -R 777 /mnt/3hz/c

# this is a share for drive c - the whole drive
sudo mount -t cifs //$ip3hz/c /mnt/3hz/c -o username=$u3hz,password=$p3hz

# this is a share where the web root files are..
mkdir -p /var/www/html
sudo mount -t cifs //$ip3hz/htocs /var/www/html -o username=$u3hz,password=$p3hz

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

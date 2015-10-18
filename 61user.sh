#!/usr/bin/env bash

# add www group and a user

set -x
date

sudo groupadd www
sudo chgrp -hR www /var/www/html
sudo chmod -R g+rw  /var/www/html

sudo useradd dgleba
sudo passwd dgleba


groups
groups dgleba
id dgleba

sudo usermod -G adm,dialout,plugdev,sambashare,www  dgleba

sudo deluser dgleba sudo


#https://help.ubuntu.com/community/FilePermissions
#chmod ugo+rwx file4

#


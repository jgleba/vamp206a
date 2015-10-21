#!/usr/bin/env bash

# add www group and a user

cd
set -x
date

sudo groupadd www
sudo chgrp -hR www /var/www/html
sudo chmod -R g+rw  /var/www/html

#adduser asks questions and does more...
sudo adduser dgleba
#sudo useradd -d /home/dgleba -m dgleba
# no home dir... sudo useradd dgleba
#sudo passwd dgleba
sudo usermod -G adm,dialout,plugdev,sambashare,www  dgleba

groups
groups dgleba
id dgleba


# sudo deluser dgleba sudo

#https://help.ubuntu.com/community/FilePermissions
#chmod ugo+rwx file4
#


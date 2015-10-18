#!/usr/bin/env bash

# add www group and a user

set -x
date

sudo useradd webed
sudo groupadd www
sudo useradd -G www webed

chgrp -hR www /var/www/html
chmod -R g+rw  /var/www/html

#https://help.ubuntu.com/community/FilePermissions
#chmod ugo+rwx file4

#
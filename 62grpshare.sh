#!/usr/bin/env bash

cd
set -x
date
source shc/21env.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# make a shared folder and allow www-data group to write to it...
sudo mkdir -p /srv/share
sudo chgrp -hR www-data /srv/share
sudo chown -R :www-data  /srv/share
sudo chmod -R g+rw  /srv/share 
sudo chmod -R o-rw /srv/share
# make only folders +x so they can be cd into.
sudo find /usr/share -type d -exec chmod g+x {} +
sudo usermod -a -G www-data  albe

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
groups
groups albe
id albe
#
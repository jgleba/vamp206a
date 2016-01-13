#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#comment content

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#
source shc/21env.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# make a shared folder and allow www-data group to write to it...
# sudo groupadd www  ..#.. just use www-data group
sudo mkdir -p /srv/share
sudo chgrp -hR www-data /srv/share
sudo chown -R www-data  /srv/share
#also set the group sticky bit, so that the group is set for new files created. chmod g+s /home/shared – jris198944 May 13 '14 at 8:43 
sudo chmod -R g+rws  /srv/share 
sudo chmod -R o-rw /srv/share
# make only folders +x so they can be cd into.
sudo find /usr/share -type d -exec chmod g+x {} +
sudo usermod -a -G www-data  albe

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
groups
groups albe
id albe
#

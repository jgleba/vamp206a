#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

# Purpose: create shared folder for a group to work in.

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#
source shc/21env.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
groups
groups albe
id albe
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# make srv/web folder and change permissions...
# my standard practice for web apps...
#
sudo mkdir -p /srv/web
sudo chgrp -hR www-data /srv/web # change group to www-data ( apache group. apache already was installed.)
sudo chown -R root /srv/web 
sudo chmod -R g+rw  /srv/web # writable for group
sudo chmod -R o-rw /srv/web # not viewable for others..
# make only folders +x so they can be cd into.
sudo find /srv/web -type d -exec chmod g+x {} +
#also set the group sticky bit, so that the group is set for new files created. chmod g+s /home/shared – jris198944 May 13 '14 at 8:43 
sudo chmod -R g+rws  /srv/web 

# to be able to backup web config...
sudo chmod -R o+r /etc/nginx # viewable for ..
sudo chmod -R o+r /etc/apache2 # viewable for ..


#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

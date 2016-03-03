#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  install xrdp - remote desktop

http://askubuntu.com/questions/449785/ubuntu-14-04-xrdp-grey

sudo apt-get install xrdp
sudo apt-add-repository ppa:ubuntu-mate-dev/ppa
sudo apt-add-repository ppa:ubuntu-mate-dev/trusty-mate
sudo apt-get update 
#sudo apt-get upgrade
#sudo apt-get install ubuntu-mate-core ubuntu-mate-desktop

echo xfce4-session >~/.xsession
or
echo mate-session >~/.xsession
sudo service xrdp restart

http://c-nergy.be/blog/?p=5305


END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#

# Main: put code here...

sudo apt-get install xrdp



#
date
#

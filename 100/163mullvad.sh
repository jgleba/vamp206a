#!/usr/bin/env bash
cd
# echo off
set +vx
# echo on
set -vx
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function offline()
{
exit 999
# begin block comment =============================
: <<'END'

comment content
ls

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#
date
#

#mullvad

sudo apt-get update


cd
mkdir -p 09
cd 09
wget https://mullvad.net/static/download/mullvad_55-1_all.deb
sudo dpkg -i mullvad_55-1_all.deb
sudo apt-get -f -y install
sudo dpkg -i mullvad_55-1_all.deb

#try installing some gui stuff...
sudo apt-get -y install python-qt4 pyqt4-dev-tools

#mullvad gui not showing..
#sudo apt-get install lubuntu-desktop
# this works, but wish i didn't have to install ubuntu desktop
#sudo apt-get install ubuntu-desktop


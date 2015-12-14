#!/usr/bin/env bash
cd
# echo off
set +vx
# echo on
set -vx
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



#mullvad
cd
mkdir -p 09
cd 09
wget https://mullvad.net/static/download/mullvad_55-1_all.deb
sudo dpkg -i mullvad_55-1_all.deb
sudo apt-get -f -y install
sudo dpkg -i mullvad_55-1_all.deb

#try installing some gui stuff...
sudo apt-get install python-qt4 pyqt4-dev-tools


#mullvad gui not showing..
sudo apt-get install lubuntu-desktop
# this works, but wish i didn't have to install ubuntu desktop
sudo apt-get install ubuntu-desktop



#bittorrent

sudo apt-get update

#sudo add-apt-repository ppa:transmissionbt/ppa
#sudo apt-get -y install transmission-cli transmission-common transmission-daemon
#sudo apt-get -y install transmission-gtk 
sudo apt-get -y purge transmission-cli transmission-common transmission-daemon

sudo apt-get -y install deluge


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


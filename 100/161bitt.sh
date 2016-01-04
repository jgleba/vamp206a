#!/usr/bin/env bash
cd
# echo off
set +vx
# echo on
set -vx
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





#bittorrent

#sudo add-apt-repository ppa:transmissionbt/ppa
#sudo apt-get -y install transmission-cli transmission-common transmission-daemon
#sudo apt-get -y install transmission-gtk 
#sudo apt-get -y purge transmission-cli transmission-common transmission-daemon

#sudo apt-get -y install deluge

#qbittorrent
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
sudo apt-get update
sudo apt-get -y install qbittorrent


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


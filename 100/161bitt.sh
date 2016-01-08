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


sudo apt-get -y install deluge


#qbittorrent
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
sudo apt-get update
sudo apt-get -y install qbittorrent


popcorn-time.se
dl and extract 
Download Beta 3.2 For 64-bit Linux Users
/home/albe/bin/Popcorn-Time-linux64.tar.gz
#noworky..
sudo apt-get install libudev0:i386
got error.
this helped...
sudo ln -s /lib/x86_64-linux-gnu/libudev.so.1 /usr/lib/libudev.so.0
but..
----
albe@redekmatev2:~/bin$ ./Popcorn-Time
[18483:0104/193620:WARNING:simple_index_file.cc(338)] Could not map Simple Index file.
[18483:0104/193620:INFO:simple_index_file.cc(437)] Simple Cache Index is being restored from disk.
----






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


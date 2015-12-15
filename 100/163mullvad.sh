



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2015-12-14[Dec-Mon]23-51PM

see documents/mullvad folder...

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~















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
=
gui is difficult to start. it doesn't easily show..
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

=

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2015-12-14[Dec-Mon]21-37PM

Logotype Mullvad MULLVAD
DOWNLOAD
FEATURES
FAQ
NEWS
 LOG OUT
OPENVPN

Account number: 369959095035
Time left: 5 days 
OpenVPN configuration: mullvadconfig.zip

Windows

Install OpenVPN
Extract the configuration files into %ProgramFiles%\OpenVPN\config\
Start OpenVPN as Administrator (right-click, Run as ...)
Right-click on the OpenVPN icon and choose "Connect"
Mac

Install the OpenVPN distribution Tunnelblick
Extract the configuration files and double click Mullvad.tblk in the subdirectory OSX
Select "Connect Mullvad" from the Tunnelblick menu
Linux (Debian/Ubuntu)

Option 1: a regular user

Install network-manager-openvpn (sudo apt-get install network-manager-openvpn)
Extract the configuration files
Import mullvad_linux.conf using the Network Manager menu
Option 2: root

Install OpenVPN and resolvconf (sudo apt-get install openvpn resolvconf)
Extract the configuration files into /etc/openvpn/
Start with sudo /etc/init.d/openvpn start
Select exit country

If you want to choose where your device will seem to be located you can download a configuration file which will connect to a certain country:

Netherlands	Germany	Sweden	Canada	USA
MULLVAD – a VPN service that helps keep your online activity, identity and location private. GET STARTED 
ABOUT
TERMS
FAQ
DOWNLOAD
NEWS
SUPPORT
(PUBLIC PGP KEY)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#
date
#


_____________


#again..
#https://wiki.archlinux.org/index.php/Mullvad

sudo apt-get install openvpn resolvconf






#!/usr/bin/env bash

cd
set -x


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


function gui1() {
#install gui...
sudo apt-get -y install lxde

#install utils to allow resizing of gui..
sudo apt-get -y install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

function operai() {
#get opera 92mb
sudo sh -c 'echo "deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
sudo sh -c 'wget -O - http://deb.opera.com/archive.key | apt-key add -'
sudo apt-get update
sudo apt-get install opera
}  

# Midori browser?  91mb
#sudo apt-add-repository ppa:midori/ppa && sudo apt-get update -qq && sudo apt-get install midori

# 235mb
#sudo apt-get install epiphany-browser

}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function removevnc() {
#
#sudo apt-get remove --purge tightvncserver
tightvncserver -kill :1
sudo apt-get --purge autoremove tightvncserver
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


function vnci () {


# vnc
# http://vandorp.biz/2012/01/installing-a-lightweight-lxdevnc-desktop-environment-on-your-ubuntudebian-vps/#.VixnHH6rTIU
# vnc
# https://panel.cinfu.com/knowledgebase/20/Graphical-Desktop-LXDE-installation-in-VPS-with-Ubuntu-OS-for-a-low-RAM-VPS-plans.html
# https://www.vultr.com/docs/how-to-install-vnc-desktop-on-ubuntu-14-04

source shc/21env.sh

sudo apt-get -y install  tightvncserver

#for copy-paste
sudo apt-get -y install autocutsel

# Start VNC to create config file
tightvncserver :1
# enter password twice...

# backup original file once...
if [ ! -f /home/$userv/.vnc/xstartup.orig ] ; then  cp /home/$userv/.vnc/xstartup /home/$userv/.vnc/xstartup.orig ; fi
 cp /home/$userv/.vnc/xstartup /home/$userv/.vnc/xstartup.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
 cp /home/$userv/.vnc/xstartup /home/$userv/.vnc/xstartup.$(date +"%s").bak


# Then stop VNC
tightvncserver -kill :1


# Edit config file to start session with LXDE:
# Add this at the bottom of the file:
mkdir -p /home/$userv/.vnc/
#autocutsel must be at top of file..
#allow copy-paste cut-paste
#http://raspberrypi.stackexchange.com/questions/4474/tightvnc-copy-paste-between-local-os-and-raspberry-pi
# use sed to add line after first line of the file..
sed -i '1 a \# David Gleba\nautocutsel -fork' /home/$userv/.vnc/xstartup
echo "#this noworky... vncconfig -nowin -iconic &"  >> /home/$userv/.vnc/xstartup
echo "lxterminal &"  >> /home/$userv/.vnc/xstartup
echo "/usr/bin/lxsession -s LXDE &"  >> /home/$userv/.vnc/xstartup
cat /home/$userv/.vnc/xstartup


# Restart VNC
tightvncserver :1

#notredlighternot,not9 192.168.88.79:1 ultravncviewer 
#5901

#reset password ..  vncpasswd   8 char max



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~/.vnc/xstartup works..
#.....#!/bin/sh
#vncconfig -nowin -iconic &
autocutsel -fork
xrdb $HOME/.Xresources
xsetroot -solid grey
#x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
#x-window-manager &
# Fix to make GNOME work
export XKL_XMODMAP_DISABLE=1
/etc/X11/Xsession
lxterminal &
/usr/bin/lxsession -s LXDE &
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function offline()
{
exit 999

}
#

gui1
vnci


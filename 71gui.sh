#!/usr/bin/env bash

cd
set -x
source shc/21env.sh



# i may need to take the vnc setup out of this so it can be run as user no sudo...

# for vnc :   ip:1 , eg: 10.4.11.19:1

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function gui1() {
#install gui...
sudo apt-get -y install lxde
sudo apt-get -y install thunar
sudo apt-get -y install expect

#install utils to allow resizing of gui..
sudo apt-get -y install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
sudo apt-get -y install iceweasel


}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


function operai() {
#get opera browser 92mb
sudo sh -c 'echo "deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
sudo sh -c 'wget -O - http://deb.opera.com/archive.key | apt-key add -'
sudo apt-get update
sudo apt-get install opera


#others..
#
# Midori browser?  91mb
#sudo apt-add-repository ppa:midori/ppa && sudo apt-get update -qq && sudo apt-get install midori
#
# 235mb
#sudo apt-get install epiphany-browser

# 104 mb
#sudo apt-get install iceweasel


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


#
#
# note **************  to start vnc use:
#
# sudo service tightvncserver1 start
#
#







# vnc
# http://vandorp.biz/2012/01/installing-a-lightweight-lxdevnc-desktop-environment-on-your-ubuntudebian-vps/#.VixnHH6rTIU
# vnc
# https://panel.cinfu.com/knowledgebase/20/Graphical-Desktop-LXDE-installation-in-VPS-with-Ubuntu-OS-for-a-low-RAM-VPS-plans.html
# https://www.vultr.com/docs/how-to-install-vnc-desktop-on-ubuntu-14-04

source shc/21env.sh

sudo apt-get -y install  tightvncserver

#for copy-paste
sudo apt-get -y install autocutsel

#~~~~

#vnc password.......
#
#use expect to silently answer questions in vnc password script...
#!/bin/sh
#http://askubuntu.com/questions/328240/assign-vnc-password-using-script
prog=vncpasswd
#mypass=$pw1  #too short
mypass=$pw4
expect <<EOF
spawn "$prog"
expect "Password:"
send "$mypass\r"
expect "Verify:"
send "$mypass\r"
expect "Would you like to enter a view-only password (y/n)?"
send "n\r"
expect eof
exit
EOF


# Start VNC to create config file
# think this should not be sudo becuase a I got a root vnc session after running this as sudo...
tightvncserver :1


# backup original file once...
if [ ! -f /home/$userv/.vnc/xstartup.orig ] ; then  cp /home/$userv/.vnc/xstartup /home/$userv/.vnc/xstartup.orig ; fi
 cp /home/$userv/.vnc/xstartup /home/$userv/.vnc/xstartup.bk.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
 cp /home/$userv/.vnc/xstartup /home/$userv/.vnc/xstartup.$(date +"%s").bk


# Then stop VNC
tightvncserver -kill :1


# Edit config file to start session with LXDE:
# Add this at the bottom of the file:
mkdir -p /home/$userv/.vnc/
#autocutsel must be at top of file..
#allow copy-paste cut-paste in ultravnc
#http://raspberrypi.stackexchange.com/questions/4474/tightvnc-copy-paste-between-local-os-and-raspberry-pi
# use sed to add line after first line of the file..
sed -i '1 a \# David Gleba\nautocutsel -fork' /home/$userv/.vnc/xstartup
echo "#this noworky... vncconfig -nowin -iconic &"  >> /home/$userv/.vnc/xstartup
echo "lxterminal &"  >> /home/$userv/.vnc/xstartup
echo "/usr/bin/lxsession -s LXDE &"  >> /home/$userv/.vnc/xstartup
cat /home/$userv/.vnc/xstartup
sudo chown -R albe .vnc 


# Restart VNC
#tightvncserver :1


#create upstart script for starting vnc...
#this webpage for rc.local, but i used upstart... http://raspberrypi.stackexchange.com/questions/27676/auto-start-tightvncserver-on-raspberry-pi-2
sudo tee /etc/init/tightvncserver1.conf <<EOF
description "vnc start"
author      "David Gleba"

start on filesystem or runlevel [2345]
stop on shutdown


script
    #VNCUSER='albe'
    sleep 3
    # Start tightvncserver
    su  albe -c '/usr/bin/tightvncserver :1'
end script

pre-start script
    echo "[`date`] tightvncserver1 start...." >> /var/log/tightvncserver1.log
end script

pre-stop script
    rm /var/run/mountvshare.pid
    echo "[`date`] .... stop tightvncserver1" >> /var/log/tightvncserver1.log
end script
#
EOF
init-checkconf /etc/init/tightvncserver1.conf

#

sudo service tightvncserver1 start
ps -ef | grep vnc

#reset password ..  vncpasswd   8 char max

}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function offline()
{
exit 999

I started it with "sudo tightvncserver :1" - that was a mistake. messed up the permissions. 2015-12-08_Tue_14.56-PM
fix...
sudo leafpad /etc/init/tightvncserver1.conf 
 change to.. su - albe -c '/usr/bin/tightvncserver :1'
sudo chown -R albe .vnc 

_____________

error
upstart 
sudo service tightvncserver1 start 
start: Unknown job: tightvncserver1

checkit..
init-checkconf /etc/init/tightvncserver1.conf


}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#

gui1
vnci
sudo service tightvncserver1 start

#
#!/usr/bin/env bash
cd
set -x
source shc/21env.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function vnc2() {

#install x11vnc
#https://help.ubuntu.com/community/VNC/Servers

# done by tightvnc setup...   x11vnc -storepasswd


#create upstart script for starting vnc...
sudo tee /etc/init/x11vnc1.conf <<EOF
description "x11vnc start"
author      "David Gleba"

start on runlevel [2345]
stop on runlevel [^2345]

console log

respawn
respawn limit 20 5

exec /usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/albe/.vnc/passwd -rfbport 5900 -shared

EOF

init-checkconf /etc/init/x11vnc1.conf

sudo service x11vnc1 start
ps -ef | grep vnc


}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function offline()
{
exit 999


#unfinished....  vnc password.......
#
#use expect to silently answer questions in vnc password script...
#!/bin/sh
#http://askubuntu.com/questions/328240/assign-vnc-password-using-script
prog=x11vnc -storepasswd
#mypass=$pw1  #too short
mypass=$pw4
expect <<EOF
spawn "$prog"
expect "Enter VNC password:"
send "$mypass\r"
expect "Verify password:"
send "$mypass\r"
expect "Would you like to enter a view-only password (y/n)?"
send "n\r"
expect eof
exit
EOF


}



#main..
vnc2
#


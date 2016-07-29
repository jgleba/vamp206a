#!/usr/bin/env bash
date
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# add new user. 
echo Usage nuser.sh  username 
echo

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

read -ep "Please enter the new users password: " pwnu1
nuser="$1"
echo user: "$nuser"
echo $pwnu1
#adduser asks questions and does more...
sudo adduser $nuser --gecos "$nuser,..,..,.." --disabled-password
echo "$nuser:$pwnu1" | sudo chpasswd
#add user to group www
sudo usermod -a -G www  $nuser
(echo "$pwnu1"; echo "$pwnu1") | sudo smbpasswd -s -a $nuser
sudo mkdir /home/$nuser/bin
sudo chown  $nuser:$nuser /home/$nuser/bin
echo groups:
groups $nuser
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
date
#
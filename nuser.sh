#!/usr/bin/env bash
date
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# add new user. 
echo usage nuser.sh  user password
nuser="$1"
pwnu1="$2"
echo $pwnu1
#adduser asks questions and does more...
sudo adduser $nuser --gecos "pmds user,0,0,0" --disabled-password
echo "$nuser:$pwnu1" | sudo chpasswd
#add user to group www
sudo usermod -a -G www  $nuser
(echo "$pwnu1"; echo "$pwnu1") | sudo smbpasswd -s -a $nuser
groups 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
date
#

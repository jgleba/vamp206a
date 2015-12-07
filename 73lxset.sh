#!/usr/bin/env bash
cd
# echo off
set +vx
# echo on
set -vx
source shc/21env.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# import my lxde settings from archive tgz

# backup user home dir ...
sudo tar -cvzf backup/$userv-home.$(date +"%Y.%m.%d_%k.%M.%S").tgz  /home/$userv/ --exclude={tmp,backup,Trash/files,backup/*.tgz} 


#to get it from ftp...
if  [ 1 = 0 ] ; then
    cd tmp
        if ping -c 1 192.168.88.94 &> /dev/null
        then
          curl -O -u dg:fruit ftp://192.168.88.94:2141//files/lxdehome.tgz
        else
          curl -O -u dg:fruit ftp://10.4.10.243:2141//files/lxdehome.tgz
        fi
    cd 
    tar -xvf tmp/lxdehome.tgz
fi

# if it was retreived from the repo already...
if  [ 1 = 1 ] ; then
    cd 
    tar -xvf shc/lxdehome.tgz
fi


   
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function offline()
{
exit 999

#create home backup for unpacking with lxset.sh...
# need .config desktop some .files in home/albe...
#tar -cvzf lxdehome.tgz .


_____________


error:
http://askubuntu.com/questions/452108/cannot-change-screen-size-from-640x480-after-14-04-installation-on-virtualbox-os

i changed the memory size and then could not change the screen size...

sudo apt-get install virtualbox-guest-dkms

this fixed it.

2015-12-07_Mon_14.26-PM

_____________


}
#
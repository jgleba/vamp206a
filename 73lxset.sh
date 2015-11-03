#!/usr/bin/env bash
cd
# echo off
set +vx
# echo on
set -vx
source shc/21env.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# backup user home dir ...
#works:
#sudo tar -cvzf backup/$userv-home.$(date +"%Y-%m-%d_%s").tgz /home/$userv/ --exclude "/home/$userv/tmp" \
 --exclude "/home/$userv/backup"
#works:
#sudo tar -cvzf backup/$userv-home.$(date +"%Y-%m-%d_%s").tgz /home/$userv/ --exclude "tmp" \
 --exclude "backup"
#works...
sudo tar -cvzf backup/$userv-home.$(date +"%Y-%m-%d_%s").tgz  /home/$userv/ --exclude={tmp,backup/*.tgz} 



#to get it from ftp...
if  [ 1=0 ] ; then
    cd tmp
    curl -O -u dg:fruit ftp://192.168.88.94:2141//files/lxdehome.tgz
    cd 
    tar -xvf tmp/lxdehome.tgz
fi

# if it was retreived from the repo already...
if  [ 1=1 ] ; then
    cd 
    tar -xvf shc/lxdehome.tgz
fi


   
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function offline()
{
exit 999

}
#
#!/usr/bin/env bash
cd
# echo off
set +vx
# echo on
set -vx

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#to get it from ftp...
if  [ 1=0 ] ; then
    cd tmp
    curl -O -u dg:afruit ftp://192.168.88.94:2141//var/varvamp/files/lxdehome.tgz
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
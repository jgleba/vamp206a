#!/usr/bin/env bash

# vagrant

cd
# echo off
set +vx
# echo on
set -vx

#http://www.olindata.com/blog/2014/07/installing-vagrant-and-virtual-box-ubuntu-1404-lts

sudo apt-get install virtualbox

#got an error. something about kernel.

sudo apt-get install virtualbox-dkms

sudo apt-get install vagrant

vagrant box add precise32 http://files.vagrantup.com/precise32.box

cd
mkdir vagrant11
cd vagrant11
vagrant init
vagrant up

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function offline()
{
exit 999

}
#
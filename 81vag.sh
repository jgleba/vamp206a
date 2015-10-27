#!/usr/bin/env bash

# vagrant

cd
# echo off
set +vx
# echo on
set -vx

#http://www.olindata.com/blog/2014/07/installing-vagrant-and-virtual-box-ubuntu-1404-lts

sudo apt-get -y install virtualbox

#got an error. something about kernel.

sudo apt-get -y install virtualbox-dkms
sudo apt-get -y install linux-headers-generic.

sudo apt-get -y install vagrant

vagrant box add precise32 http://files.vagrantup.com/precise32.box

cd
mkdir vagrant11
cd vagrant11
vagrant init
vagrant up

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

albe@vamp206b:~/vagrant11$ vagrant up
VirtualBox is complaining that the installation is incomplete. Please
run `VBoxManage --version` to see the error message which should contain
instructions on how to fix this error.
albe@vamp206b:~/vagrant11$ VBoxManage --version
WARNING: The character device /dev/vboxdrv does not exist.
	 Please install the virtualbox-dkms package and the appropriate
	 headers, most likely linux-headers-generic.
	 You will not be able to start VMs until this problem is fixed.
4.3.10_Ubuntur93012
albe@vamp206b:~/vagrant11$ 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function offline()
{
exit 999

}
#
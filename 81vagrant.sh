#!/usr/bin/env bash


# vagrant

_____________

#contents:

# October

# 2015-11-24

# 2015-12-01 worked on ubuntu 14.04 vamp206a

_____________



cd
# echo off
set +vx
# echo on
set -vx
source shc/21env.sh


#https://www.howtoforge.com/vboxheadless-running-virtual-machines-with-virtualbox-4.3-on-a-headless-ubuntu-14.04-lts-server
#http://www.olindata.com/blog/2014/07/installing-vagrant-and-virtual-box-ubuntu-1404-lts

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install virtualbox

#got an error. something about kernel.

sudo apt-get -y install virtualbox-dkms
# got message..
#virtualbox-dkms is already the newest version.
#virtualbox-dkms set to manually installed.


sudo apt-get -y install linux-headers-generic.

sudo apt-get -y install vagrant


cd
mkdir vagrant11
cd vagrant11
vagrant init
vagrant up

vagrant box add precise32 http://files.vagrantup.com/precise32.box

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

 apt-get update; sudo apt-get install virtualbox-dkms linux-headers-amd64
    # ... E: Package 'linux-headers-amd64' has no installation candidate

_____________


albe@vamp206b:~/vagrant11$ sudo dpkg-reconfigure virtualbox-dkms
------------------------------
Deleting module version: 4.3.10
completely from the DKMS tree.
------------------------------
Done.
Loading new virtualbox-4.3.10 DKMS files...
Building only for 3.19.0-25-generic
Building initial module for 3.19.0-25-generic
Error! Bad return status for module build on kernel: 3.19.0-25-generic (x86_64)
Consult /var/lib/dkms/virtualbox/4.3.10/build/make.log for more information.
 * Stopping VirtualBox kernel modules                                                   [ OK ] 
 * Starting VirtualBox kernel modules                     
* No suitable module for running kernel found                                           [fail]
invoke-rc.d: initscript virtualbox, action "restart" failed.
albe@vamp206b:~/vagrant11$ 

==

sudo apt-get install linux-headers-`uname -r`
# ... shows .  nothing to do

http://askubuntu.com/questions/582109/14-10-virtualbox-no-suitable-module-for-running-kernel-found-cannot-find-ker


***
sudo apt-get install linux-generic linux-image-generic linux-headers-generic linux-signed-generic



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2015-10-27[Oct-Tue]21-01PM

sudo dpkg-reconfigure virtualbox-dkms

DKMS: uninstall completed.

------------------------------
Deleting module version: 4.3.10
completely from the DKMS tree.
------------------------------
Done.
Loading new virtualbox-4.3.10 DKMS files...
Building only for 3.19.0-25-generic
Building initial module for 3.19.0-25-generic
ERROR: Cannot create report: [Errno 17] File exists: '/var/crash/virtualbox-dkms.0.crash'
Error! Bad return status for module build on kernel: 3.19.0-25-generic (x86_64)
Consult /var/lib/dkms/virtualbox/4.3.10/build/make.log for more information.
 * Stopping VirtualBox kernel modules                                                            [ OK ] 
 * Starting VirtualBox kernel modules                                                                    
  * No suitable module for running kernel found
                                                                                                 [fail]
invoke-rc.d: initscript virtualbox, action "restart" failed.
albe@vamp206b:~/vagrant11$ ^C
albe@vamp206b:~/vagrant11$ 


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo apt-get -y remove --purge virtualbox
sudo apt-get -y remove --purge vagrant

sudo dkms autoinstall 
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install virtualbox



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2015-10-27[Oct-Tue]21-25PM

Building only for 3.19.0-25-generic
Building initial module for 3.19.0-25-generic
ERROR: Cannot create report: [Errno 17] File exists: '/var/crash/virtualbox-dkms.0.crash'
Error! Bad return status for module build on kernel: 3.19.0-25-generic (x86_64)
Consult /var/lib/dkms/virtualbox/4.3.10/build/make.log for more information.
 * Stopping VirtualBox kernel modules                                                                             [ OK ] 
 * Starting VirtualBox kernel modules                                               * No suitable module for running kernel found
                                                              [fail]
invoke-rc.d: initscript virtualbox, action "restart" failed.
Setting up virtualbox-qt (4.3.10-dfsg-1ubuntu5) ...
Processing triggers for menu (2.1.46ubuntu1) ...
albe@vamp206b:~/vagrant11$ sudo service virtualbox status


http://askubuntu.com/questions/660166/virtualbox-kernel-issue-3-19-0-25-generic

dpkg -s virtualbox


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

http://askubuntu.com/questions/582109/14-10-virtualbox-no-suitable-module-for-running-kernel-found-cannot-find-ker

https://www.virtualbox.org/wiki/Linux_Downloads

Solution:
Uninstall bad version of VirtualBox with:
sudo apt-get purge virtualbox
Then get installer from https://www.virtualbox.org/wiki/Linux_Downloads 
and install deb package. 
Is says same version is in your repositories... but that way it works.

sudo dpkg -i virtualbox5.deb


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2015-10-27[Oct-Tue]21-46PM

https://www.virtualbox.org/wiki/Download_Old_Builds_4_3

no... sudo dpkg -r virtualbox5.deb

dpkg -l |grep virtualb
sudo dpkg -r virtualbox-5.0


wget http://download.virtualbox.org/virtualbox/4.3.32/virtualbox-4.3_4.3.32-103443~Ubuntu~raring_amd64.deb
sudo dpkg -i  /home/albe/virtualbox-4.3_4.3.32-103443~Ubuntu~raring_amd64.deb


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2015-11-24[Nov-Tue]08-35AM

noworky:
needs help...
sudo cat "deb http://download.virtualbox.org/virtualbox/debian trusty  contrib" >> /etc/apt/sources.list

http://askubuntu.com/questions/671812/virtualbox-not-installing-on-ubuntu-14-04-lts

https://www.virtualbox.org/wiki/Linux_Downloads


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Title:  . install virtual box on vamp206a worked.

-----------------------2015-12-01[Dec-Tue]06-35AM

http://ubuntuhandbook.org/index.php/2015/07/install-virtualbox-5-0-ubuntu-15-04-14-04-12-04/

#no use.. see below..
wget http://download.virtualbox.org/virtualbox/5.0.10/virtualbox-5.0_5.0.10-104061~Ubuntu~trusty_amd64.deb

sudo apt-get purge virtualbox virtualbox-4* virtualbox-5*

#got error..
#sudo dpkg -i virtualbox-5.0_5.0.10-104061~Ubuntu~trusty_amd64.deb

worked:
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" >> /etc/apt/sources.list.d/virtualbox.list'
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
#got error:  E: Unmet dependencies. Try 'apt-get -f install' with no packages (or specify a solution).
sudo apt-get install virtualbox-5.0
#but this fixed it...
sudo apt-get -f install
virtualbox
#works..

sudo apt-get install vagrant

sudo apt-get install dkms

#version 5 is not supported...
sudo apt-get install virtualbox-4.3


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function offline()
{
exit 999

}
#
#!/usr/bin/env bash



#!/usr/bin/env bash
set -x
source shc/21env.sh


# determine ubuntu version
ubuntu_version=$(lsb_release -cs)

# check for interactive shell
if ! grep -q "noninteractive" /proc/cmdline ; then
    stty sane

    # ask questions
#    read -ep " please enter the username you are currently logged in as: " -i "$userv" userv
#    read -ep " please enter your preferred hostname: " -i "$default_hostname" hostname
#    read -ep " please enter your preferred domain: " -i "$default_domain" domain
  
fi

# print status message
echo " preparing your server; this may take a few minutes ..."


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# backup hosts settings...

#
sudo cp /etc/hosts /etc/hosts.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
sudo cp /etc/hostname /etc/hostname.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#why do this stuff again... ???
# set fqdn
fqdn="$default_hostname.$default_domain"
# update hostname
sudo echo "$default_hostname" > /etc/hostname
sudo sed -i "s@ubuntu.ubuntu@$fqdn@g" /etc/hosts
sudo sed -i "s@vamp206b.vamp206b@$fqdn@g" /etc/hosts
sudo sed -i "s@ubuntu@$default_hostname@g" /etc/hosts
sudo sed -i "s@vamp206b@$default_hostname@g" /etc/hosts
#hostname "$default_hostname"



x1
{

worked...
curl --digest --user dgleba:x123za https://bitbucket.org/dgleba/vamp198e/get/master.zip -o vamp198e.zip

192.168.88.86

}

#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
saynow 
{
# this function not used.
echo (date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
}

offlinestuff()  {

echo tmp1

}

saynow

#


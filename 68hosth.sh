#!/usr/bin/env bash

cd
# echo off
set +vx
# echo on
set -vx

#set hostname with hardcoded name not env variable.

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sudo cp /etc/hosts /etc/hosts.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
sudo cp /etc/hosts /etc/hosts.$(date +"%s").bak
sudo cp /etc/hosts /etc/hosts.$(date "+%Y-%m-%d_%s").bak
sudo cp /etc/hostname /etc/hostname.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")


sudo echo pmdsdata3 | sudo tee /etc/hostname
cat /etc/hostname


sudo tee /etc/hosts <<EOF
#
127.0.0.1	localhost
127.0.1.1	pmdsdata3.local	pmdsdata9t

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
#
EOF


sudo cp /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.$(date +"%Y-%m-%d_%s").bak

#working on --  hostname=
nowdg1=`date +'__%Y-%m-%d_%a_%k.%M.%S-%Z'`
sudo sed -i "/hostname=/i # \n# David Gleba kdg54 $nowdg1 ...\n#"  /etc/ssmtp/ssmtp.conf
sudo sed -i "s/.*hostname=.*/hostname=pmdsdata3.local/g" /etc/ssmtp/ssmtp.conf



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function offline()
{
exit 999

# begin block comment =============================
: <<'END'
#begin block comment --  http://stackoverflow.com/questions/947897/block-comments-in-a-shell-script

ls

END
# end block comment ===============================

}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#
date
#


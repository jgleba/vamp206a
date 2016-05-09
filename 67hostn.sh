#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:   i want to make the hostname different on each boot so it won't conflict with another instance.

https://acritiqueofplanetearth.wordpress.com/2013/11/14/6/


END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#

# Main: put code here...

export hostv="v206x"
export hnow=$(date +"%Y%m%d%k%M%S")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo mkdir -p /var/log/v206

sudo cp /etc/hosts /var/log/v206/hosts.bk.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
sudo cp /etc/hostname /var/log/v206/hostname.bk.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
sudo cp /etc/ssmtp/ssmtp.conf /var/log/v206/ssmtp.conf.bk.$(date +"%__%Y-%m-%d_%a_%k.%M.%S-%Z")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sudo echo $hostv$hnow.local | sudo tee /etc/hostname
cat /etc/hostname

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sudo tee /etc/hosts <<EOF
#
127.0.0.1	localhost
127.0.0.1	$hostv$hnow.local 	$hostv$hnow

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
#
EOF

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#working on --  hostname=
#nowdg1=`date +'__%Y-%m-%d_%a_%k.%M.%S-%Z'`
#sudo sed -i "/hostname=/i # \n# David Gleba kdg54 $nowdg1 ...\n#"  /etc/ssmtp/ssmtp.conf
sudo sed -i "s/.*hostname=.*/hostname=$hostv$hnow.local/g" /etc/ssmtp/ssmtp.conf

set +vx ; echo " "; echo "  Hostname changed. Please reboot...  "

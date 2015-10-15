#!/usr/bin/env bash

smb() {

source shc/root.sh
source shc/21env.sh

cd
mkdir webwork
sudo mkdir -p /var/www/html

sudo apt-get -y install samba

#backup server config...
mkdir ~/backup
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
sudo cp /etc/samba/smb.conf    ~backup/smb.conf.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")


sudo cat <<EOF >> /etc/samba/smb.conf
# -------------------------------------------------------------------
# shares
#
[webwork]
path = /home/$userv/webwork
browsable =yes
writable = yes
guest ok = no
read only = no
valid users = $userv
# sudo smbpasswd -a $userv
# http://www.cyberciti.biz/tips/how-do-i-set-permissions-to-samba-shares.html
# https://www.howtoforge.com/samba-server-ubuntu-14.04-lts
#
[html]
path = /var/www/html
browsable =yes
writable = yes
guest ok = no
read only = no
valid users = $userv
# sudo smbpasswd -a $userv
# http://www.cyberciti.biz/tips/how-do-i-set-permissions-to-samba-shares.html
# https://www.howtoforge.com/samba-server-ubuntu-14.04-lts
#
[rt]
path = /
browsable =yes
writable = yes
guest ok = no
read only = no
valid users = $userv
# sudo smbpasswd -a $userv
# http://www.cyberciti.biz/tips/how-do-i-set-permissions-to-samba-shares.html
# https://www.howtoforge.com/samba-server-ubuntu-14.04-lts
#
EOF

source shc/21env.sh
sudo smbpasswd -a $userv

sudo sudo service smbd restart

sudo chmod -R 777 /home/$userv/webwork
sudo chmod -R 755 /var/www/html


}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
saynow() {
date
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

saynow
set -x
smb
date

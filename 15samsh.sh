#!/usr/bin/env bash
cd

#note...
#    if this is run more than once, it will duplicate entries...


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# description:
# set samba shares and some linux user settings like immediate history write...


smb() {

source shc/root.sh
source shc/21env.sh


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#alias for ls -la
#
echo "alias lsl='ls -la'" >>   ~/.bash_aliases
cat ~/.bash_aliases



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# write history immediately...
#
# back ticks evaluate date when run...
# http://stackoverflow.com/questions/1859113/append-date-and-time-to-an-environment-variable-in-linux-makefile
nowdg1=`date +'__%Y-%m-%d_%a_%k.%M.%S-%Z'`
sudo cat <<EOF >> /home/$userv/.bashrc
# -------------------------------------------------------------------
# David Gleba $nowdg1
#write history immediately...
#http://askubuntu.com/questions/67283/is-it-possible-to-make-writing-to-bash-history-immediate
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
#
EOF




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
#sudo chmod -R 755 /var/www/html


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

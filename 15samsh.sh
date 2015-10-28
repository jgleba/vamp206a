#!/usr/bin/env bash
cd

#note...
#    if this is run more than once, it will duplicate entries...
#

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# description:
# set samba shares and some linux user settings like immediate history write...



smb() {

source shc/root.sh
source shc/21env.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#if this has run before, then exit...
if [ -f /home/$userv/15ran ]; then
    # 15run exists, so don't run this again. exit.
    echo
    echo "15samsh.sh has run before, don't run again."
    echo
    read -t  19 -p "Hit ENTER or wait about ten seconds" ; echo ;

 else
    echo "run it... 15samsh.sh "
    runsam
 fi

}

function runsam() {

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



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


mkdir webwork
sudo mkdir -p /var/www/html

sudo apt-get -y install samba

#backup server config...
mkdir ~/backup
# backup original file once...
if [ ! -f /etc/samba/smb.conf.orig ] ; then  sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.orig ; fi
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.$(date +"%s").bak
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.$(date +"%Y-%m-%d_%s").bak
sudo cp /etc/samba/smb.conf    ~/backup/smb.conf.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")


## one time fix... sudo cp /etc/samba/smb.conf.bak__2015-10-22_Thu_15.08.24-EDT /etc/samba/smb.conf.orig


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


sudo cat <<EOF >> /etc/samba/smb.conf 

# -------------------------------------------------------------------
# shares
#
[home]
path = /home
browsable =yes
writable = yes
guest ok = no
read only = no
#was this, try without dgleba... valid users = $userv,dgleba,@www
valid users = $userv,@www
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
valid users = $userv,@www
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
valid users = $userv,@www
# sudo smbpasswd -a $userv
# http://www.cyberciti.biz/tips/how-do-i-set-permissions-to-samba-shares.html
# https://www.howtoforge.com/samba-server-ubuntu-14.04-lts
#
EOF


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


source shc/21env.sh
#sudo smbpasswd -a $userv 
(echo $pw1; echo $pw1) | sudo smbpasswd -s -a $userv



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


smbpas () {

# http://stackoverflow.com/questions/12009/piping-password-to-smbpasswd
 echo -ne "p2\np2\n" | sudo smbpasswd -a -s u2
#work...
 echo -ne "$predwe\n$predwe\n" | sudo smbpasswd -a -s $userv
 (echo $pw1; echo $pw1) | sudo smbpasswd -s -a $userv


http://unix.stackexchange.com/questions/204975/script-samba-password-but-securely

pssword="pw"
#IFS= read -r password </home/file.pw1
#smbpasswd -a -s "$LOGIN" <<EOF
sudo smbpasswd -a -s "u3" <<EOF
$pssword
$pssword
EOF

}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




sudo sudo service smbd restart

sudo chmod -R 777 /home/$userv/webwork
#sudo chmod -R 755 /var/www/html


cd
# create 15ran to mark that is has been run. Then don't run it again.
touch /home/$userv/15ran

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

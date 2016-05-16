#!/usr/bin/env bash
cd

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#note...
#    if this is run more than once, it will duplicate entries...
#

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# description:
# set samba shares and some linux user settings like immediate history write...

# put other things to run once here too.


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

smb() {

source shc/root.sh
source shc/21env.sh

#copy the original file backup I made at the beginning so we get a fresh start..
cp /etc/samba/smb.conf.orig /etc/samba/smb.conf

sudo sudo service smbd restart

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
sudo chmod ugo+rw  ~/.bash_aliases
echo "alias psg='ps -ef|grep '" >>   ~/.bash_aliases
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

mkdir -p bin
echo  '#!/usr/bin/env bash' >> ~/bin/blank.sh
chmod +x ~/bin/blank.sh
cat ~/bin/blank.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


sudo mkdir -p /var/www/html

sudo apt-get -y install samba cifs-utils

#backup server config...
mkdir ~/backup
# backup original file once...
if [ ! -f /etc/samba/smb.conf.orig ] ; then  sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.orig ; fi
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bk.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.$(date +"%s").bk
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.$(date +"%Y-%m-%d_%s").bk
sudo cp /etc/samba/smb.conf    ~/backup/smb.conf.bk.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")


## one time fix... sudo cp /etc/samba/smb.conf.bk__2015-10-22_Thu_15.08.24-EDT /etc/samba/smb.conf.orig


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# cat /etc/samba/smb.conf |grep global

# remove line containing  '[global]'  and replace th line completely with the new text...
# add marker line above my edits... 
# add a marker comment like: #David Gleba 2015-10-16... http://stackoverflow.com/questions/11694980/using-sed-insert-a-line-below-or-above-the-pattern
# now replace the line... http://stackoverflow.com/questions/16440377/sed-replace-whole-line-when-match-found
nowdg1=`date +'__%Y-%m-%d_%a_%k.%M.%S-%Z'`
sudo sed -i "/global]/i # \n# David Gleba kdg54 $nowdg1 invalid handle error, add unixextensions=no. see see vamp,samba,error,notes-2016-05-09.txt ...\n#"  /etc/samba/smb.conf 
sudo sed -i 's/.*global].*/[global]\n\nunix extensions = no/g' /etc/samba/smb.conf 



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
valid users = $userv,@www-data
#
[html]
path = /var/www/html
browsable =yes
writable = yes
guest ok = no
read only = no
valid users = $userv,@www-data
#
[rt]
path = /
#due to invalid handle error. add widelinks=yes. see vamp,samba,error,notes-2016-05-09.txt
wide links = yes
browsable =yes
writable = yes
guest ok = no
read only = no
valid users = $userv,@www-data
# sudo smbpasswd -a $userv
# http://www.cyberciti.biz/tips/how-do-i-set-permissions-to-samba-shares.html
# https://www.howtoforge.com/samba-server-ubuntu-14.04-lts
#
EOF


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


source shc/21env.sh
#sudo smbpasswd -a $userv 
# set password silently - answers supplied by script..
(echo $pw1; echo $pw1) | sudo smbpasswd -s -a $userv




#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#2016-05-15
#http://unix.stackexchange.com/questions/214128/samba-specified-network-name-no-longer-available
#Sometimes Samba fails to install or update it's dependencies correctly. Try running the following command to ensure all the dependencies are available, this is on Ubuntu, modify for your Linux flavour:
sudo apt-get -y install --reinstall libsmbclient libsmbclient-dev libtevent0 libtalloc2
#worked!
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


sudo sudo service smbd restart

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cd
# create 15ran to mark that is has been run. Then don't run it again.
touch /home/$userv/15ran

}




set -x
smb
date
#

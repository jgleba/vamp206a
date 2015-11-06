#!/usr/bin/env bash

# add www group and a user

cd
set -x
date
source shc/21env.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sudo groupadd www
sudo chgrp -hR www /var/www/html
sudo chmod -R g+rw  /var/www/html
# make only folders +x so they can be cd into.
sudo find /var/www/html -type d -exec chmod g+x {} +

sudo usermod -a -G adm,dialout,plugdev,sambashare,sudo,www  $userv

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#adduser asks questions and does more...
sudo adduser dgleba --gecos "david gleba,RM,wPhone,hPhone" --disabled-password
echo "dgleba:$pw1" | sudo chpasswd
#sudo useradd -d /home/dgleba -m dgleba
# no home dir... sudo useradd dgleba
#sudo passwd dgleba
sudo usermod -a -G adm,dialout,plugdev,sambashare,www  dgleba
sudo usermod -a -G sudo  dgleba

#sudo smbpasswd -a dgleba
(echo $pw1; echo $pw1) | sudo smbpasswd -s -a dgleba

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#adduser asks questions and does more...
sudo adduser pmdsu --gecos "pmds user,0,0,0" --disabled-password
echo "pmdsu:$pw1" | sudo chpasswd
#add user to group www
sudo usermod -a -G www  pmdsu

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#adduser asks questions and does more...
sudo adduser dclark --gecos "pmds user,0,0,0" --disabled-password
echo "dclark:dave" | sudo chpasswd
#add user to group www
sudo usermod -a -G www  dclark
(echo $pw1; echo $pw1) | sudo smbpasswd -s -a dclark

#adduser asks questions and does more...
sudo adduser cstrutton --gecos "pmds user,0,0,0" --disabled-password
echo "cstrutton:dri239se" | sudo chpasswd
#add user to group www
sudo usermod -a -G www  cstrutton
(echo dri239se; echo dri239se) | sudo smbpasswd -s -a cstrutton

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# add user. use env variable for password. 

pwnu1="abop"
echo $pwnu1
#adduser asks questions and does more...
sudo adduser dg2 --gecos "pmds user,0,0,0" --disabled-password
echo "dg2:$pwnu1" | sudo chpasswd
#add user to group www
sudo usermod -a -G www  dg2
(echo "$pwnu1"; echo "$pwnu1") | sudo smbpasswd -s -a dg2


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#add user to upload files by ftp...
sudo adduser ftpup --gecos "ftp uploader user,0,0,0" --disabled-password
echo "ftpup:ftp" | sudo chpasswd
sudo mkdir /home/ftpup/upload
sudo chmod 755 -R /home/ftpup/upload

#--------
#
#  trying @www group for valid users. 2015-10-23_Fri_10.16-AM
#
# edit /etc/samba/smb.conf to add dgleba
# like...  valid users = $userv,dgleba
# http://stackoverflow.com/questions/9591744/add-to-the-end-of-a-line-containing-a-pattern-with-sed-or-awk
# https://www.samba.org/samba/docs/using_samba/ch09.html


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sudo sudo service smbd restart

groups
groups dgleba
id dgleba


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#http://askubuntu.com/questions/410244/a-command-to-list-all-users-and-how-to-add-delete-modify-users
#
# sudo deluser dgleba sudo
#
#https://help.ubuntu.com/community/FilePermissions
#chmod ugo+rwx file4
#


offline()
{

# begin block comment =============================
: <<'END'
exit 999

:stuff to manage user on windows...

net use \\VAMP206B\ /delete

net use \\pmdsdata3\ /delete

net use * /delete

:net use \\SERVER * /user:username
net use \\vamp206b * /user:dgleba
net use \\pmdsdata3 * /user:dgleba


http://superuser.com/questions/123833/how-do-i-change-the-user-i-am-logged-in-with-on-a-network-share
net use \\SERVER * /user:username
net use \\pmdsdata3 * /user:albe
***  error..........     System error 1219 has occurred.

rundll32.exe keymgr.dll, KRShowKeyMgr

END
# end block comment ===============================
}
#
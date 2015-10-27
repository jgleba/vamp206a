#!/usr/bin/env bash

# add www group and a user

cd
set -x
date

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sudo groupadd www
sudo chgrp -hR www /var/www/html
sudo chmod -R g+rw  /var/www/html
# make only folders +x so they can be cd into.
sudo find /var/www/html -type d -exec chmod g+x {} +

sudo usermod -a -G adm,dialout,plugdev,sambashare,sudo,www  $userv

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#adduser asks questions and does more...
sudo adduser dgleba
#sudo useradd -d /home/dgleba -m dgleba
# no home dir... sudo useradd dgleba
#sudo passwd dgleba
sudo usermod -a -G adm,dialout,plugdev,sambashare,www  dgleba
sudo smbpasswd -a dgleba

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#adduser asks questions and does more...
sudo adduser pmdsu
#sudo useradd -d /home/pmdsu -m pmdsu
# no home dir... sudo useradd pmdsu
#sudo passwd pmdsu
#add user to group www
sudo usermod -a -G www  pmdsu
#or
sudo gpasswd -a pmdsu www
#sudo smbpasswd -a pmdsu

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#add user to upload files by ftp...
sudo adduser ftpup


#--------
#
#  trying @www group for valid users. 2015-10-23_Fri_10.16-AM
#
# edit /etc/samba/smb.conf to add dgleba
# like...  valid users = $userv,dgleba
# http://stackoverflow.com/questions/9591744/add-to-the-end-of-a-line-containing-a-pattern-with-sed-or-awk
#  https://www.samba.org/samba/docs/using_samba/ch09.html


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

exit 999

:stuff to manage user on windows...

net use \\VAMP206B\ /delete
net use * /delete

:net use \\SERVER * /user:username
net use \\vamp206b * /user:dgleba

}
#
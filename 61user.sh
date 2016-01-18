#!/usr/bin/env bash

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#  notes:

# use nuser.sh to add a user...



# yes: use www-data group, don't:  add www group and a user


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


cd
set -x
date
source shc/21env.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# set access to html files here..  [chmod chown chgrp]
# sudo groupadd www  # just use www-data group
# sudo chgrp -hR www /var/www/html
# chown and chgrp the html files appropriately.. chgrp -hR www-data /var/www/html
sudo chgrp -hR www-data /var/www/html
sudo chown -R root /var/www/html
sudo chmod -R g+rw  /var/www/html
sudo chmod -R o-rw /var/www/html
# make only folders +x so they can be cd into.
sudo find /var/www/html -type d -exec chmod g+x {} +


sudo usermod -a -G adm,dialout,plugdev,sambashare,sudo  $userv
sudo usermod -a -G www-data  $userv


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#adduser asks questions and does more...
sudo adduser dgleba --gecos "david gleba,RM,wPhone,hPhone" --disabled-password
echo "dgleba:$pw1" | sudo chpasswd
#sudo useradd -d /home/dgleba -m dgleba
# no home dir... sudo useradd dgleba
#sudo passwd dgleba
sudo usermod -a -G adm,dialout,plugdev,sambashare,www-data dgleba
#sudo usermod -a -G sudo  dgleba

#sudo smbpasswd -a dgleba
(echo $pw1; echo $pw1) | sudo smbpasswd -s -a dgleba

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#adduser asks questions and does more...
sudo adduser pmdsu --gecos "pmds user,0,0,0" --disabled-password
echo "pmdsu:$pw1" | sudo chpasswd
#add user to group www
sudo usermod -a -G www-data  pmdsu

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#   see nuser.sh

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


# allow users to reload apache without root access...
#       service apache2 reload
sudo tee /etc/sudoers.d/apache2reload <<EOF
username    ALL=NOPASSWD:/usr/bin/service apache2 reload
EOF

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sudo sudo service smbd restart

groups
groups dgleba
id dgleba

groups
groups $userv
id $userv


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#http://askubuntu.com/questions/410244/a-command-to-list-all-users-and-how-to-add-delete-modify-users
#
# sudo deluser dg5
# sudo rm -r dg5
# delete user and home directory... sudo deluser --remove-home dg2
# list groups...   sudo cat /etc/group

# disable..    sudo passwd -l user
#
#https://help.ubuntu.com/community/FilePermissions
#chmod ugo+rwx file4
#
# list  all  users
#To get a list of all users you type (as users are listed in /etc/passwd)
#  getent passwd
#    cut -d: -f1 /etc/passwd


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

worked:
rundll32.exe keymgr.dll, KRShowKeyMgr

not-worked?:
Control panel - User Accounts and Family Safety.
(Click your image in the start menu, or navigate through control panel).
In the left hand side panel, select Manage your credentials.
Under Windows Credentials:
maybe...
delete the credential for the computer with the smb share...
logout and log back in?

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# remove user from a group
#       sudo gpasswd -d username group
sudo gpasswd -d dgleba sudo
sudo gpasswd -d dclark sudo
sudo gpasswd -d cstrutton sudo

# list sudoers..
grep -Po '^sudo.+:\K.*$' /etc/group


noworky... usermod -R "group" "user name"
    usermod -R sudo dgleba


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



END
# end block comment ===============================
}
#
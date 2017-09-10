#!/usr/bin/env bash

cd
source shc/21env.sh


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# make directories.
# html
sudo mkdir -p /var/www/html

#
# make tempfiles folder writable. This is used with cilist, tnlist and others to write excel files and mail them..
#
sudo mkdir -p /tmp01/tempfiles
sudo chmod -R 700 tmp01
sudo chmod -R 700 /tmp01/tempfiles
sudo chown -R $userv  tmp01 

sudo mkdir -p /var/www/tempfilesdg
sudo chmod -R 777 /var/www/tempfilesdg

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cd /home/$userv/tmp01

if [ ! -f htdocs.pmdsdata3.latest.7z ] ; then
  cp /home/$userv/shc/htdocs-sample-data/htdocs-sample_mv_to__htdocs.pmdsdata3.latest.7z  /home/$userv/tmp01/htdocs.pmdsdata3.latest.7z
  cd /home/$userv/tmp01
  sudo rm -rf html
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# delete this html if you want to get new files...
if  [ ! -d html ] ; then
  cd /home/$userv/tmp01
  #sudo rm -rf html
  read -t 10 -p "Hit ENTER or wait about ten seconds" ; echo ;
  #source ~/shc/21env.sh
  cd /home/$userv/tmp01
  7z x /home/$userv/tmp01/htdocs.pmdsdata3.latest.7z
  sudo rsync -vrltgoD /home/$userv/tmp01/html/  /var/www/html
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

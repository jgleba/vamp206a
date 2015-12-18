#!/usr/bin/env bash
cd
# echo off
set +vx
# echo on
set -vx
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# netbeans and git cola git eye install..

sudo apt-get update

#https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get

sudo apt-get install default-jdk

cd tmp01
sudo su -
#wget http://download.netbeans.org/netbeans/8.1/final/bundles/netbeans-8.1-php-linux.sh
 wget  http://download.netbeans.org/netbeans/8.1/final/bundles/netbeans-8.1-php-linux-x64.sh


chmod +x netbeans-8.1-php-linux-x64.sh
sh netbeans-8.1-php-linux-x64.sh


sudo apt-get install git-cola
#I think it works, but it is basic. I switched to giteye - more like sourcetree.

#https://www.open.collab.net/nonav/downloads/giteye/thankyou.html?_=d
http://www.collab.net/downloads/giteye
download git eye
unpack it and put it in 
/home/albe/bin/giteye
chmod +x ./GitEye
.GitEye
works well.



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function offline()
{
exit 999

# begin block comment =============================
: <<'END'



END
# end block comment ===============================

}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#
date
#


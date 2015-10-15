#!/usr/bin/env bash
set -x
source shc/21env.sh

sudo chmod -R 777 tmp
sudo mkdir -p /var/www/html

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#get webroot code 

cd /home/$userv/tmp
curl -O -u vagrant:vagrant ftp://10.4.10.254//var/varvamp/files/vne.sh

sudo cat vne.sh > /home/$userv/shc/21env.sh
sudo chmod -R 777 /home/$userv/shc/21env.sh

if [ ! -f htdocs.PMDS-DATA.latest.7z ]; then
    curl -O -u vagrant:vagrant ftp://10.4.10.254//var/varvamp/files/htdocs.PMDS-DATA.latest.7z
    7z x htdocs.PMDS-DATA.latest.7z
    sudo mkdir -p /var/www/html
    sudo rsync -av /home/$userv/tmp/htdocs/  /var/www/html
    sudo chmod -R 755 /var/www/html 
fi

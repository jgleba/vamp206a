#!/usr/bin/env bash
set -x
source shc/12env.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#get webroot code 

#rsync -av  10.4.10.243:/htdocs/ /var/www/html
#
# copy it over to webwork rename it and extract.
cd ~/tmp

#curl -u "domain\username:passwd" smb://server.example.com/share/file.txt
curl -u "stackpole\dgleba:x" smb://10.4.10.243/htdocs/index.html
curl -u "dg:h" smb://192.168.88.92/htdocs/index.html
curl: (1) Protocol smb not supported or disabled in libcurl

noworks:
smbget -u dg -p h  smb://192.168.88.92/htdocs/index.html
works:
cd tmp
#smbget -u dg -p h  smb://redwe/htdocs/index.html
smbget -u dg -p h  smb://REDWE\var\varvamp\files\htdocs-latest.7z


7z x htdocs.7z
rsync -av ~/tmp/htdocs/ /var/www/html
chmod -R 755 /var/www/html 



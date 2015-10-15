exit 9
sleep 999
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2015-10-15[Oct-Thu]09-02AM

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

cd /home/$userv/tmp
#curl --digest --user dgleba https://bitbucket.org/dgleba/vamp198e/get/master.zip -o vamp198e.zip
smbget -u dg -p h  smb://REDWE\var\varvamp\files\htdocs-latest.7z
smbget -u=DG -p=h -w=WORKGROUP smb://REDWE/var/varvamp/files/vne.sh



curl -O -u vagrant:vagrant ftp://192.168.3.6/var/varvamp/files/vne.sh
curl  -O -u vagrant:vagrant ftp://10.4.10.241//home/vagrant/configv1.sh
#curl ftp://192.168.3.6/ -u david:dave -T /var/varvamp/files/htdocs.PMDS-DATA.latest.7z

7z x htdocs.7z
rsync -av ~/tmp/htdocs/ /var/www/html
chmod -R 755 /var/www/html 

curl  -O -u vagrant:vagrant ftp://10.4.10.241//home/vagrant/configv1.sh
curl  -O -u vagrant:vagrant ftp://192.168.3.6//home/vagrant/configv1.sh
curl -O -u vagrant:vagrant ftp://192.168.3.6//var/varvamp/files/vne.sh



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


offlinestuff()  {
#exit 8
echo offline
}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2015-10-11[Oct-Sun]12-39PM



#get the repo to a folder
cd 
wget -N https://codeload.github.com/dgleba/vamp203/zip/master
#unzip [ -j junk paths - all in one folder ]  
#rm -rf shc
# unzip one folder...  unzip  ~/share203/master vamp203-master/hyperv/* -d ./sh
# unzip to destination.. unzip ~/share203/master -d ./sh
unzip -u ./master
cp -a vamp203-master shc
# make files executable recursively
chmod -R 755 ./shc
chmod -R +x ./shc
cd 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

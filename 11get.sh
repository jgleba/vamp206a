#!/usr/bin/env bash
set -x

get1()
{

#get a few software to help get things started...
apt-get -y install openssh-server 
apt-get -y install unzip 
apt-get -y install mc
apt-get -y install locate
sudo apt-get -y install p7zip-full
sudo apt-get -y install smbclient

# get zip of repo from github
cd 
rm -rf shc

read -t 10 -p "Hit ENTER or wait ten seconds" ; echo ;
read -t 10 -p "Hit ENTER or wait ten seconds" ; echo ;

mkdir -p tmp
cd tmp
wget -N https://codeload.github.com/dgleba/vamp206a/zip/master 
#unzip [ -j junk paths - all in one folder ] 

# unzip one folder...  unzip  ~/share203/master vamp206a-master/hyperv/* -d ./sh
# unzip to destination.. unzip ~/share203/master -d ./sh
unzip -uo ./master
mkdir ~/shc
cp -avf vamp206a-master/* ~/shc/
cd
cd shc
#hmm not sure this is just files with no extension..
#find -type f -not -name "*.*" -exec chmod +x \{\} \;
#no working..
#chmod -R +x *.sh
# make files executable recursively
#find . -type f -exec chmod +x {} \;
sudo chown -R albe ~/shc
sudo chmod -R 777 .
sudo chmod -R  +x .
updatedb
cd
}

cd ~/tmp
#curl --digest --user dgleba https://bitbucket.org/dgleba/vamp198e/get/master.zip -o vamp198e.zip
smbget -u dg -p h  smb://REDWE\var\varvamp\files\htdocs-latest.7z
smbget -u=DG -p=h -w=WORKGROUP smb://REDWE/var/varvamp/files/vne.sh



#get the repo and call the script that calls all others
get1
set -e
echo "edit variables like username and passwords..  nano shc/14call.sh \n"
echo "ctrl-o to write the file,  ctrl-x to exit editor.\n"
echo "now run: sudo ./14call.sh\n\n"


#!/usr/bin/env bash

#
# edit below username albe if needed.
#

get1()
{
set -x
cd


#get a few software to help get things started...
sudo apt-get -y install openssh-server 
sudo apt-get -y install p7zip-full
sudo apt-get -y install unzip 
sudo apt-get -y install mc
sudo apt-get -y install locate

# get zip of repo from github
sudo rm -rf shc

read -t  19 -p "Hit ENTER or wait about ten seconds" ; echo ;

mkdir -p tmp
sudo chmod -R 777 tmp

cd tmp
wget -N --output-document=vamp206a-mast.zip https://codeload.github.com/dgleba/vamp206a/zip/master 
#unzip [ -j junk paths - all in one folder ] 

# unzip one folder...  unzip  ~/share203/master vamp206a-master/hyperv/* -d ./sh
# unzip to destination.. unzip ~/share203/master -d ./sh
unzip -uo ./vamp206a-mast.zip
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
sudo chown -R albe /home/albe/shc
sudo chmod -R 777 .
sudo chmod -R  +x .
sudo updatedb
cd
}



#get the repo and call the script that calls all others
get1
set -e
echo "edit variables like username and passwords..  nano shc/14call.sh \n"
echo "ctrl-o to write the file,  ctrl-x to exit editor.\n"
echo "now run: sudo ./14call.sh\n\n"


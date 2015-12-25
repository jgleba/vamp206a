#!/usr/bin/env bash

#
# edit below username if needed - I used albe.
#

get1()
{
set -x
cd
#make user's bin folder so scripts can be run from there in the path
mkdir -p bin

userv11=$USER
echo $userv11

#get a few software to help get things started...   # moved to netson.seed
#sudo apt-get update
#sudo apt-get -y install openssh-server 
#sudo apt-get -y install p7zip-full
#sudo apt-get -y install unzip 
#sudo apt-get -y install mc
#sudo apt-get -y install locate
sudo apt-get -y install curl libcurl3 libcurl3-dev php5-curl

# get zip of repo from github
sudo rm -rf shc

read -t  5 -p "Hit ENTER or wait some seconds" ; echo ;

mkdir -p tmp01
sudo chmod -R 777 tmp01

cd tmp01
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
#2015-10-27_Tue_09.58-AM.. sudo chown -R albe /home/albe/shc
sudo chmod -R 777 .
sudo chmod -R  +x .
#sudo updatedb
cd

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#add home bin directory. it will be added to the path if it exists -- in debian.
#http://askubuntu.com/questions/402353/how-to-add-home-username-bin-to-path

mkdir -p bin

if [  -f "/home/$userv11/shc/21env.sh" ]; then
    # 21env.sh exists, so don't copy over top.
    echo
    echo "shc/21env.sh exists, we won't copy over..."
    echo userv11 = $userv11
    echo
    read -t  19 -p "Hit ENTER or wait about ten seconds" ; echo ;

 else
    cp shc/21env-example.sh shc/21env.sh
 fi

#Copy vne.sh over top. it won't copy if it isn't there.
cp tmp01/vne.sh shc/21env.sh


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


}



#get the repo and call the script that calls all others
get1
set +vx
echo "edit variables like username and passwords..  nano shc/21env.sh"
echo "ctrl-o to write the file,  ctrl-x to exit editor."
echo "now run:   sudo shc/24start.sh "

#source sudo will not work. cannot use an excecutable. must be source shc/24start.sh. run sudo ./11get.sh
#source shc/24start.sh

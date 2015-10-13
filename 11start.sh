#!/bin/bash
set -x

get1()
{
# get zip of repo from github
cd 
mkdir -p tmp
cd tmp
wget -N https://codeload.github.com/dgleba/vamp206a/zip/master 
#unzip [ -j junk paths - all in one folder ] 
#rm -rf shc
# unzip one folder...  unzip  ~/share203/master vamp206a-master/hyperv/* -d ./sh
# unzip to destination.. unzip ~/share203/master -d ./sh
unzip -u ./master
cp -a vamp206a-master ~/shc
cd shc
#hmm not sure this is just files with no extension..
#find -type f -not -name "*.*" -exec chmod +x \{\} \;
#no working..
#chmod -R +x *.sh
# make files executable recursively
#find . -type f -exec chmod +x {} \;
chmod -R 755 ./shc
chmod -R +x ./shc

}


#get the repo and call the script that calls all others
get1

echo "edit variables like username and passwords..  nano shc/14call.sh \n"
echo "ctrl-o to write the file,  ctrl-x to exit editor.\n"
echo "now run: sudo ./14call.sh\n\n"


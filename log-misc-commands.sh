exit 9
sleep 999
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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

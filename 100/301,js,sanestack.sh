#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  Install javascript stack(s)


http://askubuntu.com/questions/594656/how-to-install-the-latest-versions-of-nodejs-and-npm-for-ubuntu-14-04-lts


http://stackoverflow.com/questions/32426601/completly-uninstall-nodejs-npm-and-node-in-ubuntu-14-04
I would recommend installing node using Node Version Manager(NVM). That saved a lot of head ache for me. Because you can install nodejs and npm without sudo using nvm.


https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04-server

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#
# Main: put code here...

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sudo ls

# remove it...
 npm uninstall -g sails 
 npm uninstall -g ember-cli 
 npm uninstall -g sane-cli 
# remove...
sudo npm uninstall -g sails 
sudo npm uninstall -g ember-cli 
sudo npm uninstall -g sane-cli 
sudo apt-get remove nodejs
sudo apt-get remove npm
sudo apt-get update
sudo apt-get autoremove

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#install nvm
# i didn't use nvm...
sudo apt-get -y install build-essential libssl-dev
#You should check the GitHub project page for the latest release of NVM, 
#   https://github.com/creationix/nvm/releases
#      edit v0.31.0 .....
curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
source ~/.profile
nvm --version
#http://www.liquidweb.com/kb/how-to-install-nvm-node-version-manager-for-node-js-on-ubuntu-14-04-lts/


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#worked...

#http://sailsjs.org/get-started
sudo apt-get install python-software-properties python g++ make
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# i didn't use 5.x...
#curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
#sudo apt-get install -y nodejs

#already there, no need... sudo apt-get install npm


#nonoworks:
#sudo npm install -g node 

npm install -g sails 
#sudo npm install -g ember-cli 
npm install -g sane-cli 


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
date
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



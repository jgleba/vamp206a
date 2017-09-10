#!/usr/bin/env bash
cd
source shc/21env.sh
set -x


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# purpose:

# 24start.sh  = yes web files,  yes gui.



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# edit the variables in 21env.sh to match your system...
#


set +vx
echo
echo
echo 24start.sh will commence...
echo
read -t  999 -p "Hit ENTER or wait about 900 seconds" ; echo ;
set -vx


#comment this out for full auto run...
#exit 0

cd
source shc/root.sh
cd
source shc/15samsh.sh
cd
# use this to get specific data file..
# source shc/17docs.sh

# use this for sample data in the repo..
  source shc/17docs_sample.sh

cd
source shc/31base.sh
cd
source shc/34samm.sh
cd
source shc/43apach.sh
cd
source shc/47guestad.sh
cd
source shc/62grpshare.sh
source shc/62srvweb.sh
cd
source shc/51dj.sh
cd
source shc/53imp.sh
cd
source shc/61user.sh
cd

source shc/63bauth.sh
cd
source shc/65cron.sh
cd

# see 70gui-notes.sh  - use xfce4

# source shc/71gui.sh
cd
# source shc/73lxset.sh
cd
# source shc/100/321lxdeborderresize.sh
cd
#source shc/67hostn.sh
cd


#read -t  99 -p "Hit ENTER or wait about 99 seconds" ; echo ;

echo "DONE...  "
echo "  run this without sudo...  "
echo "     shc/rails/railins.sh  "
echo "  Then this with sudo...  "
echo "     sudo shc/67hostn.sh  "
echo " "
echo "Please reboot after that to get new hostname etc....  "
#reboot

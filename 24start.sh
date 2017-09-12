#!/usr/bin/env bash
echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, "$0" $(date +"__%Y-%m-%d_%H.%M.%S")

cd
source shc/21env.sh
set -x


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# purpose:

# 24start.sh  setup the server



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
export setuplogfile1="/home/$userv/vamp206_setup.log"

#comment this out for full auto run...
#exit 0

cd
source shc/root.sh >>$setuplogfile12<&1
cd
source shc/15samsh.sh >>$setuplogfile12<&1

cd
# use this to get specific data file..
# source shc/17docs.sh
#
# use this for sample data in the repo..
source shc/17docs_sample.sh >>$setuplogfile12<&1

cd
source shc/31base.sh >>$setuplogfile12<&1
cd
source shc/34samm.sh >>$setuplogfile12<&1
cd
source shc/43apach.sh >>$setuplogfile12<&1
cd
source shc/47guestad.sh >>$setuplogfile12<&1
cd
source shc/62grpshare.sh >>$setuplogfile12<&1
source shc/62srvweb.sh >>$setuplogfile12<&1
cd
source shc/51dj.sh >>$setuplogfile12<&1
cd
source shc/53imp.sh >>$setuplogfile12<&1
cd
source shc/61user.sh >>$setuplogfile12<&1
cd

source shc/63bauth.sh >>$setuplogfile12<&1
cd
source shc/65cron.sh >>$setuplogfile12<&1
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

# set all files owner and group in home to $userv  
cd
sudo chown -R $userv:$userv . >>$setuplogfile12<&1


set +vx

echo "DONE...  "
echo "  run this without sudo...  "
echo "     shc/rails/railins.sh  "
echo "  Then this with sudo...  "
echo "     sudo shc/67hostn.sh  "
echo " "
echo "Please reboot after that to get new hostname etc....  "
#reboot
echo ~----------~----------end $HOSTNAME, pwd: `pwd`, "$0" $(date +"__%Y-%m-%d_%H.%M.%S")

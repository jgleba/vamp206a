#!/usr/bin/env bash
set -x
cd

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# edit these variables to match your system...
#
source shc/21env.sh


#comment this out for full auto run...
#exit 0

source shc/12docs.sh
cd
source shc/root.sh
cd
#don't run more than once. source shc/15samsh.sh
cd
source shc/31base.sh
cd
source shc/34samm.sh
cd
source shc/43apach.sh
cd
#source shc/47guestad.sh
cd
source shc/51dj.sh
cd
source shc/53imp.sh
cd
source shc/61user.sh

read -t  99 -p "Hit ENTER or wait about 99 seconds" ; echo ;


echo " DONE; rebooting ... "
reboot

#!/usr/bin/env bash
set -x
cd

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# edit these variables to match your system...
#
source shc/21env.sh


#comment this out for full auto run...
#exit 0

source shc/root.sh
source shc/15samsh.sh
source shc/17docs.sh
source shc/31base.sh
source shc/34samm.sh
source shc/43apach.sh
#source shc/47guestad.sh
source shc/51dj.sh
source shc/53imp.sh
source shc/61user.sh
source shc/63bauth.sh
source shc/65cron.sh
source shc/67hostn.sh

read -t  99 -p "Hit ENTER or wait about 99 seconds" ; echo ;


echo " DONE; Please reboot...  "
#reboot

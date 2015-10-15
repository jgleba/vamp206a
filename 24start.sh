#!/usr/bin/env bash
set -x

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# edit these variables to match your system...
#
source shc/12env.sh


#comment this out for full auto run...
#exit 0

source shc/15root.sh
cd
source shc/16samm.sh
cd
source shc/21base.sh
cd
source shc/25samsh.sh
cd
source shc/27apach.sh
cd
source shc/31guestad.sh
cd
source shc/41dj.sh
cd
source shc/43imp.sh

sleep 22

echo " DONE; rebooting ... "
reboot

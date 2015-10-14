#!/bin/bash
set -x

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# edit these variables to match your system...
#
cd
mkdir -p _this-vamp206b

#default_hostname="$(nhostname)"
#userv="albe"
userv=$USER

default_hostname="vamp206b"
default_domain="local"

mysqlrootpassw="x"
mysqluserpass="x"

#windows machine red5a settings.
uredwe="dg"
predwe="h"


mkdir -p tmp
tmp="/home/$userv/tmp"


#comment this out for full auto run...
#exit 0

source shc/15root.sh
cd
source shc/21base.sh
cd
source shc/23samm.sh
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

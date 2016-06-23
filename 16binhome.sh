#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  create scripts in home/bin for ease of use 

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#
# Main: put code here...
source shc/21env.sh

mkdir -p /home/$userv/bin
mkdir -p /home/$userv/backup

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cp /home/$userv/bin/tarc /home/$userv/backup/tarc.$(date +"__%Y.%m.%d_%H.%M.%S").bk

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#
cat <<EOF >> /home/$userv/bin/ifrs
###### restart network eth0..
sudo ifdown eth0 && sudo ifup eth0
EOF
#
chmod +x /home/$userv/bin/ifrs

#
cat <<EOF >> /root/bin/ifrs
###### restart network eth0..
sudo ifdown eth0 && sudo ifup eth0
EOF
#
chmod +x /root/bin/ifrs

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cp -rf shc/bin/* /home/$userv/bin
chmod +x /home/$userv/bin/*


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



#
date
#

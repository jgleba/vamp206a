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
#
cat <<EOF >> /home/$userv/bin/tarc
###### tar current folder..
base1=$(basename $PWD);export HOSTNAME;cd ..
tar -czf $base1-$HOSTNAME$(date +"__%Y.%m.%d_%H.%M.%S").tgz  $base1 --exclude=$base1/tmp --exclude=$base1/vendor/assets/javascripts;cd $base1
EOF
#
chmod +x /home/$userv/bin/tarc

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



#
date
#

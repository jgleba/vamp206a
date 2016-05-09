#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  tar the current folder and give the archive a useful name..

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#cd ; 
date ; set +vx  ; set -vx ; # echo off, then echo on
#

# Main: put code here...

###### tar current folder..
base=$(basename $PWD);export HOSTNAME;cd ..
tar -czf $base-$HOSTNAME$(date +"__%Y.%m.%d_%H.%M.%S").tgz  $base --exclude=$base/tmp --exclude=$base/vendor/assets/javascripts;cd $base


#
date
#

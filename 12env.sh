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


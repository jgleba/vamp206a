#!/usr/bin/env bash
set -x

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# edit these variables to match your system...
#
cd
mkdir -p _this-vamp206b

#default_hostname="$(nhostname)"
export userv="albe"
#this stores root not the regular user.
#userv=$USER

export default_hostname="vamp206b"
export default_domain="local"

export mysqlrootpassw="x"
export mysqluserpass="x"

#windows machine red5a settings.
export uredwe="dg"
export predwe="h"

#windows machine red5a settings.
export u3hz="dlgeba"
export p3hz="h"


mkdir -p tmp
tmp="/home/$userv/tmp"


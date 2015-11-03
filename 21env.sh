#
#set -x

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# edit these variables to match your system...
#

export userv="albe"
#this stores root not the regular user.
#userv=$USER

#user for automated emails
export user2="pmdsu"

#hostname from unattended iso...
export orig_hostname="vamp206b"
# new hostname..
export default_hostname="pmdsdata3"
export default_domain="local"

export mysqlrootpassw="x"
export mysqluserpass="x"

#windows machine red5a settings.
export uredwe="dg"
export predwe="h"

#windows machine red5a settings.
export u3hz="dlgeba"
export p3hz="h"

export pw1="a"
export pw2="p"

mkdir -p tmp
tmp="/home/$userv/tmp"

mkdir -p  /home/$userv/_this-vamp206b

# determine ubuntu version
export ubuntu_versiona=$(lsb_release -sc)
export ubuntu_versionb="$(lsb_release -sa)"

export -p


function offline() {
exit 9
albe@vamp206b:~$ #sudo echo $HOME
/home/albe
albe@vamp206b:~$ 
}


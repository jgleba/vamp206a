#
#set -x

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# edit these variables to match your system...
#

export userv="albe"

#user for automated emails
export user2="pmdsu"

#this stores root not the regular user.
#userv=$USER

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


mkdir -p tmp
tmp="/home/$userv/tmp"

mkdir -p  /home/$userv/_this-vamp206b


function offline() {
exit 9
albe@vamp206b:~$ #sudo echo $HOME
/home/albe
albe@vamp206b:~$ 
}
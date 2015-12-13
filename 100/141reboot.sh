#!/usr/bin/env bash
cd
# echo off
set +vx
# echo on
set -vx
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function stopvb(){
    su -c "VBoxManage controlvm thevm acpipowerbutton" -s /bin/bash theuser
    while [ "`su -c 'VBoxManage list runningvms' -s /bin/bash theuser`" != "" ]
    do
        echo waiting for VMs to shutdown
        sleep 4
    done
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function offline()
{
exit 999
# begin block comment =============================
: <<'END'
comment content
ls
END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#main...

# halt all vagrant machines...
sudo vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant halt $line; done;
read -t  345 -p "Hit ENTER or wait some seconds" ; echo ;

stopvb
read -t  995 -p "Hit ENTER or wait some seconds" ; echo ;

#restart reboot the system...
sudo shutdown -r now

#
date
#


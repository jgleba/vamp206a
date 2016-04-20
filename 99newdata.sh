#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
source shc/21env.sh
#
# Main: put code here...




#start ftp server in windows to make files available...

cd
rm tmp01/htdocs.PMDS-DATA.latest.7z

source shc/11get.sh
cd
source shc/17docs.sh
cd
source shc/53imp.sh
cd
source shc/flask/cif207.sh
cd
source shc/flask/pdb218.sh
cd
source shc/52-v/52vh920.sh
cd
source shc/52-v/52vh923.sh



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# set access to html files here..  [chmod chown chgrp]
# chown and chgrp the html files appropriately.. chgrp -hR www-data /var/www/html
sudo chown -R root /var/www/html
sudo chgrp -hR www-data /var/www/html
# also set the group sticky bit, so that the group is set for new files created. chmod g+s /home/shared – jris198944 May 13 '14 at 8:43 
sudo chmod -R g+rws  /var/www/html
sudo chmod -R o-rw /var/www/html
# make only folders +x so they can be cd into.
sudo find /var/www/html -type d -exec chmod g+x {} +


#
date
#

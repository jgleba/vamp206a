#!/usr/bin/env bash

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# was 67hostn.sh --   5/9/2016

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cd
set -vx
source shc/21env.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# backup hosts settings...
#
#sudo cp /etc/hosts /etc/hosts.bk.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
#sudo cp /etc/hosts /etc/hosts.$(date +"%s").bk
sudo cp /etc/hosts /etc/hosts.$(date "+%Y-%m-%d_%s").bk
sudo cp /etc/hostname /etc/hostname.$(date "+%Y-%m-%d_%s").bk

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#why do this stuff again ? Yes, do it.
# I think it is a good idea to set the hostname. I may have used an older .iso file with an older hostname.
#
#try deleting the host lines and add new ones. http://stackoverflow.com/questions/5410757/delete-a-line-containing-a-specific-string-using-sed

# set fqdn
fqdn="$default_hostname.$default_domain"
# update hostname
#sudo echo "$default_hostname" > /etc/hostname
sudo echo $default_hostname | sudo tee /etc/hostname
cat /etc/hostname
#_____________
#this was problematic... see next stanza
#sudo sed -i "s@ubuntu.ubuntu@$fqdn@g" /etc/hosts
#sudo sed -i "s@vamp206b.vamp206b@$fqdn  @g" /etc/hosts
#sudo sed -i "s@ubuntu@$default_hostname@g" /etc/hosts
#sudo sed -i "s@vamp206b@ $default_hostname @g" /etc/hosts
#hostname "$default_hostname"
#_____________
# remove line containing  'vamp206b'  and replace the line completely with the new text...
# add marker line above my edits... # add a marker comment like: #David Gleba 2015-10-16... http://stackoverflow.com/questions/11694980/using-sed-insert-a-line-below-or-above-the-pattern
# now replace the line... http://stackoverflow.com/questions/16440377/sed-replace-whole-line-when-match-found
nowdg1=`date +'__%Y-%m-%d_%a_%k.%M.%S-%Z'`
sudo sed -i "/$orig_hostname/i # \n# David Gleba kdg54 $nowdg1 ...\n#"  /etc/hosts
#Use double quotes to make the shell expand variables while keeping whitespace:
sudo sed -i "s/.*$orig_hostname.*/127.0.0.1 $default_hostname.$default_domain $default_hostname/g" /etc/hosts
cat /etc/hosts


# why does initial ubuntu  hosts file have "127.0.1.1 ubuntu"  ?
# note the 1.1


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function inforef()
{
exit 999
=======
function info()
{
exit 999

}
#
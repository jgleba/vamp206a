#!/usr/bin/env bash
set -x
cd
source shc/21env.sh


# determine ubuntu version
ubuntu_version=$(lsb_release -cs)

# check for interactive shell
if ! grep -q "noninteractive" /proc/cmdline ; then
    stty sane

#  ask questions
#    read -ep " please enter the username you are currently logged in as: " -i "$userv" userv
#    read -ep " please enter your preferred hostname: " -i "$default_hostname" hostname
#    read -ep " please enter your preferred domain: " -i "$default_domain" domain
  
fi

# print status message
echo " preparing your server; this may take a few minutes ..."


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# backup hosts settings...

#
sudo cp /etc/hosts /etc/hosts.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
sudo cp /etc/hosts /etc/hosts.$(date +"%s").bak
sudo cp /etc/hostname /etc/hostname.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#why do this stuff again ?
# I think it is a good idea to set the hostname. I may have used an older .iso file with an older hostname.
#
#try deleting the host lines and add new ones. http://stackoverflow.com/questions/5410757/delete-a-line-containing-a-specific-string-using-sed

# set fqdn
fqdn="$default_hostname.$default_domain"
# update hostname
#sudo echo "$default_hostname" > /etc/hostname
echo $default_hostname | sudo tee /etc/hostname
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
sudo sed -i "s/.*$orig_hostname.*/127.0.1.1 $fqdn $default_hostname/g" /etc/hosts
cat /etc/hosts

# update repos
apt-get -y update 
# update / upgrade
#apt-get -y upgrade > /dev/null 2>&1
#apt-get -y dist-upgrade > /dev/null 2>&1
#sudo apt-get update
#sudo apt-get -y upgrade
apt-get -y autoremove 
apt-get -y purge 


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

apt-get -y install mc
apt-get -y install locate
apt-get -y install openssh-server 
apt-get -y install samba
apt-get -y install apache2  
apt-get -y install php5 
apt-get -y install cifs-utils 

#backup ssh server config...
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")


function temp22() {

echo

}
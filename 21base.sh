#!/usr/bin/env bash
set -x
source shc/12env.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#get webroot code 

#rsync -av  10.4.10.243:/htdocs/ /var/www/html
#
# copy it over to webwork rename it and extract.
 7z x htdocs.7z
rsync -av ~/webwork/htdocs/ /var/www/html
chmod -R 755 /var/www/html 


#Note: vbox shares are not available till it reboots after this start.sh script runs.
#
#David Gleba 2015-10-01 03:15PM

# define download function
# courtesy of http://fitnr.com/showing-file-download-progress-using-wget.html
# download()
# {
    # local url=$1
    # echo -n "    "
    # wget --progress=dot $url 2>&1 | grep --line-buffered "%" | \
        # sed -u -e "s,\.,,g" | awk '{printf("\b\b\b\b%4s", $2)}'
    # echo -ne "\b\b\b\b"
    # echo " DONE"
# }

# determine ubuntu version
ubuntu_version=$(lsb_release -cs)

# check for interactive shell
if ! grep -q "noninteractive" /proc/cmdline ; then
    stty sane

    # ask questions
#    read -ep " please enter the username you are currently logged in as: " -i "$userv" userv
#    read -ep " please enter your preferred hostname: " -i "$default_hostname" hostname
#    read -ep " please enter your preferred domain: " -i "$default_domain" domain
  
fi

# print status message
echo " preparing your server; this may take a few minutes ..."


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# backup hosts settings...

#
cp /etc/hosts /etc/hosts.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
cp /etc/hostname /etc/hostname.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#why do this stuff again... ???
# set fqdn
fqdn="$default_hostname.$default_domain"
# update hostname
echo "$default_hostname" > /etc/hostname
sed -i "s@ubuntu.ubuntu@$fqdn@g" /etc/hosts
sed -i "s@ubuntu@$hostname@g" /etc/hosts
#hostname "$default_hostname"

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


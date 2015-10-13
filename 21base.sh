#!/bin/bash
set -x

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

# set fqdn
fqdn="$default_hostname.$default_domain"

# update hostname
echo "$hostname" > /etc/hostname
sed -i "s@ubuntu.ubuntu@$fqdn@g" /etc/hosts
sed -i "s@ubuntu@$hostname@g" /etc/hosts
hostname "$default_hostname"

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

#install virtual box guest additions.
#http://virtualboxes.org/doc/installing-guest-additions-on-ubuntu/
#https://www.virtualbox.org/manual/ch04.html#idp46856128490560
#http://www.binarytides.com/vbox-guest-additions-ubuntu-14-04/
#http://sharadchhetri.com/2014/10/07/ubuntu-14-04-install-virtualbox-guest-additions-also-create-videos/

#sudo apt-get install build-essential module-assistant;
#sudo m-a prepare
#sudo rcvboxadd setup
#sudo apt-get -y install virtualbox-guest-additions-iso
#sudo apt-get install dkms gcc 
sudo apt-get -y install dkms
sudo apt-get -y install build-essential module-assistant
sudo m-a prepare

cd /tmp
wget -N http://download.virtualbox.org/virtualbox/5.0.2/VBoxGuestAdditions_5.0.2.iso
sudo mount -o loop VBoxGuestAdditions_5.0.2.iso /mnt
cd /mnt
sudo ./VBoxLinuxAdditions.run

# check loaded modules
lsmod | grep -io vboxguest
sleep 2




# add shares to rc.local to start them at boot... grr. this is frustrating....
#
cp /etc/rc.local /etc/rc.local.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
mkdir -p ~/backup
cp /etc/rc.local ~/backup/rc.local.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
#didn't seem to work with mount command.
#this works. but then it didn't the next time :(
#http://askubuntu.com/questions/252853/how-to-mount-a-virtualbox-shared-folder-at-startup
# ggl: ubuntu virtualbox shared folder will not mount on boot
# http://askubuntu.com/questions/365346/virtualbox-shared-folder-mount-from-fstab-fails-works-once-bootup-is-complete
# this is not reliable... use upstart mountvshare.conf instead.
#sudo sed -i "/^exit 0/isleep 6\nmount.vboxsf share203 /home/$userv/share203 vboxsf\n#mount.vboxsf html /var/www/html vboxsf\nsleep 4\nmount html\nmount share203\n" /etc/rc.local

mkdir -p /home/$userv/share203
mkdir -p /var/www/html

#add shares to fstab
cp /etc/fstab /etc/fstab.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
mkdir -p ~/backup
cp /etc/fstab ~/backup/fstab.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
#not working yet...
echo "html      /var/www/html  vboxsf   defaults,noauto  0   0" >> /etc/fstab
echo "share203  /home/$userv/share203  vboxsf   defaults,noauto  0   0" >> /etc/fstab



#create upstart script for mounting shared folders...
sudo tee /etc/init/mountvshare.conf <<EOF
description "Test mount"
author      "Your Name"

start on filesystem or runlevel [2345]
stop on shutdown

script

    sleep 8
    mount html
    mount share203

end script

pre-start script
    echo "[`date`] mountvshare start...." >> /var/log/mountvshare.log
end script

pre-stop script
    rm /var/run/mountvshare.pid
    echo "[`date`] .... stop mountvshare" >> /var/log/mountvshare.log
end script
EOF
#
sudo service mountvshare start



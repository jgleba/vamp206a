#!/usr/bin/env bash
cd
source shc/21env.sh

#2015-10-28
#can't mount using cmdline. can mount with pcmanfm on smb://PMDS-3HZGD42/C using dgleba domain=stackpole password



smbmn() {

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#edit these lines to match your windows machines shares...
#




#get ip address of windows machine...
#ipredwe=$(ping -c 1 REDWE | grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'  | head -n1)
ipredwe=nmblookup -S REDWE | grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'  | head -n1
echo "$ipredwe"

sudo mkdir -p /mnt/REDWE//c
sudo chmod -R 777 /mnt/REDWE/c
#sudo chmod -R 777 ~/webwork

# this is a share for drive c - the whole drive
sudo mount -t cifs //$ipredwe/c /mnt/REDWE/c -o username=$uredwe,password=$predwe
sudo mount -t cifs //redwe/c /mnt/REDWE/c -o username=$uredwe,password=$predwe

# this is a share where the web root files are..
mkdir -p /var/www/html
sudo mount -t cifs //$ipredwe/htocs /var/www/html -o username=$uredwe,password=$predwe

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sudo cat <<EOF > ~/smbcredc
username=$u3hz
password=$p3hz
domain=stackpole
EOF
chmod go-rwx ~/smbcredc
#cat ~/smbcredc

#get ip address of windows machine...
#notgood...  ip3hz = nmblookup -S PMDS-3HZGD42 | grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'  | head -n1
ip3hz1=$(ping -c 1 PMDS-3HZGD42 | grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'  | head -n1)
echo "$ip3hz1"
export ip3hz="$ip3hz1"

sudo mkdir -p /mnt/3hz/C
sudo chmod -R 777 /mnt/3hz/C
# this is a share for drive c - the whole drive
#sudo mount -t cifs //$ip3hz/c /mnt/3hz/c -o username=$u3hz,password=$p3hz
#sudo mount -t cifs //$ip3hz/C /mnt/3hz/C -o domain=stackpole.com,username=$u3hz,password=$p3hz
#sudo mount -t cifs //PMDS-3HZGD42/C /mnt/3hz/C -o domain=stackpole.com,username=$u3hz,password=$p3hz
sudo mount -v -t cifs //PMDS-3HZGD42/C /mnt/3hz/C -o credentials=~/smbcredc



# this is a share where the web root files are..
sudo mkdir -p /var/www/html
sudo mkdir -p /mnt/3hz/htdocs
chmod -R 777 /mnt/3hz/htdocs
#sudo mount -t cifs //10.4.10.243/htdocs /mnt/3hz/htdocs -o username=dgleba,password=x
#sudo mount -t cifs //$ip3hz/htdocs /mnt/3hz/htdocs -o username=$u3hz,password=$p3hz
#sudo mount -t cifs //$ip3hz/htdocs /mnt/3hz/htdocs -o domain=stackpole,username=$u3hz,password=$p3hz
sudo mount -v -t cifs //PMDS-3HZGD42/htdocs /mnt/3hz/htdocs  -o credentials=~/smbcredc


}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function smbcl() {

sudo apt-get install smbclient

smbclient -L redwe
smbclient -L redex164


}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function umntinfo() 
{
http://stackoverflow.com/questions/74626/how-do-you-force-a-cifs-connection-to-unmount
umount -l
sudo umount -a -t cifs -l
#??  sudo umount -u /mnt/3hz/htdocs
umount /mnt
umount /mnt/3hz/htdocs


}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

offlines() {
date

firewall at csd may be preventing...
apt-get install smbclient...
Failed to fetch http://archive.ubuntu.com/ubuntu/pool/main/s/samba/smbclient_4.1.6+dfsg-1ubuntu2.14.04.9_amd64.deb  Size mismatch


smb://PMDS-3HZGD42/C
smb://dgleba@PMDS-3HZGD42/C
works.
smb://stackpole;dgleba@PMDS-3HZGD42/C

noworks.
smb://stackpole.com;dgleba:a@PMDS-3HZGD42/C
smb://stackpole.com;dgleba@PMDS-3HZGD42/C

#smb://DOM%5Cabcdefg@server.tld/server/path   (%5C is the URL encoding of the backslash character)


smb://WORKGROUP;User@machine.somewhere.com/Share
http://superuser.com/questions/145390/entering-domain-information-when-connecting-to-samba-share-in-dolphin
http://hints.macworld.com/article.php?story=20031203172256827
http://superuser.com/questions/344775/passing-unc-username-and-password-within-a-unc-path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
get ipaddress

#gives : ..  10.4.11.10:
ping -c 1 st-dgleba | grep "64 bytes from"|awk '{print $4}'
#hmm. it always has a colon... this doens't work...
ping -c 1 st-dgleba2 | awk -F'[ :]' 'NR==2 { print $4 }'
#good..
ping -c 1 st-dgleba | grep "64 bytes from " | awk '{print $4}' | cut -d":" -f1

#good:
ping -c 1 st-dgleba | awk -F" |:" '/from/{print $4}'
#works..
ipa21=$(ping -c 1 st-dgleba | awk -F" |:" '/from/{print $4}')
echo $ipa21
#but..
# this returned pmds-jpruim-vm1.stackpole.ca from 64 bytes from pmds-jpruim-vm1.stackpole.ca (10.4.10.243): icmp_seq=1 ttl=128 time=1.11 ms
#ip3hz=$(ping -c 1 PMDS-3HZGD42 | awk -F" |:" '/from/{print $4}')
echo "$ip3hz"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2015-10-30[Oct-Fri]10-09AM

sudo cat <<EOF > ~/smbcred
username=dgleba
password=$p3hz
domain=stackpole
EOF

sudo mount -v -t cifs //PMDS-3HZGD42/htdocs /mnt/3hz/htdocs  -o credentials=~/smbcred

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


set -x
smbmn
date

#!/usr/bin/env bash
set -x

# folder for unattended iso creation...
mdkdir -p /var/varvamp/files
cd /var/varvamp/files

rm ./05create-unattended-iso.sh

#  >>>>>>edit iso creation .sh for tmp and iso source
#
wget -N https://raw.githubusercontent.com/dgleba/vamp206a/master/05create-unattended-iso.sh
chmod +x 05create-unattended-iso.sh
sudo ./05create-unattended-iso.sh

exit 0

offline1() {
test...
}

#
#echo end03

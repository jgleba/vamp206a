#!/bin/bash
set -x

mdkdir /var
mdkdir /var/varvamp
cd /var/varvamp
mkdir vamp206a
cd vamp206a

rm ./05create-unattended-iso.sh

wget -N https://raw.githubusercontent.com/dgleba/vamp206a/master/05create-unattended-iso.sh

chmod +x 05create-unattended-iso.sh
#  >>>>>>edit it for tmp and iso source
sudo ./05create-unattended-iso.sh

offline1() {

test...

}

#
echo end03

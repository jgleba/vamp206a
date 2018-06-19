#!/usr/bin/env bash
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga `dirname "$0"`/`basename "$0"`
# echo ~----------~----------Startingc  `$(readlink -f $0)` 
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, "$0", "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
# https://stackoverflow.com/questions/8911724/how-to-find-out-name-of-script-called-sourced-by-another-script-in-bash
echo "from file.... ${BASH_SOURCE[0]}"
echo "${BASH_SOURCE[@]}"  # echo full bashsource array

saynow()
{
date1=$(date +"__%Y.%m.%d_%H.%M.%S")
echo $date1
timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;
# I think with lib.trap.sh the read prompt doesn't show. so..   timeout1=111 ; echo "Press ENTER or wait ${timeout1} seconds...." ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;
  
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function blockcomment21() {
: <<'BLOCKCOMMENT'

  Purpose:   


BLOCKCOMMENT
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#main...
saynow
#


sudo apt-get update
sudo apt-get -y install nginx


#_____________


sudo tee <<EOF  /var/www/html/index.nginx-debian.html
<!DOCTYPE html><title>!</title>
<h1>614a</h1>
<h6>2018-05-30</h6>
<h4>Welcome to nginx webserver on LXD container! </h4>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>
EOF

df
sudo cat  /var/www/html/index.nginx-debian.html


#_____________



export pat='PasswordAuthentication'
export fil='/etc/ssh/sshd_config'
nowdg1=`date +'__%Y-%m-%d_%a_%k.%M.%S-%Z'`
#
sudo cp  $fil   $fil$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt
#
sudo sed -i "/^${pat}/i # \n# David Gleba kdg54 $nowdg1 \n#"  $fil
sudo sed  -i "s/^${pat}.*/PasswordAuthentication yes/" $fil 
cat /etc/ssh/sshd_config | grep -i passwordau
# cat ./tmpf1 | grep -i passwordau


sudo systemctl restart ssh

#_____________



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#exit 0  # bad idea. exit will prevent next script. return will give error if not returning from function. Use blockcomment.
# end of file comment this will not excecute.
#

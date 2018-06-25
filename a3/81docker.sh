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



# https://askubuntu.com/questions/938700/how-do-i-install-docker-on-ubuntu-16-04-lts

# Set up the docker repository

 sudo apt-get update
 sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

 sudo apt-get update

 apt-cache policy docker-ce

 # sudo apt-get -y install docker-ce
 # sudo apt-get -y install docker.io

 
 # https://docs.docker.com/install/linux/docker-ce/ubuntu/#os-requirements


  sudo apt-get -y remove docker docker-engine docker.io

  apt-cache madison docker-ce

  dockerv='18.03.0~ce-0~ubuntu'

  sudo apt-get install docker-ce=$dockerv


 # sudo systemctl status docker
 docker -v
 docker version
 
 # sudo apt -y install docker-compose
 
 # docker
 
 sudo docker run hello-world
 


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#no..
# sudo apt-get upgrade docker-compose
# sudo apt-get upgrade 


#
# upgrade docker compose
#
sudo apt-get -y remove docker-compose
# then install the newest version on the release page at GitHub with
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
docker-compose -v
#
# ref..
# https://stackoverflow.com/questions/49839028/how-to-upgrade-docker-compose-to-latest-version
# https://github.com/docker/compose/releases
# sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
# docker-compose -v
# curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


docker version
docker-compose version

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

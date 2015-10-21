#!/usr/bin/env bash
set -x
cd
source shc/21env.sh

sudo chmod -R 777 tmp
sudo mkdir -p /var/www/html
#sudo chmod -R 755 /var/www/html 



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#get webroot code 

# set method as either ftp or bitbucket...
method="bitbucket"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


if [method="ftp" ]; then

    # I setup vsftp on a vagrant ubuntu machine, vamp198e, that has shares to c: drive to get the files...
    cd /home/$userv/tmp
    rm -f vne.sh
    pwd
    ls
    read -t 10 -p "Press ENTER or wait about ten seconds" ; echo ;

    #you may have to edit the ip address..
    if [curl -O -u vagrant:vagrant ftp://10.4.10.254//var/varvamp/files/vne.sh] ; then
            echo 'curl Ok'
    else
            read  -p "Could not get file from ftp server. Press Enter." ; echo ;
            exit 9
    fi	


    if [ -f vne.sh ]; then
        sudo cat vne.sh > /home/$userv/shc/21env.sh
        sudo chmod -R 777 /home/$userv/shc/21env.sh

        # copy env.sh to profile.d so it runs a login for global variables...
        # may not be needed...
        sudo cp shc/21env.sh /etc/profile.d

    else
            read  -p "Oops, ftp server may not be present. Press Enter." ; echo ; 	
            exit 8
    fi


    if [ ! -f htdocs.PMDS-DATA.latest.7z ]; then
        curl -O -u vagrant:vagrant ftp://10.4.10.254//var/varvamp/files/htdocs.PMDS-DATA.latest.7z
        cd /home/$userv/tmp

        sudo rm -rf htdocs
        read -t 10 -p "Hit ENTER or wait about ten seconds" ; echo ;
        7z x htdocs.PMDS-DATA.latest.7z

        source ~/shc/21env.sh
        sudo rsync -vrltgoD /home/$userv/tmp/htdocs/  /var/www/html
    fi
fi


if [method="bitbucket"] ; then

    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    #
    # bitbucket download tips...
    # http://stackoverflow.com/questions/17682143/download-private-bitbucket-repository-zip-file-using-http-authentication
    # https://bitbucket.org/site/master/issues/7393/in-addition-to-raw-allow-to-download-files
    #
    # works..  prompts for password for private repo..   this gives the dl a name...
    #    curl    --user dgleba  https://bitbucket.org/dgleba/vamp206env/raw/master/vne.sh -o vne1.sh
    # works... prompts for password for private repo..  this uses name of source file...
    curl -O --user dgleba  https://bitbucket.org/dgleba/vamp206env/raw/master/vne.sh 

    # scp info... [i didn't use it.]
    #http://stackoverflow.com/questions/50096/how-to-pass-password-to-scp

fi


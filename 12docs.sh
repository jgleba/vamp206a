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
#dgmethod="bitbucket"
dgmethod="ftp"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


if [ $dgmethod = "ftp" ] ; then

    # I setup vsftp on a vagrant ubuntu machine, vamp198e, that has shares to c: drive to get the files...
    cd /home/$userv/tmp
    rm -f /home/$userv/tmpvne.sh
    pwd
    ls
    read -t 10 -p "Press ENTER or wait about ten seconds" ; echo ;

    #you may have to edit the ip address..
    #https://technicalsanctuary.wordpress.com/2012/11/01/curl-curl-9-server-denied-you-to-change-to-the-given-directory/
    #example path: ftp://192.168.88.80//var/varvamp/files/vne.sh
    #absolute path is  //var   << double slash for absolute path.
    #else get error : curl: (9) Server denied you to change to the given directory

    curl -O -u vagrant:vagrant ftp://10.4.10.254//var/varvamp/files/vne.sh
    
    if [ -f vne.sh ]; then
        sudo cat /home/$userv/tmp/vne.sh > /home/$userv/shc/21env.sh
        sudo chmod -R 777 /home/$userv/shc/21env.sh

        # copy env.sh to profile.d so it runs a login for global variables...
        # may not be needed...
        sudo cp /home/$userv/shc/21env.sh /etc/profile.d

    else
            read  -p "Oops, ftp server may not be present. Press Enter." ; echo ; 	
            exit 8
    fi


    if [ ! -f htdocs.PMDS-DATA.latest.7z ] ; then
        curl -O -u vagrant:vagrant ftp://10.4.10.254//var/varvamp/files/htdocs.PMDS-DATA.latest.7z
        #curl -O -u vagrant:vagrant ftp://10.4.10.254//var/varvamp/files/htdocs.PMDS-DATA.latest.zip
        #wget -N ftp://vagrant:vagrant@10.4.10.254//var/varvamp/files/htdocs.PMDS-DATA.latest.7z
        cd /home/$userv/tmp

        sudo rm -rf htdocs
        read -t 10 -p "Hit ENTER or wait about ten seconds" ; echo ;
        cd /home/$userv/tmp
        7z x /home/$userv/tmp/htdocs.PMDS-DATA.latest.7z

        # this problem is gone now...
        #7-Zip [64] 9.20  Copyright (c) 1999-2010 Igor Pavlov  2010-11-18 p7zip Version 9.20 (locale=en_US.UTF-8,Utf16=on,HugeFiles=on,2 CPUs) Processing archive: /home/albe/tmp/htdocs.PMDS-DATA.latest.7z
        #Error: Can not open file as archive
        #htdocs.PMDS-DATA.latest.7z
        #


        source ~/shc/21env.sh
        sudo rsync -vrltgoD /home/$userv/tmp/htdocs/  /var/www/html
    fi
fi


if [ $dgmethod = "bitbucket" ] ; then

# can't unzip the file....
#  https://bitbucket.org/conservancy/kallithea/issues/35


    cd /home/$userv/tmp
    rm -f vne.sh
    pwd
    ls
    read -t 10 -p "Press ENTER or wait about ten seconds" ; echo ;

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
        curl -O --user dgleba  https://bitbucket.org/dgleba/htdocs/raw/master/htdocs.PMDS-DATA.latest.7z
                                
        cd /home/$userv/tmp

        sudo rm -rf htdocs
        read -t 10 -p "Hit ENTER or wait about ten seconds" ; echo ;
        7z x htdocs.PMDS-DATA.latest.7z

        source ~/shc/21env.sh
        sudo rsync -vrltgoD /home/$userv/tmp/htdocs/  /var/www/html
    fi
fi


#!/usr/bin/env bash

cd
set -x
date

basauth()
{
sudo tee /etc/apache2/sites-available/baseauth1.conf <<EOF
#
# require authentication under /var/www/html/authbasic
 <Directory /var/www/html/authbasic>
    AuthType Basic
    AuthName "authbasic folder.. Basic Authentication"
    AuthUserFile /etc/apache2/.htpasswd
    require valid-user
</Directory>
#
EOF
}


ipage()
{

sudo tee /var/www/html/authbasic/i.htm <<EOF
<html>
<body>
<div style="width: 100%; font-size: 40px; font-weight: bold; text-align: center;">
Test Page for Basic Auth
</div>
</body>
</html>
#
EOF
  
}


apache21()
{

sudo apt-get -y install apache2-utils

    sudo mkdir -p /var/www/html/authbasic
    # add a user ( create a new file with "-c" => only add "-c" at the first time. Do not add it 2nd time to add users. )
    #sudo htpasswd -c /etc/apache2/.htpasswd $userv
    sudo htpasswd -c /etc/apache2/.htpasswd $userv

  sudo a2dissite baseauth1.conf
  sudo a2ensite baseauth1.conf
  sudo service apache2 reload

}




#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function info()
{
exit 999

Basic Auth:

https://help.ubuntu.com/lts/serverguide/httpd.html

http://www.server-world.info/en/note?os=Ubuntu_14.04&p=httpd&f=9

}


#main section.....................................................................

#echo requested commands...
date

basauth
apache21
ipage

date
#

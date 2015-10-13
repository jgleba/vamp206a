#!/usr/bin/env bash

#Note: vbox shares are not available till it reboots after start.sh script runs.
#
#David Gleba 2015-10-01 03:15PM

date
set -x

# mount vbox shares...
#
mkdir -p ~/share203
if mount | grep /share203 > /dev/null; then
    echo "its mounted"
else
    echo "not, so mount it"
	sudo mount -t vboxsf  share203 ~/share203
fi
#sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) vampx ~/share203
#
sudo mkdir -p /var/www/html
if mount | grep /var/www/html > /dev/null; then
    echo "already mounted"
else
    echo "now mount it"
	sudo mount -t vboxsf  html /var/www/html
fi


# install apache 2.5 and php 5.5
#sudo apt-get install -y apache2
#sudo apt-get install -y php5

# install mysql and give password to installer
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get -y install mysql-server

#should this have a -y???
sudo apt-get install -y php5-mysql

# install phpmyadmin and give password(s) to installer
# for simplicity I'm using the same password for mysql and phpmyadmin
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo apt-get -y install phpmyadmin

sudo apt-get -y install python-pip libapache2-mod-wsgi
sudo pip install django

sudo pip install django-admin-bootstrapped
# got error - use apt-get instead.......  sudo pip install mysql-python
sudo apt-get  -y install python-mysqldb


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# install ftp server...
#    https://help.ubuntu.com/lts/serverguide/ftp-server.html
apt-get -y install vsftpd
# uncomment #write_enable=YES
sudo sed -i "s@#write_enable=YES@write_enable=YES@g" /etc/vsftpd.conf


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# install sendmail...
#    http://askubuntu.com/questions/47609/how-to-have-my-php-send-mail
sudo apt-get -y install ssmtp

#  edit /etc/ssmtp/ssmtp.conf -- edit  mailhub=mail
sudo sed -i "s@mailhub=mail@mailhub=MESG01.stackpole.ca@g"  /etc/ssmtp/ssmtp.conf

# edit /etc/php5/apache2/php.ini
# sudo nano /etc/php5/apache2/php.ini
sudo sed -i "s@;sendmail_path =@sendmail_path = /usr/sbin/sendmail -t@g"  /etc/php5/apache2/php.ini


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# enable mod_rewrite
sudo a2enmod rewrite

# restart apache
service apache2 restart

# install git
sudo apt-get -y install git

# install Composer
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

#sudo apt-get -y install mc

#
date
#

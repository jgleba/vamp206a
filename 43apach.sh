#!/usr/bin/env bash
cd

#Note: vbox shares are not available till it reboots after start.sh script runs.
#
#David Gleba 2015-10-01 03:15PM

date
set -x



# install apache 2.5 and php 5.5
#sudo apt-get install -y apache2
#sudo apt-get install -y php5

# install mysql and give password to installer
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $mysqlrootpassw"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $mysqlrootpassw"
sudo apt-get -y install mysql-server

#should this have a -y???
sudo apt-get install -y php5-mysql

# install phpmyadmin and give password(s) to installer
# for simplicity I'm using the same password for mysql and phpmyadmin
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $mysqlrootpassw"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $mysqlrootpassw"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $mysqlrootpassw"
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
sudo service vsftpd restart


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# install sendmail...
#    http://askubuntu.com/questions/47609/how-to-have-my-php-send-mail
sudo apt-get -y install ssmtp

#  edit /etc/ssmtp/ssmtp.conf -- edit  mailhub=mail .. replace entire line with mailhub...
#
# didn't work due to variation in original file. try to replace the line matching string with sed.
#   sudo sed -i "s@mailhub=mail@mailhub=MESG01.stackpole.ca@g"  /etc/ssmtp/ssmtp.conf
#
# backup file before editing...
sudo cp /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
# 2015-10-16_Fri_11.08-AM
# add a marker comment like: #David Gleba 2015-10-16... http://stackoverflow.com/questions/11694980/using-sed-insert-a-line-below-or-above-the-pattern
# now replace the line... http://stackoverflow.com/questions/16440377/sed-replace-whole-line-when-match-found
# 
# add marker line above my edits... 
# works 2015-10-19_Mon_10.50-AM
nowdg1=`date +'__%Y-%m-%d_%a_%k.%M.%S-%Z'`
sed -i "/mailhub/i # \n# David Gleba kdg54 $nowdg1 \n#"  /etc/ssmtp/ssmtp.conf
#
# remove line containing  'mailhub'  and replace th line completely with the new text...
sed -i 's/.*mailhub.*/mailhub=MESG01.stackpole.ca/g' /etc/ssmtp/ssmtp.conf




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
# make tempfiles folder writable. This is used with cilist, tnlist and others to write excel files and mail them..
#
  sudo mkdir -p /tmp/tempfiles
  sudo chmod -R 777 /tmp/tempfiles


#
date
#

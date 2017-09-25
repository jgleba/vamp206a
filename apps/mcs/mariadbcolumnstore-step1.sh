

# Install mariadb columnstore on ubuntu 16.04


# usage:   
           cd ; sudo chmod -R +x shc/ ; shc/apps/mcs/mariadbcolumnstore-step1.sh 2>&1 | tee -a v206_mcs-setup_log$(date +"__%Y-%m-%d_%H.%M.%S").log



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# https://gist.github.com/dtheodor/baceceae4cbc1bc3f6f2861a09edcef1

# https://mariadb.com/kb/en/library/preparing-for-columnstore-installation/

# https://gist.github.com/aaronpeterson/ddd75ebb4fa1c419fab5e496c7ab9bb1

# http://mysqlentomologist.blogspot.ca/2017/06/my-first-steps-with-mariadb-columnstore.html

 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#!/usr/bin/env bash

set +vx
echo
echo this is not finished to run as a script. Just copy paste from this file..
echo
echo exiting...
echo
timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;
# exit 99



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


 sudo localedef -i en_US -f UTF-8 en_US.UTF-8
 sudo apt-get update

 # sudo apt-get -y install expect  -- i moved this up to here becuase I got unmet dependencies. -f install would simply abort after pressing y - for yes.
 # I have found it is better to install fewer packages in one command.
 sudo apt-get -y install expect 

 sudo apt-get -y install libboost-all-dev
 sudo apt-get -f install 
 
 # spread this into more lines.. fewer packages per line...
 # sudo apt-get -y install tzdata libtcl8.6 expect perl openssl file sudo libdbi-perl libboost-all-dev libreadline-dev rsync libsnappy1v5 net-tools libdbd-mysql-perl
 
 sudo apt-get -y install tzdata libtcl8.6 
 sudo apt-get -y install perl openssl file sudo 
 sudo apt-get -y install libdbi-perl libboost-all-dev 
 sudo apt-get -y install  libreadline-dev rsync 
 sudo apt-get -y install  libsnappy1v5 net-tools 
 sudo apt-get -y install  libdbd-mysql-perl

 sudo apt-get -f install 
 
 echo ~/.bashrc
     cat ~/.bashrc

  sudo chmod 777 /tmp
  sudo chmod 777 /dev/shm


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

# https://gist.github.com/aaronpeterson/ddd75ebb4fa1c419fab5e496c7ab9bb1

cd
mkdir sw1
cd sw1

#2017-09-25_Mon_12.27-PM troubles in virtualbox, database crashes, vbox errors, etc... wget https://downloads.mariadb.com/enterprise/htxx-hpee/mariadb-columnstore/1.1.0/ubuntu/dists/xenial/main/binary_amd64/mariadb-columnstore-1.1.0-1-xenial.x86_64.deb.tar.gz
#
wget https://downloads.mariadb.com/enterprise/htxx-hpee/mariadb-columnstore/1.0.11/ubuntu/dists/xenial/main/binary_amd64/mariadb-columnstore-1.0.11-1-xenial.x86_64.deb.tar.gz

# tar zxvf mariadb-columnstore-1.0.11-1-xenial.x86_64.deb.tar.gz
  # mariadb-columnstore-1.0.11-1-x86_64-xenial-client.deb
  # mariadb-columnstore-1.0.11-1-x86_64-xenial-common.deb
  # mariadb-columnstore-1.0.11-1-x86_64-xenial-gssapi-client.deb
  # mariadb-columnstore-1.0.11-1-x86_64-xenial-gssapi-server.deb
  # mariadb-columnstore-1.0.11-1-x86_64-xenial-libs.deb
  # mariadb-columnstore-1.0.11-1-x86_64-xenial-platform.deb
  # mariadb-columnstore-1.0.11-1-x86_64-xenial-server.deb
  # mariadb-columnstore-1.0.11-1-x86_64-xenial-shared.deb
  # mariadb-columnstore-1.0.11-1-x86_64-xenial-storage-engine.deb

cd
cd sw1
  tar zxvf mariadb-columnstore*.deb.tar.gz
  sudo dpkg -i mariadb-columnstore*.deb
  cd
  sudo updatedb
   

#sudo dpkg -l *mariadb-col*
#sudo apt-get remove --purge *mariadb-col\*

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


cd /usr/local/mariadb/columnstore/bin
sudo ./postConfigure

# defaults taken..
# single
# columnstore-1
# internal
# Enter the list (Nx,Ny,Nz) or range (Nx-Nz) of DBRoot IDs assigned to module 'pm1' (1) >



#Running the MariaDB ColumnStore setup scripts
#post-mysqld-install Successfully Completed
#ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/usr/local/mariadb/columnstore/mysql/lib/mysql/mysql.sock' (2 "No such file or directory")
#Error running post-mysql-install, /tmp/post-mysql-install.log
#Exiting...
#albe@ubuntu1604a0311:/usr/local/mariadb/columnstore/bin$

#albe@ubuntu1604a0311:/usr/local/mariadb/columnstore/bin$ mcsmysql
#ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/usr/local/mariadb/columnstore/mysql/lib/mysql/mysql.sock' (2 "No such file or directory")
#albe@ubuntu1604a0311:/usr/local/mariadb/columnstore/bin$

# checking for engine columnstore columnstore doesn't exist


file1="/etc/php/7.0/apache2/php.ini"
# back it up with a unique name using a timestamp..
sudo cp $file1 $file1$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt
# now replace the line when pattern is found... http://stackoverflow.com/questions/16440377/sed-replace-whole-line-when-match-found
sudo sed -i 's/.*mysqli.default_socket.*/mysqli.default_socket = \/usr\/local\/mariadb\/columnstore\/mysql\/lib\/mysql\/mysql.sock/g' $file1


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

alias mcsmysql='/usr/local/mariadb/columnstore/mysql/bin/mysql --defaults-extra-file=/usr/local/mariadb/columnstore/mysql/my.cnf -u root'

. /usr/local/mariadb/columnstore/bin/columnstoreAlias
cat  /usr/local/mariadb/columnstore/bin/columnstoreAlias
#cat  /usr/local/mariadb/columnstore/bin/columnstoreAlias >> ~/.bashrc




#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# phpmyadmin..


sudo apt-get -y install php-mysql
sudo phpenmod mysqli

sudo apt-get -y install phpmyadmin php-mbstring php-gettext

sudo systemctl restart apache2

sudo ufw allow 22
sudo ufw allow 3306

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# set permission to use cpimport as non root.


cd /usr/local/mariadb/columnstore

chmod +x /home/albe/shc/a1/62folder.sh
 sudo /home/albe/shc/a1/62folder.sh



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



















#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

exit 0

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# notes...


# error trying to login to phpmyadmin.
  #2002 - No such file or directory<br />The server is not responding (or the local server's socket is not correctly configured).


# this fixed it..

# https://stackoverflow.com/questions/12134460/cant-start-phpmyadmin-keep-getting-the-2002-socket-error


# /etc/php/7.0/ php.ini  line 1152   
  # match my.cnf - socket= /usr/local/mariadb/columnstore/mysql/lib/mysql/mysql.sock
    # in  /usr/local/mariadb/columnstore/mysql/my.cnf


# ; Default socket name for local MySQL connects.  If empty, uses the built-in
# ; MySQL defaults.
# ; http://php.net/mysqli.default-socket
# mysqli.default_socket = /usr/local/mariadb/columnstore/mysql/lib/mysql/mysql.sock


#file1="/etc/php/7.0/ php.ini"
## back it up with a unique name using a timestamp..
#cp $file1 $file1$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt
## now replace the line when pattern is found... http://stackoverflow.com/questions/16440377/sed-replace-whole-line-when-match-found
#sudo sed -i 's/.*mysqli.default_socket.*/mysqli.default_socket = /usr/local/mariadb/columnstore/mysql/lib/mysql/mysql.sock/g' $file1
#

 
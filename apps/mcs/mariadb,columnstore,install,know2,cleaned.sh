

# Install mariadb columnstore on ubuntu 16.04



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
exit 99



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
  tar zxvf mariadb-columnstore-1.0.11-1-xenial.x86_64.deb.tar.gz
  sudo dpkg -i mariadb-columnstore*.deb
  cd
  sudo updatedb
   



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


cd /usr/local/mariadb/columnstore/bin
sudo ./postConfigure

# defaults taken..
# single
# columnstore-1
# internal
# Enter the list (Nx,Ny,Nz) or range (Nx-Nz) of DBRoot IDs assigned to module 'pm1' (1) >



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


 SET PASSWORD FOR 'root'@'localhost' = PASSWORD('a');
 SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('a');
 SET PASSWORD FOR 'root'@'::1'       = PASSWORD('a');
 SET PASSWORD FOR 'pma'@'localhost'  = PASSWORD('a');
  FLUSH PRIVILEGES;
  
  
  
# run
  
apps/mcs/53mcsimp.sh
  
  https://github.com/dgleba/vamp206a/blob/master/apps/mcs/53mcsimp.sh
  
  
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# phpmyadmin..


sudo apt-get install php-mysql
sudo phpenmod mysqli


sudo apt-get -y install phpmyadmin php-mbstring php-gettext

sudo systemctl restart apache2



sudo ufw allow 22
sudo ufw allow 3306



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



# now replace the line when pattern is found... http://stackoverflow.com/questions/16440377/sed-replace-whole-line-when-match-found
sudo sed -i 's/.*mysqli.default_socket.*/mysqli.default_socket = /usr/local/mariadb/columnstore/mysql/lib/mysql/mysql.sock/g' \
  /etc/php/7.0/ php.ini



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



 
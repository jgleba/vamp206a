

# Install mariadb columnstore on ubuntu 16.04



# don't use sudo..


#   usage:    

#         Just paste items from this file to the console.. shc/apps/mcs/marmariadbcolumnstore-step2.sh



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# set root password..

cd
set +vx
cd; source safe/21env.sh
set -vx

mcsmysql 

 SET PASSWORD FOR 'root'@'localhost' = PASSWORD("$mysqlrootpassw");
 SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD("$mysqlrootpassw");
 SET PASSWORD FOR 'root'@'::1'       = PASSWORD("$mysqlrootpassw");
 SET PASSWORD FOR 'pma'@'localhost'  = PASSWORD("$mysqlrootpassw");
  FLUSH PRIVILEGES;
  
# mcsmysql -uroot
# then...
# SET PASSWORD FOR 'root'@'localhost' = PASSWORD('a');
# SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('a');
# SET PASSWORD FOR 'root'@'::1'       = PASSWORD('a');
# SET PASSWORD FOR 'pma'@'localhost'  = PASSWORD('a');
#  FLUSH PRIVILEGES;
  

# run this to setup db's and users...
  
cd
cd; source safe/21env.sh
set -vx
shc/apps/mcs/53mcsimp.sh
  

  





#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#    create columnstores...

cd; source safe/21env.sh
cd /var/www/html/backup/mysql
mcsmysql -uroot -p$mysqlrootpassw  < cmmdata-mcs.sql
mcsmysql -uroot -p$mysqlrootpassw  < cmmlist-mcs.sql

mcsmysql -uroot -p$mysqlrootpassw  < pmdsdata3-cmmdb-regulr_no-maindata-mysql.sql



#ERROR 1178 (42000) at line 30: The storage engine for the table doesn't support IDB-2029: Lock table command is currently not supported in Columnstore.
#mcsmysql -uroot -pa  < pmdsdata3-cmmdb-spectables-mysql.sql

#cpimport dbName tblName [loadFile]

dir1='/usr/local/mariadb/columnstore'
sudo setfacl -R -m group:www-data:rwx $dir1
sudo getfacl $dir1
sudo usermod -a -G mysql  albe
# this didn't work, so I just did ...
sudo chmod -R 775  $dir1
sudo chmod -R g+rws  $dir1

cd /var/www/html/backup/mysql
cpimport cmmdb cmmdata cmmdata.txt -s '\t'
cpimport cmmdb cmmlist cmmlist.txt -s '\t'


cd /var/www/html/backup/mysql
cpimport cmmdb cmmdata cmmdata-1m.txt -s '\t'

cd /var/www/html/backup/mysql
cpimport cmmdb cmmdata cmmdata-5m.txt -s '\t'

cd /var/www/html/backup/mysql
cpimport cmmdb cmmdata cmmdata-16.36m.txt -s '\t'
#  rsync -avv  /var/lib/mysql-files/cmmdb/cmmdata-16.36m.txt   10.4.1.245:/var/www/html/backup/mysql/
tail /var/lib/mysql-files/cmmdb/cmmdata-16.36m.txt


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~











#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

exit 0



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

notes..


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2017-09-27[Sep-Wed]21-33PM


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://mariadb.com/kb/en/library/mariadb-columnstore-software-upgrade-1011-to-110-beta/


export tsv

mysqldump -u <username> -p<password> -T <output_directory> --no-create-info <database_name>
cd
mkdir -p dump
mysqldump -uroot -pa -T ~/dump --no-create-info dgnote130

# just structure only...
mysqldump --user=root --password=$mysqlrootpassw  -d --databases  cilist leanmfg shift_smsmeer shiftcsd1 shiftcsd2 shiftcsd1suprv shiftcsd2suprv dgnote130 hrdb lukup --complete-insert  --quote-names --add-drop-database --allow-keywords | grep -v 'SQL SECURITY DEFINER' > pmdsdata3-some-structure-mysql.sql

sudo ls -la /var/lib/mysql-files/leanmfg/
sudo chmod -R 777  /var/lib/mysql-files

see a2/62grpshare.sh

# 2017-09-20
#allow export to this folder due to..
#   mysqldump: Got error: 1290: The MySQL server is running with the --secure-file-priv option so it cannot execute this statement when executing 'SELECT INTO OUTFILE'
#    mysqldump: Got error: 1: Can't create/write to file '/var/lib/mysql-files/leanmfg/dataface__failed_logins.txt' (Errcode: 13) when executing 'SELECT INTO OUTFILE'
sudo setfacl -R -m group:www-data:rwx /var/lib/mysql-files/
sudo getfacl /var/lib/mysql-files/
sudo usermod -a -G mysql  albe
# this didn't work, so I just did ...
sudo chmod -R 777  /var/lib/mysql-files
sudo chmod -R g+rws  /var/lib/mysql-files




#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 
#!/usr/bin/env bash
echo ~----------~----------Startingb $HOSTNAME, pwd: `pwd`, "${BASH_SOURCE[0]}" $(date +" %Y-%m-%d_%H.%M.%S")
echo "${BASH_SOURCE[@]}"  # echo full bashsource array

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:
        import mariadb columnstore data...

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd
source shc/a2/21env.sh
date
#echo requested commands...
set -vx


set root password..

# mcsmysql -uroot
# then...
# SET PASSWORD FOR 'root'@'localhost' = PASSWORD('a');
# SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('a');
# SET PASSWORD FOR 'root'@'::1'       = PASSWORD('a');
# SET PASSWORD FOR 'pma'@'localhost'  = PASSWORD('a');
#  FLUSH PRIVILEGES;


# Main..

mcsmysql -uroot -p$mysqlrootpassw -e "create database cilist";
mcsmysql -uroot -p$mysqlrootpassw -e "create database dgnote130";
mcsmysql -uroot -p$mysqlrootpassw -e "create database leanmfg";
mcsmysql -uroot -p$mysqlrootpassw -e "create database prodrptdb";
mcsmysql -uroot -p$mysqlrootpassw -e "create database shift_smsmeer";
mcsmysql -uroot -p$mysqlrootpassw -e "create database shiftcsd1";
mcsmysql -uroot -p$mysqlrootpassw -e "create database shiftcsd1suprv";
mcsmysql -uroot -p$mysqlrootpassw -e "create database shiftcsd2";
mcsmysql -uroot -p$mysqlrootpassw -e "create database shiftcsd2suprv";
mcsmysql -uroot -p$mysqlrootpassw -e "create database prodrptdb_archive";
mcsmysql -uroot -p$mysqlrootpassw -e "create database lukup";
mcsmysql -uroot -p$mysqlrootpassw -e "create database hrdb";
mcsmysql -uroot -p$mysqlrootpassw -e "create database greygold";


#preferred..
#commented to prevent accidentally wiping out production data.
if [ $HOSTNAME = "pmdsdata3" ] ; then
    sleep 1
    date1=$(date +"__%Y.%m.%d_%H.%M.%S")
    echo $date1
    timeout1=15 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;
    echo 'pmdsdata3 - will NOT import.'
else
    echo 'this is not pmdsdata3 we WILL import data'

    #   ****** to import or not to import, that is the question...

    mcsmysql -uroot -p$mysqlrootpassw  < /var/www/html/backup/mysql/pmdsdata3-some-mysql.sql
    mcsmysql -uroot -p$mysqlrootpassw  < /var/www/html/backup/mysql/pmdsdata3-prodrptdb-mysql.sql

fi



# use here document to provide input...
#  https://ignaciopp.wordpress.com/2011/08/08/heredoc-tip-execute-mysql-commands-from-shell-with-multiline-scripts-or-queries/
#    heredoc not working just do one line at a time.
mcsmysql -uroot -p$mysqlrootpassw  -e "CREATE USER 'dg417'@'localhost' IDENTIFIED BY '$mysqluserpass';"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT USAGE ON *.* TO 'dg417'@'localhost' IDENTIFIED BY '$mysqluserpass' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"
#mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON cilist.* TO dg417@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "revoke ALL PRIVILEGES ON cilist.* from dg417@localhost ;"

mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON dgnote130.* TO dg417@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON leanmfg.* TO dg417@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON prodrptdb.* TO dg417@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON shift_smsmeer.* TO dg417@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON shiftcsd1.* TO dg417@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON shiftcsd2.* TO dg417@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON shiftcsd1suprv.* TO dg417@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON shiftcsd2suprv.* TO dg417@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON prodrptdb_archive.* TO dg417@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON greygold.* TO dg417@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON qualitydb.* TO dg417@localhost ;"

mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON prodrptdb.tkb_prodtrak TO 'dg417'@'%' IDENTIFIED BY '$mysqluserpass' ;"
# I ran this on the commandlne...
#              mcsmysql -uroot -p  -e "GRANT ALL PRIVILEGES ON prodrptdb.tkb_prodtrak TO 'dg417'@'%' IDENTIFIED BY '34asfviektighdiekjs' ;"


mcsmysql -uroot -p$mysqlrootpassw  -e "CREATE USER 'ciuser'@'localhost' IDENTIFIED BY '$mysql_ciuser_pass';"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT USAGE ON *.* TO 'ciuser'@'localhost' IDENTIFIED BY '$mysql_ciuser_pass' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT USAGE ON *.* TO 'ciuser'@'%' IDENTIFIED BY '$mysql_ciuser_pass' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON cilist.* TO 'ciuser'@'localhost' IDENTIFIED BY '$mysql_ciuser_pass' ;"
# ran at the command line...
#  mcsmysql -uroot -p  -e "GRANT ALL PRIVILEGES ON cilist.* TO 'cilistu1'@'%' IDENTIFIED BY 'replaceme-er33k456k43ikdi3' ;"

mcsmysql -uroot -p$mysqlrootpassw  -e "CREATE USER 'lukup'@'localhost' IDENTIFIED BY '$mysql_lukup_pass';"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON lukup.* TO lukup@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT USAGE ON *.* TO 'lukup'@'localhost' IDENTIFIED BY '$mysql_lukup_pass' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT USAGE ON *.* TO 'lukup'@'%' IDENTIFIED BY '$mysql_lukup_pass' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"

mcsmysql -uroot -p$mysqlrootpassw  -e "CREATE USER 'hruser'@'localhost' IDENTIFIED BY '$mysql_hruser_pass';"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT USAGE ON *.* TO 'hruser'@'localhost' IDENTIFIED BY '$mysql_hruser_pass' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT USAGE ON *.* TO 'hruser'@'%' IDENTIFIED BY '$mysql_hruser_pass' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON hrdb.* TO hruser@localhost IDENTIFIED BY '$mysql_hruser_pass';"

# i had to change definer on views looking at lukup database. Got error: View 'cilist.vw_enterprise_all' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them
# see C:\n\Dropbox\csd\serve\vboxyard\vamp206a\mysql-user-change\viewdefiner-2016-10-11-mysqlknow-changeuser.txt

#mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT SELECT, show view ON lukup.* TO dg417@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "revoke ALL PRIVILEGES ON lukup.* from dg417@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "revoke ALL PRIVILEGES ON lukup.* from dg417@'%' ;"

mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT SELECT, show view ON lukup.* TO ciuser@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT SELECT ON lukup.* TO hruser@localhost ;"


mcsmysql -uroot -p$mysqlrootpassw  -e "CREATE USER 'stuser'@'localhost' IDENTIFIED BY '$mysqluserpass';"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT USAGE ON *.* TO 'stuser'@'localhost' IDENTIFIED BY '$mysql_stuser_pass' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT USAGE ON *.* TO 'stuser'@'%' IDENTIFIED BY '$mysql_stuser_pass' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT SELECT ON lukup.* TO stuser@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON greygold.* TO stuser@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON greygold.* TO 'stuser'@'%' ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT select ON prodrptdb.* TO stuser@localhost ;"
#
mcsmysql -uroot -p$mysqlrootpassw  -e "CREATE USER 'stread'@'localhost' IDENTIFIED BY '$mysql_stread_pass';"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT USAGE ON *.* TO 'stread'@'localhost' IDENTIFIED BY '$mysql_stread_pass' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT USAGE ON *.* TO 'stread'@'%' IDENTIFIED BY '$mysql_stread_pass' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"

mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT select ON greygold.* TO stread@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT select ON greygold.* TO 'stread'@'%' ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT select ON prodrptdb.* TO stread@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT select ON cmmdb.* TO stread@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT select ON cmmdb.* TO stread@'%' ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT select ON qualitydb.* TO stread@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT select ON qualitydb.* TO stread@'%' ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "revoke ALL PRIVILEGES ON lukup.* from stread@localhost ;"

mcsmysql -uroot -p$mysqlrootpassw  -e "CREATE USER 'sthistorian'@'localhost' IDENTIFIED BY '$mysql_sthistorian_pass';"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT USAGE ON *.* TO 'sthistorian'@'localhost' IDENTIFIED BY '$mysql_sthistorian_pass' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT USAGE ON *.* TO 'sthistorian'@'%' IDENTIFIED BY '$mysql_sthistorian_pass' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON ignition.* TO sthistorian@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON ignition.* TO 'sthistorian'@'%' ;"
#

mcsmysql -uroot -p$mysqlrootpassw -e "create database cmmdb";
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON cmmdb.* TO sthistorian@localhost ;"
mcsmysql -uroot -p$mysqlrootpassw  -e "GRANT ALL PRIVILEGES ON cmmdb.* TO 'sthistorian'@'%' ;"
#


#perms...

sudo sudo mkdir -p /var/www/html


#templates_c

sudo mkdir /var/www/html/cilist/templates_c
sudo mkdir /var/www/html/dgnote130/templates_c
sudo mkdir /var/www/html/leanmfg/templates_c
sudo mkdir /var/www/html/prodrpt/templates_c
sudo mkdir /var/www/html/shiftcsd1/templates_c
sudo mkdir /var/www/html/shiftcsd1sup/templates_c
sudo mkdir /var/www/html/shiftcsd2/templates_c
sudo mkdir /var/www/html/shiftcsd2sup/templates_c
sudo mkdir /var/www/html/shiftsmsmeer/templates_c


sudo chmod -R 777  /var/www/html/cilist/templates_c
sudo chmod -R 777  /var/www/html/dgnote130/templates_c
sudo chmod -R 777  /var/www/html/leanmfg/templates_c
sudo chmod -R 777  /var/www/html/prodrpt/templates_c
sudo chmod -R 777  /var/www/html/shiftcsd1/templates_c
sudo chmod -R 777  /var/www/html/shiftcsd1sup/templates_c
sudo chmod -R 777  /var/www/html/shiftcsd2/templates_c
sudo chmod -R 777  /var/www/html/shiftcsd2sup/templates_c
sudo chmod -R 777  /var/www/html/shiftsmsmeer/templates_c

#userconfig:

sudo mkdir /var/www/html/cilist/user_config
sudo mkdir /var/www/html/dgnote130/user_config
sudo mkdir /var/www/html/leanmfg/user_config
sudo mkdir /var/www/html/prodrpt/user_config
sudo mkdir /var/www/html/shiftcsd1/user_config
sudo mkdir /var/www/html/shiftcsd1sup/user_config
sudo mkdir /var/www/html/shiftcsd2/user_config
sudo mkdir /var/www/html/shiftcsd2sup/user_config
sudo mkdir /var/www/html/shiftsmsmeer/user_config

sudo chmod -R 777  /var/www/html/cilist/user_config
sudo chmod -R 777  /var/www/html/dgnote130/user_config
sudo chmod -R 777  /var/www/html/leanmfg/user_config
sudo chmod -R 777  /var/www/html/prodrpt/user_config
sudo chmod -R 777  /var/www/html/shiftcsd1/user_config
sudo chmod -R 777  /var/www/html/shiftcsd1sup/user_config
sudo chmod -R 777  /var/www/html/shiftcsd2/user_config
sudo chmod -R 777  /var/www/html/shiftcsd2sup/user_config
sudo chmod -R 777  /var/www/html/shiftsmsmeer/user_config


grant ALL on infinidb_vtable.* to 'dg417'@'localhost'; 
flush privileges;
 
 

date

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function notes() {
# begin block comment =============================
: <<'END'






END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


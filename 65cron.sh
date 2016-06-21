#!/usr/bin/env bash

cd
set -vx
source shc/21env.sh

#remove then add # run 0901am everyday
sudo crontab -u pmdsu -l #list the crontab
#remove
sudo crontab -u pmdsu -l | grep -v '/excel2_script.sh'  | sudo crontab -u pmdsu -
#add
sudo crontab -u pmdsu -l | { cat; echo "37 15 1 10 * /var/www/html/cilist/actions/excel2_script.sh"; } | sudo crontab -u pmdsu -
# every min.
#sudo crontab -u pmdsu -l | { cat; echo "* * * * * /var/www/html/cilist/actions/excel2_script.sh"; } | sudo crontab -u pmdsu -
sudo crontab -u pmdsu -l


# import all data daily...
#  list, remove, list, add, list...
sudo crontab -u albe -l
# remove
sudo crontab -u albe -l | grep -v 'albe/shc/53imp.sh'  | sudo crontab -u albe - #remove
sudo crontab -u albe -l  #list
sudo crontab -u albe -l | { cat; echo "36 8 * * 1-6 /home/albe/shc/53imp.sh >> /home/albe/log/cronlog.log 2<&1"; } | sudo crontab -u albe -  #add
sudo crontab -u albe -l | { cat; echo "21 15 * * 1-6 /home/albe/shc/53imp.sh >> /home/albe/log/cronlog.log 2<&1"; } | sudo crontab -u albe -  #add
sudo crontab -u albe -l

#list cron logs 
grep CRON /var/log/syslog | grep albe



#remove from pmdsu... better to run as albe, the env variables are already present...
#  list, remove, list, add, list...
sudo crontab -u pmdsu -l
sudo crontab -u pmdsu -l | grep -v 'albe/shc/53imp.sh'  | sudo crontab -u pmdsu - #remove
sudo crontab -u pmdsu -l  #list



#Make scripts executable.
sudo chmod -R ug+x /var/www/html/cilist/actions/*.sh
sudo chmod -R ug+x /var/www/html/shiftcsd2sup/actions/*.sh

#example.. turn off excecute in this folder...
find /var/www/html/dokuwiki/ -type f -name '*.sh' -exec chmod ug-x {} \;

#find permissions of files using tree and grep on *.sh files - all scripts - *.sh
sudo apt-get install tree
cd /var/www/html
tree -ifpugDs $PWD |grep "\.sh"


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# incorrect from name fromname wrong..
# solution..
# email had old name vamp206b.vamp206b
#sudo dpkg-reconfigure ssmtp
#or edit /etc/ssmtp/ssmtp.conf
#change fully qualified hostname and allow user to enter any from name.


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function info()
{
exit 999
# begin block comment =============================
: <<'END'

remove all:
crontab -r 

cron know..
http://unix.stackexchange.com/questions/119481/how-come-crontab-e-is-different-from-less-etc-crontab
http://stackoverflow.com/questions/878600/how-to-create-cronjob-using-bash

/var/spool/cron/crontabs/albe

#sudo crontab -u pmdsu -l | { cat; echo "*/2 * * * * cript.sh"; } | sudo crontab -u pmdsu -

END
# end block comment ===============================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#blank one...

# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


}
#

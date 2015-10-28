#!/usr/bin/env bash

cd
set -vx


#remove then add # run 0901am everyday
sudo crontab -u pmdsu -l
#remove
sudo crontab -u pmdsu -l | grep -v '/excel2_script.sh'  | sudo crontab -u pmdsu -
#add
sudo crontab -u pmdsu -l | { cat; echo "37 15 1 10 * /var/www/html/cilist/actions/excel2_script.sh"; } | sudo crontab -u pmdsu -
# every 2 min.
#sudo crontab -u pmdsu -l | { cat; echo "*/2 * * * * /var/www/html/cilist/actions/excel2_script.sh"; } | sudo crontab -u pmdsu -
sudo crontab -u pmdsu -l



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function info()
{
exit 999

remove:
http://blog.fayland.org/2011/10/removeadd-job-to-crontab-by-commandline.html
#crontab -u fayland -l | grep -v 'perl /home/fayland/test.pl'  | crontab -u fayland -
crontab -u $userv -l | grep -v '/var/www/html/cilist/actions/excel2_script.sh'  | crontab -u $userv -

remove all:
crontab -r 


cmd line add:
crontab -l | { cat; echo "0 0 0 0 0 some entry"; } | crontab -

cron know..

http://unix.stackexchange.com/questions/119481/how-come-crontab-e-is-different-from-less-etc-crontab

http://stackoverflow.com/questions/878600/how-to-create-cronjob-using-bash

crontab -e


/var/spool/cron/crontabs/albe

add:
crontab -l | { cat; echo "5 * * * 1 ls"; } | crontab -


#wrong... crontab -l | { cat; echo "1/3 * * * * /var/html/cilist/actions/excel2_script.sh"; } | crontab -


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

old:
# add
# run every 3 minutes
crontab -l | { cat; echo "*/3 * * * * /var/www/html/cilist/actions/excel2_script.sh"; } | crontab -
#remove then add    # run 0901am everyday
crontab -l
#remove
crontab -u $userv -l | grep -v '/excel2_script.sh'  | crontab -u $userv -
#add
crontab -l | { cat; echo "1 9 * * * /var/www/html/cilist/actions/excel2_script.sh"; } | crontab -
crontab -l




}
#
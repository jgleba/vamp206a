#!/usr/bin/env bash

cd
set -vx
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# backup hosts settings...
#
sudo cp /etc/hosts /etc/hosts.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
sudo cp /etc/hosts /etc/hosts.$(date +"%s").bak
sudo cp /etc/hostname /etc/hostname.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#why do this stuff again ? Yes, do it.
# I think it is a good idea to set the hostname. I may have used an older .iso file with an older hostname.
#
#try deleting the host lines and add new ones. http://stackoverflow.com/questions/5410757/delete-a-line-containing-a-specific-string-using-sed

# set fqdn
fqdn="$default_hostname.$default_domain"
# update hostname
#sudo echo "$default_hostname" > /etc/hostname
echo $default_hostname | sudo tee /etc/hostname
cat /etc/hostname
#_____________
#this was problematic... see next stanza
#sudo sed -i "s@ubuntu.ubuntu@$fqdn@g" /etc/hosts
#sudo sed -i "s@vamp206b.vamp206b@$fqdn  @g" /etc/hosts
#sudo sed -i "s@ubuntu@$default_hostname@g" /etc/hosts
#sudo sed -i "s@vamp206b@ $default_hostname @g" /etc/hosts
#hostname "$default_hostname"
#_____________
# remove line containing  'vamp206b'  and replace the line completely with the new text...
# add marker line above my edits... # add a marker comment like: #David Gleba 2015-10-16... http://stackoverflow.com/questions/11694980/using-sed-insert-a-line-below-or-above-the-pattern
# now replace the line... http://stackoverflow.com/questions/16440377/sed-replace-whole-line-when-match-found
nowdg1=`date +'__%Y-%m-%d_%a_%k.%M.%S-%Z'`
sudo sed -i "/$orig_hostname/i # \n# David Gleba kdg54 $nowdg1 ...\n#"  /etc/hosts
#Use double quotes to make the shell expand variables while keeping whitespace:
sudo sed -i "s/.*$orig_hostname.*/127.0.1.1 $fqdn $default_hostname/g" /etc/hosts
cat /etc/hosts
=======

#remove then add # run 0901am everyday
sudo crontab -u pmdsu -l
#remove
sudo crontab -u pmdsu -l | grep -v '/excel2_script.sh'  | sudo crontab -u pmdsu -
#add
sudo crontab -u pmdsu -l | { cat; echo "37 15 * 10 * /var/www/html/cilist/actions/excel2_script.sh"; } | sudo crontab -u pmdsu -
sudo crontab -u pmdsu -l



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function inforef()
{
exit 999
=======
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
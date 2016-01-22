~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2016-01-18[Jan-Mon]14-04PM

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# allow users to reload apache without root access...

# note:

sudo initctl stop flask217; sudo initctl start flask217

sudo service apache2 reload


# i don't think nginx needs to reload, it is flask217 uwsgi upstart service that needs to restart.

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#    service apache2 reload   service nginx reload
# not sure this is the way to go...
# http://stackoverflow.com/questions/525672/is-there-a-way-to-start-restart-stop-apache-server-on-linux-as-non-root-user
# http://www.softpanorama.org/Access_control/Sudo/sudoer_file_examples.shtml




# todo
# better.. create the file in /tmp/dg/websreload , sudo chmod 0440 websreload , copy it into /etc/sudoers.d ...
# http://www.peppertop.com/blog/?p=1015




sudo tee /etc/sudoers.d/websreload <<EOF
# www-data group on all machines can run this command...
%www-data   ALL= NOPASSWD:  /usr/bin/service apache2 reload, /usr/bin/service apache2 restart
# nginx uwsgi
%www-data    ALL=NOPASSWD:  /usr/bin/service nginx reload
#http://askubuntu.com/questions/229809/allow-non-sudo-group-to-control-upstart-job
# use...  sudo initctl stop flask217; sudo initctl start flask217
%www-data ALL= (root) NOPASSWD: /sbin/initctl stop flask217, /sbin/initctl start flask217
EOF
cat /etc/sudoers.d/websreload


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~n


# clean up my junk...
#sudo rm /etc/sudoers.d/apache2reload
#sudo rm /etc/sudoers.d/apache2etcreload

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# try this...

sudo tee /usr/local/bin/webreload.sh <<EOF
#!/usr/bin/env bash
/bin/kill -HUP `cat /var/run/nginx.pid`
sudo service flask217 restart
#
EOF
sudo chmod ugo+x /usr/local/bin/webreload.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



#
sudo rm /etc/sudoers.d/webreload2
# http://stackoverflow.com/questions/3011067/restart-nginx-without-sudo
#sudo tee /etc/sudoers.d/webreload2 <<EOF
#error, why?  pmdsu $HOSTNAME ALL=NOPASSWD:/usr/local/bin/webreload.sh
# ans. all is the hostname. remove $HOSTNAME.
#EOF


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# emperor mode? https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04
# http://www.jeffwidman.com/blog/802/configuring-a-single-nginx-uwsgi-server-to-serve-multiple-flask-apps/

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# fix sudo error
#
# error ..  /etc/sudoers.d/webreload2: syntax error near line 2 sudo: parse error in /etc/sudoers.d/webreload2 near line 2 sudo: no valid sudoers sources found, quitting sudo: unable to initialize policy plugin
# fix..
#noworky... pkexec visudo -f /etc/sudoers.d/webreload2
#  had to boot to recovery and...
#  something here allowed me to rm the file...
#    3  mount -o remount,rw /dev/sda1 /mnt
#   27  mount -o remount,rw /dev/mapper/vamp206b--vg-root /mnt
#   30  mount -o remount,rw /
#   41  rm /etc/sudoers.d/webreload2
#

# noneed.. mount -o remount,rw /dev/sda1 /mnt
# noneed ..  mount -o remount,rw /dev/mapper/vamp206b--vg-root /mnt

# mount -o remount,rw /
# rm /etc/sudoers.d/webreload2
# rm /etc/sudoers.d/websreload


#  sudo rm /etc/sudoers.d/websreload


# best practice to create sudoer.d file, it checks for errors before writing it..
#
#  sudo visudo -f /etc/sudoers.d/websreload

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


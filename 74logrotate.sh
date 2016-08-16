#!/usr/bin/env bash

# http://www.thegeekstuff.com/2010/07/logrotate-examples

sudo tee /etc/logrotate.d/homealbelog <<EOF
/home/albe/log/*.log {
    daily
    size 3K
    missingok
    rotate 32
    compress
    delaycompress
    notifempty
}
EOF


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function notes() {
# begin block comment =============================
: <<'END'

#  notes:


logrotate is usually in cron, but if you want to 
to run it manually..
 sudo /usr/sbin/logrotate /etc/logrotate.conf


/var/log/aptitude {
  rotate 12
  monthly
  compress
  missingok
  notifempty
}  

	create 0640 www-data albe 
	sharedscripts


END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



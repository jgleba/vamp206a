#!/usr/bin/env bash

sudo tee /etc/logrotate.d/homealbelog <<EOF
/home/albe/log/*.log {
	daily
	missingok
	rotate 7
	compress
	delaycompress
	notifempty
	create 0640 www-data albe 
	sharedscripts
}
EOF

#

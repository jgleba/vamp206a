#!/bin/bash

cd /srv/web/metabase

export MB_JETTY_PORT=2012

exec java -jar metabase.jar  >> /home/albe/log/metabasebi.log 2<&1 &




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# https://github.com/metabase/metabase/issues/3063

# https://askubuntu.com/questions/99232/how-to-make-a-jar-file-run-on-startup-and-when-you-log-out

# Create the start and the stop script of your application. Put it on some directory, in our example is:

# Start Script: /usr/local/bin/myapp-start.sh
# Stop Script: /usr/local/bin/myapp-stop.sh
# Each one will provide the instructions to run/stop the app. For instance the myapp-start.sh content can be as simple as the following:

# #!/bin/bash

# java -jar myapp.jar 
# For the stop script it can be something like this:
# #!/bin/bash
# # Grabs and kill a process from the pidlist that has the word myapp

# pid=`ps aux | grep myapp | awk '{print $2}'`
# kill -9 $pid
# Create the following script (myscript) and put it on /etc/init.d.

# /etc/init.d/myscript content:
# #!/bin/bash
# # MyApp
# #
# # description: bla bla

# case $1 in
    # start)
        # /bin/bash /usr/local/bin/myapp-start.sh
    # ;;
    # stop)
        # /bin/bash /usr/local/bin/myapp-stop.sh
    # ;;
    # restart)
        # /bin/bash /usr/local/bin/myapp-stop.sh
        # /bin/bash /usr/local/bin/myapp-start.sh
    # ;;
# esac
# exit 0
# Put the script to start with the system (using SysV). Just run the following command (as root):
# update-rc.d myscript defaults 
# PS: I know that Upstart is great and bla bla, but I preffer the old SysV init system.


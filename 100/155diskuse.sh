#!/usr/bin/env bash
cd
# echo off
set +vx
# echo on
set -vx
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#graphical disk usage du du


#http://www.makeuseof.com/tag/how-to-analyze-your-disk-usage-pattern-in-linux/

sudo apt-get install baobab

cd
mkdir -p 09
cd 09
wget http://xdiskusage.sourceforge.net/xdiskusage.gz
cp xdiskusage.gz xdiskusage.gz.bak
gunzip xdiskusage.gz
cp xdiskusage ~/bin
chmod +x ~/bin/xdiskusage





#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function offline()
{
exit 999
# begin block comment =============================
: <<'END'

comment content
ls

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#
date
#


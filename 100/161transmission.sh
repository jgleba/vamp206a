#!/usr/bin/env bash
cd
# echo off
set +vx
# echo on
set -vx
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#graphical disk usage


#http://www.makeuseof.com/tag/how-to-analyze-your-disk-usage-pattern-in-linux/

sudo apt-get install baobab

cd
mkdir -p 09
cd 09
wget http://xdiskusage.sourceforge.net/xdiskusage.gz
tar -xvf xdiskusage.gz


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


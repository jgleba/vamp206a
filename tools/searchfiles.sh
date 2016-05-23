#!/usr/bin/env bash
cd
# echo off
set +vx
# echo on
set -vx
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function offline()
{
exit 999
# begin block comment =============================
: <<'END'

search..



http://askubuntu.com/questions/208030/search-for-files-with-gui



END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
date
#


#main...

#works...
sudo apt-get install catfish

#do gui visible in lxde. may not work in lxde...
sudo apt-get install  gnome-search-tool



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

find new files

find . -type f | xargs stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head

or

stat --printf="%y %n\n" $(ls -tr $(find * -type f))








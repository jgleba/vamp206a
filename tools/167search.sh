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

newest file last.
stat --printf="%y %n\n" $(ls -tr $(find * -type f))

exclude tmp folder...
stat --printf="%y %n\n" $(ls -tr -Itmp $(find * -type f)) | grep -v tmp/ | tail -n44


i think this lists folders, but not tmp.
ls -tr -Itmp


works..
find $1 -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head 

find $1 -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v tmp/ 

#list 55 newest files. exclude tmp .git 
find $1 -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ | tail -n99

#use other.. worked..
find . /home /var/www /srv/web -iname kami* -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ | tail -n155

#worked.. files only
find . /home/albe/web /var/www /srv/web -iname drail246b* -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ 

#worked.. files only
find . /home/albe/web /var/www /srv/web  -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ | tail -n155

#worked.. files only
find  /home/albe/web /var/www /srv/web  -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ | tail -n155 | grep 246


http://stackoverflow.com/questions/5566310/how-to-recursively-find-and-list-the-latest-modified-files-in-a-directory-with-s


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


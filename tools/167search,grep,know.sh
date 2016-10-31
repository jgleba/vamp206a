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


only files..
locate -b0 drail246 | xargs -r0 ls -aldtr

dirs too..
locate -0 drail246 | xargs -r0 ls -ald --time-style=long-iso |  awk {'print $6" " $7" " $8" "'} | grep -v '.git/' | grep -v tmp/ | sort -n  >~/0/lcout.txt
#awk only cols 6,7,8

dirs too, newest last:
locate -0   drail246   | xargs -r0 ls -ald --time-style=long-iso |  awk {'print $6" " $7" " $1" "  $8" "'} | grep -v '.git/' | grep -v tmp/ | sort -n  >~/0/lcout2.txt

# find all 237 grep mfile..  show all 237 [projects and just show the Gemfile]
locate -0   237    | xargs -r0 ls -ald --time-style=long-iso |  awk {'print $6" " $7" " $1" "  $8" "'} | grep -v '.git/' | grep -v tmp/ | sort -n  |grep mfile

#noworks..
locate -0   237  | grep mfile  | xargs -r0 ls -ald --time-style=long-iso |  awk {'print $6" " $7" " $1" "  $8" "'} | grep -v '.git/' | grep -v tmp/ | sort -n  

works..
locate -0r   237.*mfile    | xargs -r0 ls -ald --time-style=long-iso |  awk {'print $6" " $7" " $1" "  $8" "'} | grep -v '.git/' | grep -v tmp/ | sort -n  

locate -0r   mfile    | xargs -r0 ls -ald --time-style=long-iso |  awk {'print $6" " $7" " $1" "  $8" "'} | grep -v '.git/' | grep -v tmp/ | sort -n  

locate and list newest files last...

locate -0r  actions.ini   | xargs -r0 ls -ald --time-style=long-iso |  awk {'print $6" " $7" " $1" "  $8" "'} | grep -v '.git/' | grep -v tmp/ | sort -n  

locate -0   256    | xargs -r0 ls -ald --time-style=long-iso |  awk {'print $6" " $7" " $1" "  $8" "'} | grep -v '.git/' | grep -v tmp/ | sort -n  


# too long...
locate -0   *   | xargs -r0 ls -ald --time-style=long-iso |  awk {'print $6" " $7" " $1" "  $8" "'} | grep -v '.git/' | grep -v tmp/ | sort -n  


# 4 lines below  > >  look in 3 folders, list newest last...
sudo updatedb
ls
locate -0  /home/albe/web  | xargs -r0 ls -ald --time-style=long-iso |  awk {'print $6" " $7" " $1" "  $8" "'} | grep -v '.git/' | grep -v tmp/ | sort -n  >~/0/lcout99.txt
locate -0  /home/albe/share203  | xargs -r0 ls -ald --time-style=long-iso |  awk {'print $6" " $7" " $1" "  $8" "'} | grep -v '.git/' | grep -v tmp/ | sort -n  >>~/0/lcout99.txt
locate -0  /srv        | xargs -r0 ls -ald --time-style=long-iso |  awk {'print $6" " $7" " $1" "  $8" "'} | grep -v '.git/' | grep -v tmp/ | sort -n >>~/0/lcout99.txt
locate -0  /var/www    | xargs -r0 ls -ald --time-style=long-iso |  awk {'print $6" " $7" " $1" "  $8" "'} | grep -v '.git/' | grep -v tmp/ | sort -n  >>~/0/lcout99.txt
cat ~/0/lcout99.txt | sort -n | tail -n722 | grep  249



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

find  /home/share203 /home/albe/web /var/www/html /srv/web -iname *242* -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ 

#worked.. files only
find . /home/albe/web /var/www /srv/web  -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ | tail -n155

#worked.. files only
find  /home/albe/share203 /home/albe/web /var/www/html /srv/web  -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ | tail -n955 | \
grep 249 > ~/0/lcout.txt

find  /home/albe/web/drail/drail246b   -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ | tail -n955 | grep gitignor > ~/0/lcout.txt

find  .   -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ | tail -n955 | grep   items   > ~/0/lcout.txt

newest files ....
find  /home/albe/share203 /home/albe/web /var/www/html /srv/web  -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ | tail -n654
find    /srv/web  -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ | tail -n454


http://stackoverflow.com/questions/5566310/how-to-recursively-find-and-list-the-latest-modified-files-in-a-directory-with-s

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~






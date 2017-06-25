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


# newest files ....
find  /home/albe/share203 /home/albe/web /var/www/html /srv/web  -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ | tail -n654

find    /srv/web  -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ | tail -n454

# newest files ....
find  .  -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/ | tail -n654



http://stackoverflow.com/questions/5566310/how-to-recursively-find-and-list-the-latest-modified-files-in-a-directory-with-s

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

find . -type f \! -name "*.js"  -print0 | xargs -0 grep -i content


#works..
find . -type f \! -name "*.js"  \! -name "*mdb.min.css"  ! -path "./tmp/*" ! -path "./.git/*" ! -path "./log/*"   -print0 | xargs -0 grep -i content




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


list files recursively by size..

du -ah . | grep -v "/$" | sort -rh > ~/t1.txt

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


grep -ri --exclude-dir={tmp,log,vendor} post *  | grep -vi postgres


eg:
grep -rli --exclude-dir={proc,boot,root,sys} hello /


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Find *.txt file but ignore hidden .txt file such as .vimrc or .data.txt file:

$ find . -type f \( -iname "*.txt" ! -iname ".*" \)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



GREP grep >>


grep -rin --color=always  rail2 .  |    grep -vi -e deploy -e tmp -e .git -e log -e /offline -e readme -e docs -e mtime -e offlin
 
grep -ir --include="*.rb" path

grep -ir --include="*.txt" variab .
grep -ir --include="*.sql" variab .
 grep -ir --include="*.sql" -l declare .

 grep -ir --include="*.sql" -l set.*@ .
 
 

# find crea*.rb containing v and w 
  find .  -iname *crea*\.rb | grep v |grep w
 
find -iname "*\.rb" | grep -i  create

grep -ri 6L_output /var/www/html/django/trakberry 

 grep -ri collection .|grep html |grep -v sql |grep 1ror |grep -v workspace
 grep -ri select .|grep html |grep -v sql |grep 1ror |grep -v workspace

 grep -ri commit .|grep sh|grep git|grep -v sql|grep 27
 _____________
 
 
grep '@example'  -ria  --exclude-dir={tmp,bin,shared,log,nbproject,.git} --exclude={*.sublime-workspace,*.geany,error_log,*.sqlit*}

  >~/0/gout.txt

grep 'devise'  -ria  --exclude-dir={tmp,bin,shared,log,nbproject,.git} --exclude={*.sublime-workspace,*.geany,error_log}

grep 'pundit'  -ria  --exclude-dir={tmp,bin,shared,log,nbproject} --exclude={*.sublime-workspace,*.geany,error_log}

grep 'tempera'  -ria  --exclude-dir={tmp,bin,shared,log,nbproject} --exclude={*.sublime-workspace,*.geany,error_log}


grep 'ude pun'  -ria  --exclude-dir=tmp

grep nt.sqlite3 -ria

grep cif207 -B1 -C1 -r -i -a /etc/apache2

=
sudo find .  -name *.rb | grep _path

sudo find .  -name *themerc* 

=
list lines that end in a  az-09 charater
cat /home/dg/tmp/ij,2009-01-26-1233001792 |grep '[a-zA-Z0-9]'$

= 

>.find

sudo find / -mount -name *phpMyAdmin*

find /mnt/GLEBAD7/c/d  -name *who*.xls
doesn't work on mail.com: gotmail -u glebadavid@iname.com -p ashley -d mail.com -f gleba@sympatico.ca

find /etc -name *version*  ; what distribution of linux am I running?
head /etc/*version*  ; what distribution/version of linux am I running?
and/or
head /etc/*release*  ; what distribution/version of linux am I running?
find /etc -name *version*  ;  head /etc/*version*  ; head /etc/*release*  ;
another: cat /proc/version

find / -type f -iname '????\.??' | xargs grep -i 'word' /dev/null ,  will do a case insensitive file match for all files with 4 chars followed by a literal '.' followed by 2 chars then do a case insensitive search for 'word' on those files. Adding /dev/null below so that grep outputs the filename(s) it found the pattern match in.  Without it, grep will only print out the line containing the match.

find / -mount -name konqueror
find /mydata/mnt/GLEBAD7/c/d  -name *who*.xls

find /amn/redet/c/d/1/  -iname *nuvex*
find /mnt/hdb2/b2/bkjr -iname *.dat*
find /amn/reddq/c/d/  -iname *dnote*  |grep we
find /amn/glebad7/c/  -iname *pcw*
find /amn/glebad7/c/d/  -iname *grub* |grep cd


>.grep

grep "nuvexp" -B1 -C1 -r -i -a /amn/redet/c/d/1/linuxcommand/1
grep "du" -B3 -C3 -r -i -a /amn/redet/c/d/1/linuxcommand/1

grep "ftp" -B3 -C3 -r -i -a /amn/redet/c/d/1/linuxcommand/1

grep "klik" -B0 -C0 -r -i -a /amn/glebad7/c/d/1/0favorites
grep "rani" -B0 -C0 -r -i -a /amn/glebad8/m/3/a*.txt
grep "pcoc" -B3 -C3 -r -i -a /amn/glebad7/c/d/d |grep -B4 -C4 -i xp
grep -B3 -C3 -r 'depend' /opt/kde/share/doc/HTML/en/kpackage
grep -a = binary files are like text.
grep "nmbd" -B0 -C0 -r -i /etc

=

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2017-06-13[Jun-Tue]20-19PM

 grep -ir --include="*.sql" -l declare .

 grep -ir --include="*.sql" -l set.*@ .
 
' 

_____________

# Just show lines matching, no name.
find . -type f -name "database.yml" | xargs grep ENV
 
# Just show names matching.. 
find . -iname 'database.yml' -type f -exec grep -l ENV '{}' \; 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

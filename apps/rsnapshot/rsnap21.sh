#!/usr/bin/env bash
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
set +vx
echo ~----------~----------Startinga `dirname "$0"`/`basename "$0"`
# echo ~----------~----------Startingc  `$(readlink -f $0)` 
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, "$0", "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")
# https://stackoverflow.com/questions/8911724/how-to-find-out-name-of-script-called-sourced-by-another-script-in-bash
echo "from file.... ${BASH_SOURCE[0]}"
echo "${BASH_SOURCE[@]}"  # echo full bashsource array


saynow()
{
date1=$(date +"__%Y.%m.%d_%H.%M.%S")
echo $date1
timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;
# I think with lib.trap.sh the read prompt doesn't show. so..   timeout1=111 ; echo "Press ENTER or wait ${timeout1} seconds...." ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;
  
}

backup1()
{
# create file hello, backup the original file once, and copy it with timestamp.
# An example of how to backup a file before editing it with a script.
# sudo echo $USER
mkdir -p ~/tmp01
file1="$HOME/tmp01/hello"
echo "hello" >$file1 ; echo "foo bar">>$file1
# backup original file once..
if [ ! -f $file1.orig ] ; then  cp -a $file1 $file1.orig ; fi  # do you need sudo cp?
#back it up with a unique name using a timestamp..
 cp $file1 $file1$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt     # do you need sudo cp?
 cp $file1 $file1.bak.txt                                   # do you need sudo cp?
# add line1's after line matching pattern1
pattern1='^hello'
line1=' \ \ #added line 1\n \ #added line 2 = ":8071" '
 sed -i.$(date +"_%Y%m%d_%H%M%S").sedbak.txt "/$pattern1/a $line1" $file1   # do you need sudo sed?
# restore to orig.. sudo cp $file1.orig $file1
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function blockcomment21() {
: <<'BLOCKCOMMENT'

  Purpose:   


BLOCKCOMMENT
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#main...
saynow

# get copy of /etc/rsnapshot.conf for editing.
cd
file1="/etc/rsnapshot.conf"
sudo cp $file1 $file1$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt     # do you need sudo cp?
mkdir ~/work
cp $file1 work/


#




#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
exit 0

end of file comment - this will not excecute.



>21.

install ncdu and look for large folders to exclude from the rsnapshot. Then edit the rsnapshot.conf for the excludes.

sudo ncdu



>31.

sudo apt install rsnapshot


>41.

# copy my rsnapshot.conf to this folder, edit as necessary and copy to /etc..
file1="/etc/rsnapshot.conf"
sudo cp ~/work/rsnapshot.conf $file1 
tail -n95 $file1
ls -la /etc/rsnapsh*


my conf...  https://github.com/dgleba/vamp206a/blob/master/apps/rsnapshot/rsnapshot.conf


>51.

run the alpha snapshot.

sudo rsnapshot alpha


I think...
alpha.0 is always the latest snapshot.
alpha.1 is older


how much space do the backup folders take?

sudo su 
  cd /rsnapshot
sudo du . --max-depth=3  -cxh   | sort -h 


>53.

histb.sh  - store command history..    https://github.com/dgleba/vamp206a/blob/master/bin1/histb.sh

sudo apt install aspell


apps ideas to test system restore.

https://searchdatacenter.techtarget.com/tutorial/Linux-command-line-tools-The-top-50



>61.

excluding folders info...

https://stackoverflow.com/questions/7788046/how-do-you-get-rsync-to-exclude-any-directory-named-cache





>71.

show all files on the system / root folder changed in the last 60 mintues.

This shows you what to restore to put the system back to the way it was earlier.


# list files  --  last 1 hour modified  -- very good and fast.

# sudo find  . -mmin -60 -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/  2>&1 | tee -a /home/albe/find21.txt
# really good.. http://www.liamdelahunty.com/tips/linux_find_exclude_multiple_directories.php
  sudo find  .  -path './sys' -prune -o   -path './proc' -prune -o   -mmin -60 -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -n | cut -d: -f2- | grep -v '.git/' | grep -v tmp/  2>&1 | tee  /home/albe/find21.txt

  or

  num_minutes=59 ;  mkdir -p $HOME/historybackup ; date1=$(date +"__%Y.%m.%d_%H.%M.%S") ; echo $date1 
  
  cd / ; sudo find  .   -path './sys' -prune -o  -path './proc' -prune -o  -path './run' -prune -o -path './rsnapshot' -prune -o  -mmin -$num_minutes  -type f -print0 | xargs -0 stat --printf='%Y:%y \t%A \t%h %U %G \t%s \t%n \n'  | sort -n | cut -d: -f2- | grep -vE '(.git/|tmp/|lxcfs/cgroup)' 2>&1 | tee  $HOME/historybackup/find21_$date1.txt
  
  echo -e '#\n#\n#\n######## ----------------------  Created...\n#\n#\n'   >>$HOME/historybackup/find21_$date1.txt
  cd / ; sudo find  .   -path './sys' -prune -o  -path './proc' -prune -o  -path './run' -prune -o -path './rsnapshot' -prune -o  -cmin -$num_minutes  -type f -print0 | xargs -0 stat --printf='%Y:%y \t%A \t%h %U %G \t%s \t%n \n'  | sort -n | cut -d: -f2- | grep -vE '(.git/|tmp/|lxcfs/cgroup)' 2>&1 | tee -a $HOME/historybackup/find21_$date1.txt
  #
  echo -e '#\n#\n#\n########       Sorted by Name   ----------------------  \n#\n#\n'   >>$HOME/historybackup/find21_$date1.txt
  #
  cd / ; sudo find  .   -path './sys' -prune -o  -path './proc' -prune -o  -path './run' -prune -o -path './rsnapshot' -prune -o  -mmin -$num_minutes  -type f -print0 | xargs -0 stat --printf='%Y:%n \t%y \t%A \t%h %U %G \t%s \n'  | sort -n | cut -d: -f2- | grep -vE '(.git/|tmp/|lxcfs/cgroup)' 2>&1 | tee  -a $HOME/historybackup/find21_$date1.txt
  
  echo -e '#\n#\n#\n######## ----------------------  Created...\n#\n#\n'   >>$HOME/historybackup/find21_$date1.txt
  cd / ; sudo find  .   -path './sys' -prune -o  -path './proc' -prune -o  -path './run' -prune -o -path './rsnapshot' -prune -o  -cmin -$num_minutes  -type f -print0 | xargs -0 stat --printf='%Y:%n \t%y \t%A \t%h %U %G \t%s \n'  | sort -n | cut -d: -f2- | grep -vE '(.git/|tmp/|lxcfs/cgroup)' 2>&1 | tee -a $HOME/historybackup/find21_$date1.txt
  

  
  
>81.

restore:

# example..  rsync -av ./mt/ ./mt2 --delete  # copies folder mt to mt2 and deletes anything in mt2 that is not in mt


# not done... sudo rsync -av /rsnapshot/alpha.0/localhost/usr/  /usr   --delete  



=
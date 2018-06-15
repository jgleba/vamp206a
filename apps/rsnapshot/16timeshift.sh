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


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function blockcomment21() {
: <<'BLOCKCOMMENT'

  Purpose: -  install timeshift


BLOCKCOMMENT
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#main...
saynow


sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt update
sudo apt -y install timeshift


timeshift1() {


sudo timeshift --delete-all
# sudo timeshift --delete --snapshot "2015-01-21_19-28-43"



# http://www.theunixschool.com/2012/06/insert-line-before-or-after-pattern.html# perl -plne 'print "Cygwin" if(/Fedora/);' file
#
file='/etc/timeshift.json'
sudo cp $file $file$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt     # do you need sudo cp?
pat='\"exclude\"'
# first addition line here ends up last in the file. It can have no comma on the end. json file is strict.
in4='\ \ \ \ "/rsnapshot/**"'
in3='\ \ \ \ "/var/snap/lxd/common/lxd/disks/**",'
in2='\ \ \ \ "/home/**",'
# sed '/CLIENTSCRIPT="foo"/a CLIENTSCRIPT2="hello"' file
sudo sed -i "/${pat}/a ${in4}" $file
sudo sed -i "/${pat}/a ${in3}" $file
sudo sed -i "/${pat}/a ${in2}" $file
#
#
# perl -lne "print '    "/rsnapshot/**",' if(/exclude/);" $file
# perl -lne "print ${pat} if(/${ln2}/);" $file
# awk '/Fedora/{print;print "Cygwin";next}1' file
# awk '/${pat}/{print;print ${in2};next}1' file
#
 
 
 
sudo timeshift --create --comments "dg21"



}

#

timeshift1



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
return 1
end of file comment - this will not excecute.


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Notes:
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




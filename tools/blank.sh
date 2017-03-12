#!/usr/bin/env bash

saynow()
{
date1=$(date +"__%Y.%m.%d_%H.%M.%S")
echo $date1
timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;
}

backup1()
{
mkdir -p ~/tmp01
file1="$HOME/tmp01/hello"
echo "hello" >$file1 ; echo "foo bar">>$file1
# backup original file once..
if [ ! -f $file1.orig ] ; then sudo cp $file1 $file1.orig ; fi
# add line1's after line matching pattern1
sudo cp $file1 $file1$(date +"__%Y.%m.%d_%H.%M.%S").latestbak.txt
sudo cp $file1 $file1.bak.txt
pattern1='^hello'
line1=' \ \ #added line 1\n \ #added line 2 = ":8071" '
sudo sed -i.$(date +"_%Y%m%d_%H%M%S").sedbak.txt "/$pattern1/a $line1" $file1
# restore to orig.. sudo cp $file1.orig $file1
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function offline21() {

echo tmp1
exit 999

: <<'BLOCKCOMMENT'

  Purpose:   


BLOCKCOMMENT
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#main...
saynow
#



#!/usr/bin/env bash
set -x

git config --global alias.cap '!func(){ git add . && git commit -aqm "$1" &&
    git pull -q --no-progress && git push -q; }; func'

git config --global alias.ca '!func(){ git add . && git commit -aqm "$1" ; }; func'

git config --global alias.l 'log -p -n 1'
git config --global alias.ld 'log --pretty=format:"%C(yellow)%h\\ %C(green)%ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short --graph'
git config --global alias.lds 'log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'
git config --global alias.tre "log --oneline --decorate --all --graph"

git config --global alias.r 'remote -v'

git config --global alias.s 'status'

git config --global alias.b 'branch'


git config --global alias.co checkout
    

#
# Run this in repo folder...
# sed -i -e '/searchstring/ s/mystring/1/ ; s/mystring/0/' $target # if line contains searchstring, replace mystring with 1 otherwise replace it with 0
target='.git/config'
sed -i -e '/filemode/ s/true/false/' $target  # turn filemode to false..
#
 git config --global core.fileMode false
 git config  --global --replace-all core.filemode false
  git config core.eol lf
  git config core.autocrlf input
#
git config credential.helper store
#Win:
#git config --global credential.helper wincred

set +x
 
 

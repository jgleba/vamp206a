#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  install ruby on rails and Hobo

http://hobocentral.net/tutorials/two-minutes
2016-03-31

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#

# Main: put code here...

sudo apt-get update
sudo apt-get install -y ruby1.9.3 nodejs libsqlite3-dev git
export GEM_HOME=$HOME/.gem
echo "export GEM_HOME=$HOME/.gem" >> .bashrc
PATH="$HOME/.gem/bin:$PATH"
echo 'PATH="$HOME/.gem/bin:$PATH"' >> .bashrc

gem install hobo
#got error... 
# ERROR:  Error installing hobo: 	mime-types-data requires Ruby version >= 2.0.

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#try:
#http://stackoverflow.com/questions/26595620/how-to-install-ruby-2-1-4-on-ubuntu-14-04
#https://gorails.com/setup/ubuntu/14.04


sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

rbenv install 2.1.7
rbenv global 2.1.7
ruby -v

gem install bundler
rbenv rehash


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

gem install hobo


echo $HOBODEV
echo $(date +"%Y.%m.%d_%H.%M.%S")>> ~/hoboenv.info.dg.txt
echo $HOBODEV >> ~/hoboenv.info.dg.txt

unset HOBODEV

cd ~
mkdir -p web
cd web

hobo new noteshobo --setup

cd noteshobo
hobo g resource note name:string body:text
hobo g migration

...Respond to the prompt with 'm'
...then press enter to chose the default filename

rails s


#
date
#


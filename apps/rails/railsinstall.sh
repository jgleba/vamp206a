#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Purpose() {
# begin block comment =============================
: <<'END'

#  Purpose:  install ruby on rails 

END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ; date ; set +vx  ; set -vx ; # echo off, then echo on
#

# Main: put code here...

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#http://stackoverflow.com/questions/26595620/how-to-install-ruby-2-1-4-on-ubuntu-14-04
#https://gorails.com/setup/ubuntu/14.04

sudo apt-get update
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

#rbenv install 2.1.4
#rbenv global 2.1.4
# 2016-05-10 i think 2.3.0 will be ok next time... 
rbenv install 2.3.0
rbenv global 2.3.0

ruby -v

gem install bundler
rbenv rehash

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

gem install rails

gem install uglifier
#http://stackoverflow.com/questions/34420554/there-was-an-error-while-trying-to-load-the-gem-uglifier-bundlergemrequire
sudo apt-get -y install nodejs

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#
date
#
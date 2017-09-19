#!/usr/bin/env bash


#  paste this into the command prompt on the new server..
#    use putty or some ssh terminal that you can paste into..

#    use filezilla - connection over ssh to put files on the server
#      to edit files on the server right click on a file and select edit.
#      if you need to edit files as root, copy it to writable folder and then   
#         copy it over after editing, or just use sudo sed etc to edit the files.

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sudo apt-get update
sudo apt-get -y install git
git clone https://github.com/dgleba/vamp206a.git shc   
  
#---

#edit or put env file   
#put sample data  

#---
    
#run setup.. 
#
#  - install sw  
#  - create data folders and perms  
#  - import data  
cd ; chmod -R +x shc/ ; sudo shc/a2/24start.sh 2>&1 | tee -a v206_start_log$(date +"__%Y-%m-%d_%H.%M.%S").log


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

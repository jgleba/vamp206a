#!/usr/bin/env bash


#  paste this into the command prompt on the new server..
#    use putty or some ssh client that you can paste text into..

#    use filezilla - connection over ssh to put files on the server
#      to edit files on the server right click on a file and select edit.
#      if you need to edit files as root, copy it to writable folder and then   
#         copy it over after editing, or just use sudo sed etc to edit the files.

  
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Step 1


cd
sudo apt-get update
sudo apt-get -y install git mc
#
cd ; git clone https://github.com/dgleba/vamp206a.git shc   



# Step 2
  

#---

# edit or put env file in safe/vne.sh 
# put sample data in /home/$userv/tmp01/htdocs.pmdsdata3.latest.7z if you don't want to use the supplied sample data.

#---
    

# Step 3


#run setup.. 
#  it will..
#  - install sw  
#  - create data folders and permissions  
#  - import sample data  
#



cd ; cd shc ; git pull
cd ; sudo chmod -R +x shc/ ; sudo shc/a2/24start.sh 2>&1 | tee -a v206_start_log$(date +"__%Y-%m-%d_%H.%M.%S").log


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

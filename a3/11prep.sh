#!/usr/bin/env bash


#  paste this into the command prompt on the new server..
#    use putty or some ssh client that you can paste text into..

#    use filezilla - connection over ssh to put files on the server
#      to edit files on the server right click on a file and select edit.
#      if you need to edit files as root, copy it to writable folder and then   
#         copy it over after editing, or just use sudo sed etc to edit the files.

  
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



Step 1

# edit a3/15start.sh. 
#     use the mariadb `columnstore`  stanza or the `regularmysqlserver` stanza. Or edit as you wish.

cd
# if need be, get prompt for sudo password...
sudo ls
#
sudo apt-get update
#
sudo apt-get -y install git mc ncdu 
#
cd ; git clone https://github.com/dgleba/vamp206a.git shc  ; chmod -R +x  shc/





Step 2
  


# 2a.
# edit or put env file in safe/vne.sh on the target machine. (otherwise it will use the supplied env data from a2/21env.sh

# 2b.
# put sample data in /home/$userv/tmp01/htdocs.pmdsdata3.latest.7z if you don't want to use the supplied sample data.




    
    
    

Step 3


#Step 3 and 4 will run setup.. 
#  it will..
#  - install sw  
#  - create data folders and permissions  
#  - import sample data  



cd ; cd shc ; git pull


# docker example..  32init, custom1 is permissions, then 81docker.sh

 
cd ; export fil=31timeshift.sh ; export pth=shc/a3 ;  chmod +x $pth/$fil  ;  $pth/$fil   2>&1 | tee -a ${fil}_log$(date +"__%Y-%m-%d_%H.%M.%S").log;


# Logout and login  [or.. exec bash ] after running this next line so that the settings are activated...

cd ; sudo chmod -R +x shc/ ; sudo shc/a3/32init.sh 2>&1 | tee -a 32init_v206_log$(date +"__%Y-%m-%d_%H.%M.%S").log


## ---------------   logout and login again. or  -  exec bash -----------------------
exec bash




Step 4


cd ; sudo chmod -R +x shc/ ; sudo shc/a3/15start.sh -t regularmysqlserver 2>&1 | tee -a v206_start_log$(date +"__%Y-%m-%d_%H.%M.%S").log

# or

cd ; sudo chmod -R +x shc/ ; sudo shc/a3/15start.sh -t custom1 2>&1 | tee -a v206_start_log$(date +"__%Y-%m-%d_%H.%M.%S").log

# or

cd ; sudo chmod -R +x shc/ ; sudo shc/a3/15start.sh -t docker1 2>&1 | tee -a v206_start_log$(date +"__%Y-%m-%d_%H.%M.%S").log


# or run pieces individually...


cd ; export fil=81docker.sh ; export pth=shc/a3 ;  chmod +x $pth/$fil  ;  $pth/$fil   2>&1 | tee -a ${fil}_log$(date +"__%Y-%m-%d_%H.%M.%S").log;





Step 5


# If you have not used the  mariadb `columnstore` stanza in a3/15start.sh then you can install mariadb columnstore...

# run apps/mcs/mariadbcolumnstore-step1.sh per the usage info at the top of that file..





Step 6



# paste commands from  apps/mcs/mariadbcolumnstore-step2.sh



done


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

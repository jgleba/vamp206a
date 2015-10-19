exit 9
sleep 999
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2015-10-18[Oct-Sun]22-54PM


# back ticks evaluate date when run...
nowdg1=`date +'__%Y-%m-%d_%a_%k.%M.%S-%Z'`
sudo cat <<EOF >> /home/$userv/.bashrc
# -------------------------------------------------------------------
# David Gleba $nowdg1
#write history immediately...
#http://askubuntu.com/questions/67283/is-it-possible-to-make-writing-to-bash-history-immediate
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
#
EOF




# back ticks evaluate date when run...
nowdg1=`date +'__%Y-%m-%d_%a_%k.%M.%S-%Z'`
sudo cat <<EOF >> /home/$userv/tmpf1
# -------------------------------------------------------------------
# David Gleba $nowdg1
#write history immediately...
#http://askubuntu.com/questions/67283/is-it-possible-to-make-writing-to-bash-history-immediate
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
#
EOF


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2015-10-18[Oct-Sun]22-09PM



# determine ubuntu version
ubuntu_version=$(lsb_release -cs)

# check for interactive shell
if ! grep -q "noninteractive" /proc/cmdline ; then
    stty sane

    # ask questions
#    read -ep " please enter the username you are currently logged in as: " -i "$userv" userv
#    read -ep " please enter your preferred hostname: " -i "$default_hostname" hostname
#    read -ep " please enter your preferred domain: " -i "$default_domain" domain
  
fi

# print status message
echo " preparing your server; this may take a few minutes ..."


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# backup hosts settings...

#
sudo cp /etc/hosts /etc/hosts.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
sudo cp /etc/hostname /etc/hostname.bak.$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#why do this stuff again... ???
# set fqdn
fqdn="$default_hostname.$default_domain"
# update hostname
sudo echo "$default_hostname" > /etc/hostname
sudo sed -i "s@ubuntu.ubuntu@$fqdn@g" /etc/hosts
sudo sed -i "s@vamp206b.vamp206b@$fqdn@g" /etc/hosts
sudo sed -i "s@ubuntu@$default_hostname@g" /etc/hosts
sudo sed -i "s@vamp206b@$default_hostname@g" /etc/hosts
#hostname "$default_hostname"



xx1()
{

worked...
curl --digest --user dgleba:x123za https://bitbucket.org/dgleba/vamp198e/get/master.zip -o vamp198e.zip

192.168.88.86

}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2015-10-15[Oct-Thu]09-02AM

#rsync -av  10.4.10.243:/htdocs/ /var/www/html
#
# copy it over to webwork rename it and extract.
cd ~/tmp

#curl -u "domain\username:passwd" smb://server.example.com/share/file.txt
curl -u "stackpole\dgleba:x" smb://10.4.10.243/htdocs/index.html
curl -u "dg:h" smb://192.168.88.92/htdocs/index.html
curl: (1) Protocol smb not supported or disabled in libcurl

noworks:
smbget -u dg -p h  smb://192.168.88.92/htdocs/index.html
works:
cd tmp
#smbget -u dg -p h  smb://redwe/htdocs/index.html
smbget -u dg -p h  smb://REDWE\var\varvamp\files\htdocs-latest.7z

cd /home/$userv/tmp
#curl --digest --user dgleba https://bitbucket.org/dgleba/vamp198e/get/master.zip -o vamp198e.zip
smbget -u dg -p h  smb://REDWE\var\varvamp\files\htdocs-latest.7z
smbget -u=DG -p=h -w=WORKGROUP smb://REDWE/var/varvamp/files/vne.sh



curl -O -u vagrant:vagrant ftp://192.168.3.6/var/varvamp/files/vne.sh
curl  -O -u vagrant:vagrant ftp://10.4.10.241//home/vagrant/configv1.sh
#curl ftp://192.168.3.6/ -u david:dave -T /var/varvamp/files/htdocs.PMDS-DATA.latest.7z

7z x htdocs.7z
rsync -av ~/tmp/htdocs/ /var/www/html
chmod -R 755 /var/www/html 

curl  -O -u vagrant:vagrant ftp://10.4.10.241//home/vagrant/configv1.sh
curl  -O -u vagrant:vagrant ftp://192.168.3.6//home/vagrant/configv1.sh
curl -O -u vagrant:vagrant ftp://192.168.3.6//var/varvamp/files/vne.sh



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


offlinestuff()  {
#exit 8
echo offline
}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  .
-----------------------2015-10-11[Oct-Sun]12-39PM



#get the repo to a folder
cd 
wget -N https://codeload.github.com/dgleba/vamp203/zip/master
#unzip [ -j junk paths - all in one folder ]  
#rm -rf shc
# unzip one folder...  unzip  ~/share203/master vamp203-master/hyperv/* -d ./sh
# unzip to destination.. unzip ~/share203/master -d ./sh
unzip -u ./master
cp -a vamp203-master shc
# make files executable recursively
chmod -R 755 ./shc
chmod -R +x ./shc
cd 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

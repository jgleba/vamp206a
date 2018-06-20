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

  Purpose:   

lxc exec lx21 -- sudo --login --user ubuntu



BLOCKCOMMENT
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#main...
saynow
#



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


back on host...


curl http://10.158.66.164

curl http://10.43.228.29


works.

albe@ubuntu1604a0311:~$ curl http://10.43.228.29
<!DOCTYPE html><title>!</title>
<h1>614a</h1>
<h6>2018-05-30</h6>
<h4>Welcome to nginx webserver on LXD container! </h4>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>
albe@ubuntu1604a0311:~$




~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

albe@ubuntu1604a0311:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:fa:ac:d1 brd ff:ff:ff:ff:ff:ff
    inet 10.4.10.107/18 brd 10.4.63.255 scope global enp0s3
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fefa:acd1/64 scope link
       valid_lft forever preferred_lft forever
4: lxdbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether fe:ae:69:d7:e7:35 brd ff:ff:ff:ff:ff:ff
    inet 10.43.228.1/24 scope global lxdbr0
       valid_lft forever preferred_lft forever
    inet6 fde7:9138:1129:f5f3::1/64 scope global
       valid_lft forever preferred_lft forever
    inet6 fe80::509d:56ff:fe08:7c4b/64 scope link
       valid_lft forever preferred_lft forever
6: vethDN0FJI@if5: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master lxdbr0 state UP group default qlen 1000
    link/ether fe:ae:69:d7:e7:35 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::fcae:69ff:fed7:e735/64 scope link
       valid_lft forever preferred_lft forever
albe@ubuntu1604a0311:~$ ^C





~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



2018-06-18_Mon_10.35-AM


3501 ssh
3502 nginx


export PUBLIC_IP=10.4.10.107 ;
export PubPORT=3502; 
export CONTAINER_IP=10.43.228.29;
export CPORT=80;
#
# export 
#
sudo iptables -t nat -A PREROUTING -d $PUBLIC_IP -p tcp --dport $PubPORT -j DNAT --to $CONTAINER_IP:$CPORT



#old...
#IFAC=enp0s3  PPORT=8980 CPORT=80 PUBLIC_IP=192.168.88.55 CONTAINER_IP=10.168.137.221 \
#sudo -E bash -c 'iptables -t nat -I PREROUTING -i $IFAC -p TCP -d $PUBLIC_IP --dport $PPORT -j DNAT --to-destination $CONTAINER_IP:$CPORT -m comment --comment "forward to the Nginx container"'
#echo $IFAC $PPORT $CPORT $PUBLIC_IP $CONTAINER_IP
#echo $HOME  $USER

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



albe@ubuntu1604a0311:~$ lxc list
+------+---------+---------------------+-----------------------------------------------+------------+-----------+
| NAME |  STATE  |        IPV4         |                     IPV6                      |    TYPE    | SNAPSHOTS |
+------+---------+---------------------+-----------------------------------------------+------------+-----------+
| lx21 | RUNNING | 10.43.228.29 (eth0) | fde7:9138:1129:f5f3:216:3eff:fe2a:c9a6 (eth0) | PERSISTENT | 0         |
+------+---------+---------------------+-----------------------------------------------+------------+-----------+
albe@ubuntu1604a0311:~$


albe@ubuntu1604a0311:~$  sudo iptables -t nat -L PREROUTING
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             st-cmm-143508.stackpole.ca  tcp dpt:3502 to:10.43.228.29:80
DNAT       tcp  --  anywhere             st-cmm-143508.stackpole.ca  tcp dpt:3501 to:10.43.228.29:22
albe@ubuntu1604a0311:~$ sudo apt -y install iptables-persistent



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


curl --verbose  'http://10.4.10.226:3502'
curl  'http://10.4.10.226:3502'

curl  'http://10.4.10.107:3502'

works..

dgleba@PMDS-3HZGD42 /cygdrive/c/n/Dropbox/csd/0-csd/lxd
$ curl  'http://10.4.10.226:3502'
<!DOCTYPE html><title>!</title>
<h1>614a</h1>
<h6>2018-05-30</h6>
<h4>Welcome to nginx webserver on LXD container! </h4>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

dgleba@PMDS-3HZGD42 /cygdrive/c/n/Dropbox/csd/0-csd/lxd



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


>248.



export CONTAINER_IP=10.158.66.164;
export PUBLIC_IP=10.4.10.226 ;
#
export PubPORT=3501; 
export CPORT=22;
#
sudo iptables -t nat -A PREROUTING -d $PUBLIC_IP -p tcp --dport $PubPORT -j DNAT --to $CONTAINER_IP:$CPORT



 sudo iptables -t nat -L PREROUTING

 

 # ref..
# https://github.com/lxc/lxd/issues/2836
# eg:
# iptables -t nat -A PREROUTING -d $PUBLIC_IP -p tcp --dport 2222 -j DNAT --to 10.253.210.198:22




albe@ubuntu1604a0311:~$  sudo iptables -t nat -L PREROUTING
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             st-cmm-143508.stackpole.ca  tcp dpt:3502 to:10.43.228.29:80
DNAT       tcp  --  anywhere             st-cmm-143508.stackpole.ca  tcp dpt:3501 to:10.43.228.29:22
albe@ubuntu1604a0311:~$


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

on another pc in the network...

_____________

 
ssh -p 3501 ubuntu@10.4.10.226

ssh -p 3501 ubuntu@10.4.10.107

works.


dgleba@PMDS-3HZGD42 /cygdrive/c/n/Dropbox/csd/0-csd/lxd
$ ssh -p 3501 ubuntu@10.4.10.226
ubuntu@10.4.10.226s password:

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

ubuntu@lx21:~$

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# https://askubuntu.com/questions/119393/how-to-save-rules-of-the-iptables

sudo apt -y install iptables-persistent


no??
# After its installed, you can save/reload iptables rules anytime:
# sudo /etc/init.d/iptables-persistent save 
# sudo /etc/init.d/iptables-persistent reload

# The installation as described above works without a problem, but the two commands for saving and reloading above do not seem to work with a 16.04 server. The following commands work with that version:

sudo netfilter-persistent save
sudo netfilter-persistent reload



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







}

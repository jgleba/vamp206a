:setlocal enableextensions

c:
mkdir  c:\var\varvamp\files
:cd \var\varvamp\files
md C:\n\Dropbox\csd\serve\vboxyard\vamp206a
cd C:\n\Dropbox\csd\serve\vboxyard\vamp206a
pwd
timeout 15
copy /y lxdehome.tgz c:\var\varvamp\files
copy /y C:\n\Dropbox\csd\serve\vboxyard\vamp206env\vne.sh c:\var\varvamp\files
copy /y C:\n\Dropbox\csd\copyof\CI\backups\htdocs\htdocs.PMDS-DATA.latest.7z c:\var\varvamp\files

:Start ftp
mkdir c:\p2\slimftpd
copy /y  C:\n\Dropbox\csd\serve\vboxyard\vamp206a\SlimFTPd.exe c:\p2\slimftpd
copy /y  C:\n\Dropbox\csd\serve\vboxyard\vamp206a\slimftpd.conf c:\p2\slimftpd
:cd c:\p2\slimftpd
:start slimftpd.exe
start c:\p2\slimftpd\slimftpd.exe


timeout 99
pause

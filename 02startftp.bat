setlocal enableextensions

c:
mkdir  c:\var\varvamp\files
:cd \var\varvamp\files


:Start ftp
mkdir c:\p2\slimftpd
copy /y  C:\n\Dropbox\csd\serve\vboxyard\vamp206a\SlimFTPd.exe c:\p2\slimftpd
copy /y  C:\n\Dropbox\csd\serve\vboxyard\vamp206a\slimftpd.conf c:\p2\slimftpd
c:\p2\slimftpd\slimftpd


timeout 99
pause
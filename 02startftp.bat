:setlocal enableextensions

c:
mkdir  c:\var\varvamp\files
:cd \var\varvamp\files
md C:\n\Dropbox\csd\serve\vboxyard\vamp206a
cd C:\n\Dropbox\csd\serve\vboxyard\vamp206a

pwd
timeout 2
copy /y lxdehome.tgz c:\var\varvamp\files
copy /y C:\n\Dropbox\csd\serve\vboxyard\vamp206env\vne.sh c:\var\varvamp\files
copy /y C:\n\Dropbox\csd\copyof\CI\backups\htdocs\htdocs.PMDS-DATA.latest.7z c:\var\varvamp\files

:Start ftp
mkdir c:\p2\slimftpd
:copy /y  C:\n\Dropbox\csd\serve\vboxyard\vamp206a\SlimFTPd.zip c:\p2\slimftpd
:copy /y  C:\n\Dropbox\csd\serve\vboxyard\vamp206a\SlimFTPd.exe c:\p2\slimftpd
copy /y  C:\n\Dropbox\csd\serve\vboxyard\vamp206a\slimftpd.conf c:\p2\slimftpd

cd c:\p2\slimftpd
:start slimftpd.exe
:http://stackoverflow.com/questions/17546016/how-can-you-zip-or-unzip-from-the-command-prompt-using-only-windows-built-in-ca
: not sure that this is....  expand C:\n\Dropbox\csd\serve\vboxyard\vamp206a\SlimFTPd.zip c:\p2\slimftpd\
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('C:\n\Dropbox\csd\serve\vboxyard\vamp206a\SlimFTPd.zip', 'c:\p2\slimftpd\'); }"

start c:\p2\slimftpd\slimftpd.exe


timeout 0
pause

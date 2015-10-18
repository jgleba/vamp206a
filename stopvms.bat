
:stop vagrant vm machines..

:use git bash to run the bash script in windows host...
cmd /c "sh --login -i -- C:\n\Dropbox\csd\p2\1\vghalt.sh"

:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:turn off all virtualbox vm's after vagrant machines are shutdown...

@echo off
c:
mkdir \temp
vboxmanage list runningvms > \temp\runningvms.txt
FOR /F delims^=^"^ tokens^=1 %%i in (\temp\runningvms.txt) do (
echo '%%i'
vboxmanage controlvm "%%i" acpipowerbutton
)

:

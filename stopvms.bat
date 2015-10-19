setlocal enableextensions
@echo off

:stop vagrant vm machines..

:use git bash to run the bash script in windows host...
echo.
echo shutdown vagrant machines...
echo.
cmd /c "sh --login -i -- C:\n\Dropbox\csd\p2\1\vghalt.sh"

:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:turn off all virtualbox vm's after vagrant machines are shutdown...

echo.
echo shutdown virtual box vm's..
echo.
c:
mkdir \temp

vboxmanage list runningvms > \temp\runningvms.txt
FOR /F delims^=^"^ tokens^=1 %%i in (\temp\runningvms.txt) do (
echo '%%i'
@echo on
echo.
vboxmanage controlvm "%%i" acpipowerbutton
)
echo.
echo ...reached the end of stopmvs.bat file.
timeout 6
echo.
echo.


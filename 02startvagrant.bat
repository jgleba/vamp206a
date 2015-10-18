setlocal enableextensions

c:
mkdir  c:\var\varvamp\files
:cd \var\varvamp\files

call vggs.bat

timeout 9


vagrant up

timeout 99
pause
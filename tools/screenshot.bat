@echo off
@mode 14,1
(echo set oshell = createobject^("Wscript.Shell"^)
 echo Dim strargs
 echo strargs = "cmd /c x.bat"
 echo oshell.Run strargs,0 ,false)>x.vbs
(echo nircmd savescreenshotwin "..\screenshots\Screenshot.png" ^| del x.vbs x.bat)>x.bat
start x.vbs | exit
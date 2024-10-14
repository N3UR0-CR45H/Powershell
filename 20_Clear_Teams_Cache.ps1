$iUsuario = whoami | ForEach-Object { $_ -replace '^.*\\', '' }


echo "Usuário Logado" $iUsuario
""

Remove-Item C:\Users\$iUsuario\AppData\Local\Microsoft\TokenBroker -Force -Recurse 
Remove-Item C:\Users\$iUsuario\AppData\Local\Microsoft\OneAuth -Force  -Recurse 
Remove-Item C:\Users\$iUsuario\AppData\Local\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy -Force -Recurse 
Remove-Item C:\Users\$iUsuario\AppData\Local\Packages\MSTeams_8wekyb3d8bbwe -Force -Recurse 
Remove-Item C:\Users\$iUsuario\AppData\Local\Microsoft\IdentityCache -Force -Recurse 

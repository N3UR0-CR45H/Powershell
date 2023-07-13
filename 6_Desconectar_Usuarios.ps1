$tipo_servidor = Read-Host "
██████╗ ███████╗███████╗ ██████╗ ██████╗ ███╗   ██╗███████╗██╗  ██╗ █████╗  ██████╗     
██╔══██╗██╔════╝██╔════╝██╔════╝██╔═══██╗████╗  ██║██╔════╝╚██╗██╔╝██╔══██╗██╔═══██╗    
██║  ██║█████╗  ███████╗██║     ██║   ██║██╔██╗ ██║█████╗   ╚███╔╝ ███████║██║   ██║    
██║  ██║██╔══╝  ╚════██║██║     ██║   ██║██║╚██╗██║██╔══╝   ██╔██╗ ██╔══██║██║   ██║    
██████╔╝███████╗███████║╚██████╗╚██████╔╝██║ ╚████║███████╗██╔╝ ██╗██║  ██║╚██████╔╝    
╚═════╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝     
                                                                                        
██╗   ██╗███████╗██╗   ██╗ █████╗ ██████╗ ██╗ ██████╗ ███████╗                          
██║   ██║██╔════╝██║   ██║██╔══██╗██╔══██╗██║██╔═══██╗██╔════╝                          
██║   ██║███████╗██║   ██║███████║██████╔╝██║██║   ██║███████╗                          
██║   ██║╚════██║██║   ██║██╔══██║██╔══██╗██║██║   ██║╚════██║                          
╚██████╔╝███████║╚██████╔╝██║  ██║██║  ██║██║╚██████╔╝███████║                          
 ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝ ╚══════╝    

(1) Grupo de Servidores 1
(2) Grupo de Servidores 2
(3) Grupo de Servidores 3
(4) Todos os Servidores
(5) Deslogar Usuários Desconectados de Um Servidor 

Desconectar Usuário de Qual Grupo de Servidores"



$ErrorActionPreference= 'silentlycontinue'




if ($tipo_servidor -eq 1){
Echo "

Grupo de Servidores 1

"
$usuario = Read-Host "Insira o Username para Deslogar"
$userName = $usuario
$sessionId1 = ((quser /server:(SERVIDOR 1)  | Where-Object { $_ -match $userName }) -split ' +')[2] 
$sessionId2 = ((quser /server:(SERVIDOR 2)  | Where-Object { $_ -match $userName }) -split ' +')[2]
$sessionId3 = ((quser /server:(SERVIDOR 3)  | Where-Object { $_ -match $userName }) -split ' +')[2]
$sessionId

echo "Desconectando Usuário..."  

logoff $sessionId1 /server:(SERVIDOR 1)
logoff $sessionId2 /server:(SERVIDOR 2)
logoff $sessionId3 /server:(SERVIDOR 3)
Echo "

Usuário Desconectado

"
}




elseif ($tipo_servidor -eq 2){
Echo "

Grupo de Servidores 2

"
$usuario = Read-Host "Insira o Username para Deslogar"
$userName = $usuario
$sessionId1 = ((quser /server:(SERVIDOR 1) | Where-Object { $_ -match $userName }) -split ' +')[2] 
$sessionId2 = ((quser /server:(SERVIDOR 2) | Where-Object { $_ -match $userName }) -split ' +')[2] 
$sessionId

echo "Desconectando Usuário..."  

logoff $sessionId1 /server:(SERVIDOR 1)
logoff $sessionId2 /server:(SERVIDOR 2)
Echo "

Usuário Desconectado

"
}




elseif ($tipo_servidor -eq 3){
Echo "

Grupo de Servidores 3 

"
$usuario = Read-Host "Insira o Username para Deslogar"
$userName = $usuario
$sessionId1 = ((quser /server:(SERVIDOR 1) | Where-Object { $_ -match $userName }) -split ' +')[2]

echo "Desconectando Usuário..."  

$sessionId

logoff $sessionId1 /server:(SERVIDOR 1)
Echo "

Usuário Desconectado

"
}




elseif ($tipo_servidor -eq 4){
Echo "

Todos os Servidores

"
$usuario = Read-Host "Insira o Username para Deslogar"
$userName = $usuario
$sessionId1 = ((quser /server:(SERVIDOR) | Where-Object { $_ -match $userName }) -split ' +')[2] 
$sessionId2 = ((quser /server:(SERVIDOR) | Where-Object { $_ -match $userName }) -split ' +')[2]
$sessionId3 = ((quser /server:(SERVIDOR) | Where-Object { $_ -match $userName }) -split ' +')[2]
$sessionId4 = ((quser /server:(SERVIDOR) | Where-Object { $_ -match $userName }) -split ' +')[2] 
$sessionId5 = ((quser /server:(SERVIDOR) | Where-Object { $_ -match $userName }) -split ' +')[2] 
$sessionId6 = ((quser /server:(SERVIDOR) | Where-Object { $_ -match $userName }) -split ' +')[2]

echo "Desconectando Usuário..."  

$sessionId

logoff $sessionId1 /server:(SERVIDOR)
logoff $sessionId2 /server:(SERVIDOR)
logoff $sessionId3 /server:(SERVIDOR)
logoff $sessionId4 /server:(SERVIDOR)
logoff $sessionId5 /server:(SERVIDOR)
logoff $sessionId6 /server:(SERVIDOR)

Echo "

Usuário Desconectado

"
}

elseif ($tipo_servidor -eq 5){
Echo "

Deslogar Usuários Com Status de 'Desconectado'

"
$hostname = Read-Host "Insira o nome do Servidor"
if (Test-Connection -ComputerName $hostname -Quiet -Count 1){
    $result = query session /server:$hostname
    $rows = $result -split "`n"
    foreach ($row in $rows) {  
        if ($row -NotMatch "services|console" -and $row -match "Disc") {
            $sessionusername = $row.Substring(19,20).Trim()
            $sessionid = $row.Substring(39,9).Trim()
            Write-Output "Desconectando usuário: $sessionusername"#, $session[2], $session[3]"
            logoff $sessionid /server:$hostname
        }
    }
}
}

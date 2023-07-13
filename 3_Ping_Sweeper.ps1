$ErrorActionPreference= 'silentlycontinue'

$opcao = Read-Host "
██████╗ ██╗███╗   ██╗ ██████╗     ██████╗ ███████╗██████╗ ███████╗
██╔══██╗██║████╗  ██║██╔════╝     ██╔══██╗██╔════╝██╔══██╗██╔════╝
██████╔╝██║██╔██╗ ██║██║  ███╗    ██████╔╝█████╗  ██║  ██║█████╗  
██╔═══╝ ██║██║╚██╗██║██║   ██║    ██╔══██╗██╔══╝  ██║  ██║██╔══╝  
██║     ██║██║ ╚████║╚██████╔╝    ██║  ██║███████╗██████╔╝███████╗
╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═╝╚══════╝╚═════╝ ╚══════╝

Escolha o Modo de Verificação:
(1) Ping Simples
(2) Verifica Modelo, Nome do Equip. e Usuário Logado de Determinado IP
(3) Verifica o MAC do IP Inserido

Opção"

if ($opcao -eq 1){
""
 Echo "Opção 1 - Ping Simples na Rede"
 $octeto_1 = Read-Host "Insira o Primeiro Octeto"
 $octeto_2 = Read-Host "Insira o Segundo Octeto"
 $octeto_3 = Read-Host "Insira o Terceiro Octeto"



 For ($octeto_4=1; $octeto_4 -le 255; $octeto_4++) {
    Write-Progress -Activity "Pingando IP: $ip"

    $ip = ($octeto_1)+'.'+($octeto_2)+'.'+($octeto_3)+'.'+($octeto_4)
    Test-Connection -ComputerName $ip -Count 1 -Delay 1
    } }



if ($opcao -eq 2){
 ""
 Echo "Opção 2 - Pesquisa de Nome, Modelo e Usuário"
 $ip = Read-Host "Insira o IP para Pesquisa"

  Get-WmiObject -ComputerName $ip -Class Win32_ComputerSystem | select-object Name, Model,UserName}


if ($opcao -eq 3){
""
 Echo "Opção 3 - Pesquisa MAC"
 $ip = Read-Host "3. Insira o IP para Pesquisa do MAC"

 #Get-WmiObject -ClassName Win32_NetworkAdapterConfiguration -Filter "IPEnabled='True'" -ComputerName $ip | Select-Object -Property MACAddress, Description}
 getmac /s $ip}
  

$ErrorActionPreference= 'silentlycontinue'

$opcao = Read-Host "
███████╗██████╗  ██████╗  ██████╗ ██╗     ███████╗██████╗ 
██╔════╝██╔══██╗██╔═══██╗██╔═══██╗██║     ██╔════╝██╔══██╗
███████╗██████╔╝██║   ██║██║   ██║██║     █████╗  ██████╔╝
╚════██║██╔═══╝ ██║   ██║██║   ██║██║     ██╔══╝  ██╔══██╗
███████║██║     ╚██████╔╝╚██████╔╝███████╗███████╗██║  ██║
╚══════╝╚═╝      ╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚

Selecione a opção que deseja:
(1) Reiniciar Serviço de Spooler
(2) Listagem de Impressoras do Servidor
(3) Listagem das Portas das Impressoras do Servidor
(4) Apagar Impressões Paradas / Travadas

Opção Selecionada"



if ($opcao -eq 1){
""
 Echo "Opção 1 - Reiniciar Serviço de Spooler Remoto"
 Invoke-Command -ComputerName (Nome Servidor) {Restart-Service -Name Spooler -Force}}
 

if ($opcao -eq 2){
""
 Echo "Opção 2 - Listagem de Impressoras do Servidor"
 Get-PrinterDriver -ComputerName (Nome Servidor) | Select-Object Name, Manufacturer;
 ""
 timeout /t 5
 ""
 pause
 }
 

if ($opcao -eq 3){
""
 Echo "Opção 3 - Listagem das Portas de Impressoras no Servidor"
 Get-PrinterPort -ComputerName (Nome Servidor) | Select-Object Name, Description  
 ""
 timeout /t 5
 ""
 pause
 }


if ($opcao -eq 4){
""
 Echo "Opção 3 - Apagar Impressões Pendentes / Travadas"
 Remove-Item -Path "\\(Nome Servidor)\PRINTERS\*.*"
 ""
 Echo "Processo Realizado"
 ""
 Write-Host -NoNewLine 'Pressione alguma tecla para sair';
 $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
 }

if ($opcao -gt 4){
 ""
 Echo "Opção Inexistente"
 ""
 }


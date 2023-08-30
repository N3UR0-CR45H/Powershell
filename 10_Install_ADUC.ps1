#Set-ExecutionPolicy RemoteSigned

write-output "
 █████╗ ██████╗ ██╗   ██╗ ██████╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     
██╔══██╗██╔══██╗██║   ██║██╔════╝    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     
███████║██║  ██║██║   ██║██║         ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     
██╔══██║██║  ██║██║   ██║██║         ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     
██║  ██║██████╔╝╚██████╔╝╚██████╗    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
╚═╝  ╚═╝╚═════╝  ╚═════╝  ╚═════╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
"

#----------------------------------------- Alterando Registro
""
Get-Item -path HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -RunAsAdministrator
""
write-output "Alterando Registro..."
Set-ItemProperty -Path HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name UseWUServer -Value 0
""
Get-Item -path HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU
""

#----------------------------------------- Reiniciando Serviço do Windows Update
write-output "Reiniciando Serviço do Windows Update..."

net stop wuauserv

Start-Sleep -seconds 7

net start wuauserv
""

#----------------------------------------- Instalando o ADUC
Add-WindowsCapability -Online -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0

write-output "Verificando Instalação do ADUC..."
Get-WindowsCapability -Online | Where-Object {$_.Name -like "RSAT.ActiveDirectory*"}


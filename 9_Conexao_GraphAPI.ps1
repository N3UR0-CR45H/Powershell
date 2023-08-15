#Install-Module -Name ExchangeOnlineManagement -RequiredVersion 3.2.0
#Set-ExecutionPolicy RemoteSigned
#winrm get winrm/config/client/auth
#winrm set winrm/config/client/auth '@{Basic="true"}'
##Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' -Name 'AllowBasic' -Type DWord -Value '1'

#Install-Module -Name ExchangeOnlineManagement
#Get-InstalledModule ExchangeOnlineManagement | Format-List Name,Version,InstalledLocation
#Update-Module -Name ExchangeOnlineManagement


Import-Module Microsoft.Graph.Mail

#------------------------------------------------------- DADOS
$clientID = ""
$tenantName = ""
$ClientSecret = ""
$Username = "e-mail"
$Password = "senha do e-mail"


$ReqTokenBody = @{
    Grant_Type    = "Password"
    client_Id     = $clientID
    Client_Secret = $clientSecret
    Username      = $Username
    Password      = $Password
    Scope         = "https://graph.microsoft.com/.default"
} 

#------------------------------------------------------ TOKEN

$TokenResponse = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$TenantName/oauth2/v2.0/token" -Method POST -Body $ReqTokenBody

write-output $TokenResponse
''
Write-Output "TOKEN FIM"
''
#------------------------------------------------------- IDENTIDADE DE CAIXA DE E-MAIL

Connect-ExchangeOnline -Credential $Credential -ShowBanner:$False

Get-EXOMailbox -Identity (Inserir o E-mail)
''
Write-Output "IDENTIDADE FIM"
''
#------------------------------------------------------- CONEXÂO

Connect-MgGraph -TenantId $tenantName -ClientSecretCredential $ClientSecretCredential
''
Write-Output "CONEXÃO FIM"
''

#------------------------------------------------------ REQUISIÇÃO

$apiUrl = "https://graph.microsoft.com/v1.0/users/(e-mail alvo)/messages"
$Data = Invoke-RestMethod -Headers @{Authorization = "Bearer $($Tokenresponse.access_token)"} -Uri $apiUrl -Method Get
$Users = ($Data | Select-Object Value).Value 

Write-Output $Data

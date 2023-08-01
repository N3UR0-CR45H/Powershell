$UsuarioLista = Get-ADUser -Filter "Enabled -like 'true'" -Properties GivenName,Surname, SAMAccountName, UserPrincipalName, EmailAddress 

$Resultado = $UsuarioLista | ForEach-Object {
    Get-aduser  -identity $_ -properties GivenName,Surname, SAMAccountName, UserPrincipalName, EmailAddress 
}
$Resultado | sort GivenName | ft GivenName,Surname, SAMAccountName, UserPrincipalName, EmailAddress | out-file C:\Downloads\users.txt

<#
ATIVOS
$UsuarioLista =  Get-ADUser -Filter "Enabled -eq 'true'" -Properties GivenName,Surname, SAMAccountName, UserPrincipalName, EmailAddress

$Resultado = $UsuarioLista | ForEach-Object {
    Get-aduser  -identity $_ -properties GivenName,Surname, SAMAccountName, UserPrincipalName, EmailAddress 
}
$Resultado | sort GivenName | ft GivenName,Surname, SAMAccountName, UserPrincipalName, EmailAddress | out-file C:\Downloads\users.txt
#> 

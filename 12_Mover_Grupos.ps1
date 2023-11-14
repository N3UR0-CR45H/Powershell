$iOrigem = "Servidor1"
$iGrupo_Origem = Get-ADGroup "Grupo1" -Server $iOrigem

$iDestino = "Servidor2"
$iGrupo_Destino = Get-ADGroup "Grupo2" -Server $iDestino

#$iCredencial = Get-Credential Servidor1\
#$iCredencial2 = Get-Credential Servidor2\

Add-ADGroupMember -Identity $iGrupo_Destino -Members $iGrupo_Origem  -Credential $iCredencial

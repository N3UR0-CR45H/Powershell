$iDados = Import-Csv -Path "C:\Caminho\Teste.csv" -Delimiter (';')

#Write-Output $iDados 

$iCredencial = Get-Credential Domínio\Usuário #Precisa ser usuário Administrador

foreach ($iGrupo in $iDados) {

    $iGrupoOrigem = Get-ADGroup -Identity $iGrupo.GrupoOrigem  -Server "Servidor1" 
    #echo $iGrupoOrigem
 
    $iGrupoDestino = Get-ADGroup -Identity $iGrupo.GrupoDestino  -Server "Servidor2" 
    #echo $iGrupoDestino

    Add-ADGroupMember -Identity $iGrupoDestino -Members $iGrupoOrigem -Server "Servidor1" -Credential $iCredencial
}

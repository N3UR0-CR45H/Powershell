$iDados = Import-Csv -Path "C:\Diretorio\Teste150.csv" -Delimiter (';')
$iLog = "C:\Diretorio\Log1.txt"

#Write-Output $iDados

$iCredencial = Get-Credential Servidor\Usuario

$iProcessamento = foreach ($iGrupo in $iDados) {

    try {
        $iGrupoOrigem = Get-ADGroup -Identity $iGrupo.GrupoOrigem -Server "Servidor1" -ErrorAction Stop
        #echo $iGrupoOrigem

        $iGrupoDestino = Get-ADGroup -Identity $iGrupo.GrupoDestino -Server "Servidor2" -ErrorAction Stop
        #echo $iGrupoDestino

        Add-ADGroupMember -Identity $iGrupoDestino -Members $iGrupoOrigem -Server "Servidor2" -Credential $iCredencial
    } 
    catch {
        $_ | Out-File -Append -FilePath $iLog
    }
}

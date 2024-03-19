$iHosts = Get-Content "C:\Teste\Hosts.txt"
$iLog = "C:\Teste\Log_Servidores.csv"

Foreach ($iHost in $iHosts) 
{
    Try {
    
        $iResolucao = Resolve-DnsName $iHost -ErrorAction Stop
        $iResolucao | Select-Object Name, IPAddress | Export-Csv -Path $iLog -Append -NoTypeInformation
        
        }

    Catch {

       "Erro na Resolução $iHost : $_" | Out-File -Append $iLog

          }
}

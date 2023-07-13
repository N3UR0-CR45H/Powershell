while($true){
Sleep 10
$diretorio_1 = (Get-ChildItem -File \\pasta\Erro | Measure-Object).Count
$data = Get-Date -Format G

<# Servidor 1 #>
if ($diretorio_1 -ge 1){
 Get-ChildItem -Path \\pasta\Erro -Name
 Move-Item -Path \\pasta\Erro\*.* -Destination \\pasta
 Write-Host "`nDiretorio Teste - Quantidade de Arquivos Movidos:" $diretorio_1 - $data
}
<# FINALIZAÇÃO #>
else{
Write-Host "`rSem Alterações - $data" -NoNewLine
}
}

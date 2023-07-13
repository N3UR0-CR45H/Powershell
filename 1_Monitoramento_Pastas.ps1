
while($true){
Sleep 7 #Timer para alterar o tempo de Refresh
Write-Host "Aguardando Processamento:" (Get-ChildItem -File (Diretório) | Measure-Object).Count
Write-Host "Processando:" (Get-ChildItem -File (Diretório) | Measure-Object).Count
Write-Host "Erros:" (Get-ChildItem -File (Diretório) | Measure-Object).Count
#Write-Host "Quantidade de Processados:" (Get-ChildItem -File (Diretório) | Measure-Object).Count -- Contagem dos Arquivos, sendo mais demorado
""
Write-Host "Último Horário de Modificação:" (Get-ChildItem (Diretório) | Sort-Object LastWriteTime -Descending | Select-Object -First 1).LastWriteTime
#Write-Host "Último Arquivo Processado de Uma Pasta:" (Get-ChildItem (Diretório) | Sort-Object LastWriteTime -Descending | Select-Object -First 1).LastWriteTime
#Write-Host "Último Arquivo Processado de Outra Pasta:" (Get-ChildItem (Diretório) | Sort-Object LastWriteTime -Descending | Select-Object -First 1).LastWriteTime
""
""
""
""
""
""}

<#

Para adição de outros diretórios, é só dar um Ctrl C e Ctrl V nos códigos, e montar conforme deseja. 

#> 
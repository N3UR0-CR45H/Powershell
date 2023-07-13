#install-module posh-ssh  (Instalar esse módulo para uso do SFTP)

#Set-ExecutionPolicy -ExecutionPolicy Unrestricted (Ativar a execução de scripts na máquina local)

New-SFTPSession -ComputerName (IP Servidor) -Credential ('usuário') -Verbose

#Get-SFTPSession Lista Sessão Criada / Sessões Abertas

Set-SFTPLocation -SessionId 0 -Path (diretório) #Muda o diretório de análise
""
""
Echo "Arquivos Encontrados"
Write-Host "Pendente:" (Get-SFTPChildItem -SessionId 0 -Path (diretório) | Measure-Object).Count
Write-Host "Último Horário de Modificação:" (Get-SFTPChildItem -SessionId 0 (diretório) | Sort-Object LastWriteTime -Descending | Select-Object -First 1).LastWriteTime
""
Echo "Conexão Fechada:"
Remove-SFTPSession -SessionId 0 #Fechar Conexão 
""
""
Write-Host -NoNewLine '(Pressione alguma tecla para sair)';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

#Set-ExecutionPolicy -ExecutionPolicy Restricted (Desativar a execução de scripts na máquina local) 

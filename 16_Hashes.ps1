'
██╗  ██╗ █████╗ ███████╗██╗  ██╗███████╗███████╗
██║  ██║██╔══██╗██╔════╝██║  ██║██╔════╝██╔════╝
███████║███████║███████╗███████║█████╗  ███████╗
██╔══██║██╔══██║╚════██║██╔══██║██╔══╝  ╚════██║
██║  ██║██║  ██║███████║██║  ██║███████╗███████║
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝

(1) Ler Hash
(2) Comparar Hashes 
(3) Ler Hashes - Diretório 

Algoritmos Aceitos:  

- SHA1
-- SHA256 (Padrão)
--- SHA384
---- SHA512
----- MD5
'

$iOpcao = Read-Host 'Opção Selecionada '




if ($iOpcao -eq 1){
''
''
Echo "Opção 1 - Ler Hash"
''
    $iCaminho = Read-Host 'Insira o Caminho Completo do Arquivo '

    Get-FileHash $iCaminho
}




if ($iOpcao -eq 2){
''
''
Echo "Opção 2 - Comparar Hashes"
''
    $iCaminho  = Read-Host 'Insira o Caminho Completo do Arquivo '
    $iCaminho_2 = Read-Host 'Insira o Caminho Completo do Segundo Arquivo '

    Get-FileHash $iCaminho
    Get-FileHash $iCaminho_2

    if($iCaminho -ne $iCaminho_2)
    {
    ''
    echo 'Hashes Diferentes'
    }

    if($iCaminho -eq $iCaminho_2)
    {
    ''
    echo 'Hashes Iguais'
    }

}




if ($iOpcao -eq 3){
''
''
Echo "Opção 3 - Hashes de um Diretório"
''
    $iCaminho  = Read-Host 'Insira o Caminho Completo do Diretório '

    $iArquivos = Get-ChildItem $iCaminho -File | ForEach-Object {
        $iHash = Get-FileHash $_.FullName -Algorithm SHA256
        [PSCustomObject]@{
            FileName = $_.Name
            Hash = $iHash.Hash
            }
    }
    
}
$iArquivos

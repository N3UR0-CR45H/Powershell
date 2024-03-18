$iDados = Import-Csv -Path "C:\Users\Tste\Dados.csv" -Delimiter (';')
$iLog = "C:\Users\Teste\Log1.txt"

#Write-Output $iDados

foreach ($iUsuario in $iDados) {

    $User = $iUsuario.Usuario #A coluna dos ID's precisa ter o "Usuario" como cabeçalho

    if (Get-ADUser -Filter {Name -eq $User}) {

        Set-ADUser -Identity $User -Title $iUsuario.FUNCAO
        Write-Host "Usuário $SSOId - Título: $iUsuario.FUNCAO Mudança de Título Realizada."

    } 
    else {
        Write-Host "Usuário $SSOId Não Encontrado no AD."
    }
}

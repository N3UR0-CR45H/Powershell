$iServidorSMTP = 'smtp-mail.outlook.com' 
$iPorta = 587     
          
$iRemetente = 'teste@teste.com.br'  
$iDestinatario = 'teste2@teste.com.br'  
  
    $iAssunto = 'teste'          
    $iCorpo = 'teste' 

    #$iAnexo = "C:\teste\teste.txt"      
    #$iAnexar = new-object Net.Mail.Attachment($iAnexo)
    #$iMensagem.Attachments.Add($iAnexar)


$iCliente = New-Object Net.Mail.SmtpClient($iServidorSMTP, $iPorta)
$iCliente.EnableSsl = $true      
 
$iCliente.Credentials = New-Object System.Net.NetworkCredential(“teste@teste.com.br”, “testetestesenha”); #Precisa ter as credenciais de um usuário válido.
$iCliente.Send($iRemetente, $iDestinatario, $iAssunto, $iCorpo)

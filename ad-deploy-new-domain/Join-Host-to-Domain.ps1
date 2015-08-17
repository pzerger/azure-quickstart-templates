# Domain Join of Host to contoso.corp domain for testing purposes.

$domain   = "contoso.corp"
$username = "CONTOSO\adadmin" 
$password = "P@ssw0rd1!" | ConvertTo-SecureString -asPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential -Restart



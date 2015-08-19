<# This Script does the following:
- Retrieves the Chef Server SSL Certificate using knife.
- Copies the Chef Server Certificate to the the Chef Client 'trusted_certs' directory.
- File(s) are created in 'C:\Windows\Temp' stating whether the actions listed above were successful or not.
#>

# Retrieving the Chef Server SSL Certificate using knife.
cd "C:\chef\.chef"
knife ssl fetch

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_Chef_Server_SSL_Cert_Retrieved_Successfully.txt").Close()
	}	
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_Chef_Server_SSL_Cert_Retrieval_Failed.txt").Close()
	}

# Copying the Chef Server Certificate to the the Chef Client 'trusted_certs' directory
cp "C:\chef\.chef\trusted_certs\*" "C:\chef\trusted_certs\"

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_Chef_Server_SSL_Cert_Copy_To_Chef_Client_Dir_Successfully.txt").Close()
	}	
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_Chef_Server_SSL_Cert_Copy_To_Chef_Client_Dir_Failed.txt").Close()
	}
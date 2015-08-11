<# This Script does the following:
- Installs AD and DNS Management Tools
- Disables IE ESC for Administrators
- Adds a DNS Record for the Chef Server in AD
- WinRM Unencrypted Traffic Enabled
- The Directory C:\chef\trusted_certs is created
- File is created in C:\Windows\Temp stating whether these actions were successful or not.
#>


# Installing Active Directory Management Tools
Install-WindowsFeature -Name RSAT-AD-Tools,RSAT-AD-PowerShell,RSAT-ADDS,RSAT-DNS-Server

# Creating Text File stating Installation was Completed.
$ADToolsInstallComplete = [System.IO.File]::Create("C:\Windows\Temp\AD_Tools_Install_Complete.txt").Close()

# Disabling IE ESC for Administrators on Target Host. UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
$Disable_IE_ESC_Admins = New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}" -Name IsInstalled -Value 0 -Force

if ($Disable_IE_ESC_Admins.IsInstalled -eq 0)
	{
		$ADToolsInstallComplete = [System.IO.File]::Create("C:\Windows\Temp\IE_ESC_For_Admins_Disabled_Sucessfully.txt").Close()
	}
	
if ($Disable_IE_ESC_Admins.IsInstalled -ne 0)
	{
		$ADToolsInstallComplete = [System.IO.File]::Create("C:\Windows\Temp\IE_ESC_For_Admins_Disabled_Failed.txt").Close()
	}

# Adding DNS Record for Chef Server
Add-DnsServerResourceRecordA -Name "CHEFSRV" -ZoneName "contoso.corp" -AllowUpdateAny -IPv4Address "10.0.2.4"

# Setting WinRM to allow Unencrypted traffic
$AllowUnencrypted = winrm set winrm/config/service '@{AllowUnencrypted="true"}'

If ($?)
	{
		$ADToolsInstallComplete = [System.IO.File]::Create("C:\Windows\Temp\WinRM_Allow_Unencrypted_Enabled_Sucessfully.txt").Close()
	}
If (!$?)
	{
		$ADToolsInstallComplete = [System.IO.File]::Create("C:\Windows\Temp\WinRM_Allow_Unencrypted_Enabled_Failed.txt").Close()
	}

# Creating C:\Chef\trusted_certs directory.
[System.IO.Directory]::CreateDirectory("C:\chef\trusted_certs")

If ($?)
	{
		$ADToolsInstallComplete = [System.IO.File]::Create("C:\Windows\Temp\Create_Chef_Directories_Sucess.txt").Close()
	}
If (!$?)
	{
		$ADToolsInstallComplete = [System.IO.File]::Create("C:\Windows\Temp\Create_Chef_Directories_Failed.txt").Close()
	}
	

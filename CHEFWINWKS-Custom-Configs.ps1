<# This Script does the following:
- Installs AD and DNS Management Tools.
- Disables IE ESC for Administrators.
- Sets WinRM Unencrypted Traffic to enabled and Authentication to Basic.
- Creates 'C:\Chef\trusted_certs' directory for the Chef Client.
- Creates 'chef-repo' and 'cookbooks' Directory for ChefDK.
- Creates '.chef' and 'trusted_certs' Directories for ChefDK.
- Creates the 'C:\GitHub' Directory where the downloaded 'learn_chef' repo will reside.
- Downloads and Installs ChefDK.
- Download the 'knife.rb' for this Environment from GitHub.
- Downloads and Installs Notepad++.
- Downloads GitHub for Windows.
- File(s) are created in 'C:\Windows\Temp' stating whether the actions listed above were successful or not.
#>


# Installing Active Directory Management Tools
Install-WindowsFeature -Name RSAT-AD-Tools,RSAT-AD-PowerShell,RSAT-ADDS,RSAT-DNS-Server

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_AD_Tools_Install_Complete.txt").Close()
	}
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_AD_Tools_Install_Complete.txt").Close()
	}

# Disabling IE ESC for Administrators on Target Host. UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
$Disable_IE_ESC_Admins = New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}" -Name IsInstalled -Value 0 -Force

if ($Disable_IE_ESC_Admins.IsInstalled -eq 0)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_IE_ESC_For_Admins_Disabled_Sucessfully.txt").Close()
	}
	
if ($Disable_IE_ESC_Admins.IsInstalled -ne 0)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_IE_ESC_For_Admins_Disabled_Failed.txt").Close()
	}

# Setting WinRM to allow Unencrypted traffic and setting Authentication to Basic
$AllowUnencrypted = winrm set winrm/config/service '@{AllowUnencrypted="true"}'

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_WinRM_Allow_Unencrypted_Enabled_Sucessfully.txt").Close()
	}
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_WinRM_Allow_Unencrypted_Enabled_Failed.txt").Close()
	}

$AllowBasicAuth = winrm set winrm/config/service/auth '@{Basic="true"}'

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_WinRM_Allow_Basic_Auth_Enabled_Sucessfully.txt").Close()
	}
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_WinRM_Allow_Basic_Auth_Enabled_Failed.txt").Close()
	}

# Creating 'C:\Chef\trusted_certs' directory for the Chef Client.
[System.IO.Directory]::CreateDirectory("C:\chef\trusted_certs")

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_Create_Chef_Client_Directories_Sucess.txt").Close()
	}
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_Create_Chef_Client_Directories_Failed.txt").Close()
	}

# Creating 'chef-repo' and 'cookbooks' Directory for ChefDK.
[System.IO.Directory]::CreateDirectory("C:\chef\chef-repo\cookbooks")

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_Create_ChefDK_Repo_Directories_Sucess.txt").Close()
	}
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_Create_ChefDK_Repo_Directories_Failed.txt").Close()
	}

# Creating '.chef' and 'trusted_certs' Directories for ChefDK
[System.IO.Directory]::CreateDirectory("C:\chef\.chef\trusted_certs")	

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_Create_ChekDK_Certs_Directories_Sucess.txt").Close()
	}
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_Create_ChekDK_Certs_Directories_Failed.txt").Close()
	}	

# Creating the 'C:\GitHub' Directory where the downloaded 'learn_chef' repo will reside.
[System.IO.Directory]::CreateDirectory("C:\GitHub")	

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_Create_GitHub_Directory_Sucess.txt").Close()
	}
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_Create_GitHub_Directory_Failed.txt").Close()
	}	

# Download Chef DK Kit
$ChefDK_WebClient = New-Object System.Net.WebClient
$ChefDK_URI       = "https://opscode-omnibus-packages.s3.amazonaws.com/windows/2008r2/x86_64/chefdk-0.7.0-1.msi"
$ChefDK_File      = "C:\Windows\Temp\chefdk-0.7.0-1.msi"
$ChefDK_WebClient.DownloadFile($ChefDK_URI,$ChefDK_File)

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_ChefDK_Downloaded_Successfully.txt").Close()
	}	
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_ChefDK_Download_Failed.txt").Close()
	}

# Install the Chef DK Kit
msiexec.exe /i C:\Windows\Temp\chefdk-0.7.0-1.msi /quiet /norestart

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_ChefDK_Installed_Successfully.txt").Close()
	}	
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_ChefDK_Install_Failed.txt").Close()
	}

# Download the 'knife.rb' for this Environment from GitHub
$ChefKnifeConfig_WebClient = New-Object System.Net.WebClient
$ChefKnifeConfig_URI       = "https://raw.githubusercontent.com/starkfell/azure-quickstart-templates/master/learn_chef/knife.rb"
$ChefKnifeConfig_File      = "C:\chef\.chef\knife.rb"
$ChefKnifeConfig_WebClient.DownloadFile($ChefKnifeConfig_URI,$ChefKnifeConfig_File)

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_knife.rb_Downloaded_Successfully.txt").Close()
	}	
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_knife.rb_Download_Failed.txt").Close()
	}

# Download Notepad++
$Notepad_WebClient = New-Object System.Net.WebClient
$Notepad_URI       = "https://notepad-plus-plus.org/repository/6.x/6.8.1/npp.6.8.1.Installer.exe"
$Notepad_File      = "C:\Windows\Temp\npp.6.8.1.Installer.exe"
$Notepad_WebClient.DownloadFile($Notepad_URI,$Notepad_File)

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_NotepadPlusPlus_Downloaded_Successfully.txt").Close()
	}	
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_NotepadPlusPlus_Download_Failed.txt").Close()
	}

# Install Notepad++
C:\Windows\Temp\npp.6.8.1.Installer.exe /S

If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_NotepadPlusPlus_Installed_Successfully.txt").Close()
	}	
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_NotepadPlusPlus_Install_Failed.txt").Close()
	}

# Download GitHub for Windows
$GitHub_WebClient = New-Object System.Net.WebClient
$GitHub_URI       = "https://github-windows.s3.amazonaws.com/GitHubSetup.exe"
$GitHub_File      = "C:\Windows\Temp\GitHubSetup.exe"
$GitHub_WebClient.DownloadFile($GitHub_URI,$GitHub_File)
	
If ($?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_GitHub_for_Windows_Downloaded_Successfully.txt").Close()
	}	
If (!$?)
	{
		[System.IO.File]::Create("C:\Windows\Temp\_GitHub_for_Windows_Download_Failed.txt").Close()
	}
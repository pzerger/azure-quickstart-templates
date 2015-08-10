# Installing Active Directory Management Tools
Install-WindowsFeature -Name RSAT-AD-Tools,RSAT-AD-PowerShell,RSAT-ADDS,RSAT-DNS-Server

# Creating Text File stating Installation was Completed.
$ADToolsInstallComplete = [System.IO.File]::Create("C:\Windows\Temp\AD_Tools_Install_Complete.txt").Close()
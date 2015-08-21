# Learn Chef Deployment

| Deploy to Azure  | Author                          | Template Name   |
|:-----------------|:--------------------------------| :---------------| :---------------|
| <a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fstarkfell%2Fazure-quickstart-templates%2Fmaster%2Flearn_chef%2Fazuredeploy.json" target="_blank"><img src="http://azuredeploy.net/deploybutton_small.png"/></a> | [starkfell](https://github.com/starkfell) | Learn Chef (https://github.com/starkfell/azure-quickstart-templates/tree/master/learn_chef)


This template provisions an environment in Azure for learning Chef.
 
 The following resources are part of this deployment:
 - Ubuntu Server 14.04 running Chef Server 12
 - Windows Server 2012 R2 running as a Domain Controller
 - Windows Server 2012 R2 non-domain-joined with ChefDK Installed
 - Windows Server 2012 R2 non-domain-joined for use as a Sandbox

This template requires the following parameters which are preconfigured:


| Name             | Description                     |
|:-----------------| :--------------------------------|
| LOCATION | Location name where the corresponding Azure artifacts will be created |
| ADDRESSPREFIX | Default Address Prefix for the entire Environment |
| DCSUBNETPREFIX | Address Prefix for Hosts in the same Subnet as the Domain Controller |
| CHEFSUBNETPREFIX | Address Prefix for Hosts in the same Subnet as the Chef Server |
| CONTOSOSYSCTRAPPTYPE | More on this later |
| CONTOSOSYSCTRAPPLOCATION | Physical Location where the Environment will be deployed |
| ADDCNAME | Name of the Domain Controller |
| CHEFSRVNAME | Name of the Chef Server |
| CHEFWINWKSNAME | Name of the Chef Windows Workstation |
| ADDCADMINUSERNAME | Admin Username of the Domain Controller |
| CHEFSRVADMINUSERNAME | Admin Username of the Chef Server |
| CHEFWINWKSADMINUSERNAME | Admin Username of the Chef Windows Workstation |
| ADDCADMINPASSWORD | Admin Password of the Domain Controller |
| CHEFSRVADMINPASSWORD | Admin Password of the Chef Server |
| CHEFWINWKSADMINPASSWORD | Admin Password of the Chef Windows Workstation |
| ADDCWINDOWSOSVERSION | Windows OS Version that the Domain Controller is running |
| UBUNTUOSVERSION | Ubuntu OS Version that the Chef Server is running |
| CHEFWINWKSWINDOWSOSVERSION | Windows OS Version that the Chef Windows Workstation is running |
| ADPUBIPDNSNAME | Publicly accessible FQDN associated with the Domain Controller |
| CHEFSRVPUBIPDNSNAME | Publicly accessible FQDN associated with the Chef Server |
| CHEFWINWKSPUBIPDNSNAME | Publicly accessible FQDN associated with the Chef Windows Workstation |
| storage account  | Unique  Name for the Storage Account where the Virtual Machine's disks will be placed |
| dnsName | DNS name for the VM |
| adminUsername  | Admin user name for the Virtual Machines  |
| adminPassword  | Admin password for the Virtual Machine  |
| image Publisher <Optional> | Publisher for the OS image, the default is Canonical|
| image Offer <Optional> | The name of the image offer. The default is Ubuntu |
| image SKU  <Optional> | Version of the image. The default is 14.04.2-LTS |
| vm Size  <Optional> | Size of the Virtual Machine. The default is Standard_A0 |

# Test AD Deployment

| Deploy to Azure  | Author                          | Template Name   |
|:-----------------|:--------------------------------| :---------------| :---------------|
| <a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fstarkfell%2Fazure-quickstart-templates%2Fmaster%2Fad-deploy-new-domain%2Fazuredeploy.json" target="_blank"><img src="http://azuredeploy.net/deploybutton_small.png"/></a> | [starkfell](https://github.com/starkfell) | This is a Test AD Deployment (https://github.com/starkfell/azure-quickstart-templates/tree/master/ad-deploy-new-domain)


 This template provisions an AD Environment.

 This template requires the following parameters:


| Name             | Description                     |
|:-----------------| :--------------------------------|
| location | Location name where the corresponding Azure artifacts will be created |
| storage account  | Unique  Name for the Storage Account where the Virtual Machine's disks will be placed |
| dnsName | DNS name for the VM |
| adminUsername  | Admin user name for the Virtual Machines  |
| adminPassword  | Admin password for the Virtual Machine  |
| image Publisher <Optional> | Publisher for the OS image, the default is Canonical|
| image Offer <Optional> | The name of the image offer. The default is Ubuntu |
| image SKU  <Optional> | Version of the image. The default is 14.04.2-LTS |
| vm Size  <Optional> | Size of the Virtual Machine. The default is Standard_A0 |

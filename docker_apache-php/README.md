# Deployment of Apache Server Container using Docker Compose

| Deploy to Azure  | Author                          | Template Name   |
|:-----------------|:--------------------------------| :---------------| :---------------|
| <a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fstarkfell%2Fazure-quickstart-templates%2Fmaster%2Fdeploy_apache_on_docker%2Fdeploy_apache_on_docker%2FTemplates%2Fdeploy_apache_on_docker.json" target="_blank"><img src="http://azuredeploy.net/deploybutton_small.png"/></a> | [starkfell](https://github.com/starkfell) | Deploy Apache on Docker (https://github.com/starkfell/azure-quickstart-templates/tree/master/deploy_apache_on_docker)

This template provisions an Ubuntu Server 14.04 VM with Docker (using the [Docker Extension][ext]) and then starts an Apache Server instance listening on port 80. 
The container is created using the [Docker Compose][compose] capabilities of the [Azure Docker Extension][ext].

This template can be deployed using a different **Apache Docker Image** from **Docker Hub** other than **starkfell/apache-php**; however,
your results will vary based upon the configuration of the Image you use.


This template requires the following parameters which are preconfigured:


| Name             | Description                     |
|:-----------------| :--------------------------------|
| LOCATION | Physical Location where the Docker Server will be deployed |
| ADDRESSPREFIX | Default Address Prefix for the entire Environment |
| DOCKERSUBNETPREFIX | Address Prefix for Hosts in the same Subnet as the Docker Host |
| DOCKERSUBNETPREFIX | Address Prefix for Hosts in the same Subnet as the Docker Server |
| CONTOSODOCKERSTORAGENAME | Name of the Storage Container where the Docker Server will be running on |
| CONTOSODOCKERSTORAGETYPE | The Type of Redundant (or lack thereof) Storage Type to use |
| DOCKERSRVNAME | Name of the Docker Server |
| DOCKERSRVADMINUSERNAME | Admin Username of the Docker Server |
| DOCKERSRVADMINPASSWORD | Admin Password of the Docker Server |
| UBUNTUOSVERSION | Ubuntu OS Version that the Docker Server is running |
| DOCKERSRVPUBIPDNSNAME | Publicly accessible FQDN associated with the Docker Server |
| DOCKERSRVNICIPADDRESS | Static IP Address of the Docker Server NIC Card |
| DOCKERIMAGE | The Name of the Docker Image to be pulled from Docker Hub |
| DOCKERPORTS | The Network Port(s) that will be forwarded from the Container to the Docker Host |

[ext]: https://github.com/Azure/azure-docker-extension
[compose]: https://docs.docker.com/compose
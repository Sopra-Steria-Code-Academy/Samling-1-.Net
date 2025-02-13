# Infrastructure
The infrastructure is documented and defined in the Terraform files in this folder.
All changes to the infrastructure should be done by updating the tf-files and deploying the change using the pipelines

## Naming convention
We have tried to follow best practices as described [here](https://cloud.google.com/docs/terraform/best-practices-for-terraform#naming-convention) and [here](https://www.terraform-best-practices.com/naming) for Terraform code.

Naming conventions for Azure resources follow the format as described by Microsoft [here](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming), which is ``resource-application-env-instance``, using abbreviations as suggested [here](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations).

Example:
A keyvault belonging to the test environemnt of the ReinHub-Api application, should be named ``kv-reinhub-api-test``.

## Common issues
The repository has 3 pipelines that run in GitHub when you create a Pull Request:
- TF-drift - detects if there are any changes between existing infrastructure and Terraform definition
- TF-plan-apply - creates an execution plan and then applies it (when PR is merged to main branch)
- TF-unit-test - runs quick check on tf-files to validate them and check formatting

Some of the pipelines will break if the TF-files have some formatting issues.
It is a easy way to solve this issue before pushing the code:
1. Download the terraform.exe file from [HashiCorp](https://developer.hashicorp.com/terraform/install)
	- Then copy it to preffered folder 
	- Add this folder to enviroment variable PATH 
2. Or download [Chocolatey](https://chocolatey.org/install) and run command	- choco install terraform
3. Run the following command:
	- .\terraform init
	- .\terraform validate
	- .\terraform fmt -recursive
4. If there is an issue in one of the TF-files it will be automatically fixed and list of fixed files will be shown as the output from the command
5. Some IDE extensions (like HashiCorp Terraform for VS Code) will format files on save and provide intellisense 

## Manual steps
At the moment of writing this document Terraform cannot handle following settings, that needs to be set manually:
- Azure SQL Server -> Networking -> check the "Allow Azure services and resources to access this server" box
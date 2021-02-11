# Assignment-Thoughtworks
This is project is use to create a kubernetes cluster on Azure and deploy Wordpress application on top of it. There are few things needs to be configured before one can use this project.

RUNNER:
It's the agent which will take care of running the job. One can use runner provided by Github Actions or can use self managed runner. To configure a runner follow these steps:

1. Install terraform
2. Install kubernetes
3. Install jq

AZURE PORTAL:
One needs to have a storage account and a service principal account before hand to continue with the setup. Service account will be used to deploy kubernetes cluster and storage account will be used for spinning a container which will hold the .tfstat file.

1. Create Service Principal Account
2. Create Storage Account
3. Deploy a container using storage account.

Github Actions:
Github Actions is used for repository management. It also provide a way(workflow) to configure a declarative pipeline.
Steps to configure Project in Github Actions:
1. Follow instructions mentioned under 'settings -> Action' section to add self hosted runner to Github Actions.
3. Add below listed secrets in 'settings -> Secret' section:
   1. AZURE_STORAGE_ACCOUNT_NAME
   2. MYSQL_PASSWORD(sql database password of Worlpress application)
   3. SERVICE_PRINCIPAL_APPID
   4. SERVICE_PRINCIPAL_PASSWORD
   5. STORAGE_ACCOUNT_ACCESS_KEY


The project's workflow is declared in such way so that a new job will be triggered on every commit.

There are 2 stages configured: kubernetes cluster deployment and application deployment on top of cluster..
  

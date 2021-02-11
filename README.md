# Assignment-Thoughtworks
This is project is use to create a kubernetes cluster on Azure and deploy Wordpress application on top of it. There are few things needs to be configured before one can use this project.

RUNNER:
It's the agent which will take care of running the job. One can use runner provided by Github Actions or can use self managed runner. To configure a runner follow these steps:

1. Install terraform
2. Install kubernetes
3. Install jq

#####################################################################
AZURE PORTAL:
One needs to have a storage account and a service principal account before hand to continue with the setup. Service account will be used to deploy kubernetes cluster and storage account will be used for spinning a container which will hold the .tfstat file.

1. Create Service Principal Account
2. Create Storage Account
3. Deploy a container using storage account.

####################################################################
Github Actions:
Github Actions is used for repository management. It also provide a way(workflow) to configure a declarative pipeline.
Steps to configure Project in Github Actions:
1. Follow instructions mentioned under 'settings -> Action' section to add self hosted runner to Github Actions.
3. Add below listed secrets in 'settings -> Secret' section:
   1. AZURE_STORAGE_ACCOUNT_NAME
   2. MYSQL_PASSWORD(sql database password of Wordpress application)
   3. SERVICE_PRINCIPAL_APPID
   4. SERVICE_PRINCIPAL_PASSWORD
   5. STORAGE_ACCOUNT_ACCESS_KEY

######################################################################
The project's workflow is declared in such way so that a new job will be triggered on every commit. The workflow file is at path: .github/workflows/terraform.yml

#######################################################################
There are 2 stages configured: Terraform and Application.

Terraform: As part of this stage we deploy kubernetes cluster in Azure. Files to modify as part of this part:
variables.tf: 
  1. client_id: Service Principal AppID
  2. agent_count: number of nodes
  3. ssh_public_key: ssh public key to sign in to worker nodes
  4. dns_prefix: dns prefix for cluster
  5. cluster_name: Kubernetes cluster name
  6. resource_group_name: Name of the resources group the resources will be part of
  7. location: Location of nodes

output.tf: As part of this file we can add values which we want as an output once the cluster is created.

Application: As part of this stage we deploy application on top of cluster. Files to modify as part of this part:
mysql-deployment.yaml: This is a yaml file to deploy a Headless service, create a Persistent Volume and deploy a mysql container

wordpress-deployment.yaml: As part of this yaml file we deploy a Loadbalancer Service, create a Persistent Volume and deploy wordpress container using Deployment config
  

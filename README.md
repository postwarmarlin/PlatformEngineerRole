##Platform Engineer Role Task##

You’re tasked with setting up basic infrastructure for a new internal tool on Azure. Your goal is to provision a minimal, secure, and well-documented environment using Terraform.

Required Resources:
Resource Group
Azure App Service Plan
Azure Web App configured to:
Use a runtime stack of your choice (e.g., Node.js, .NET, Python)
Be ready to deploy from a container image (you can use mcr.microsoft.com/azuredocs/aci-helloworld or any public image)

**Resources Created**

- **Resource Group**: uks-dv-congroup-01-rg
- **App Service Plan**: uksdvasp01 (Linux-based, Standard tier)
- **Web App**: uksdvwebapp01, running Docker image: mcr.microsoft.com/azuredocs/aci-helloworld

---

**Setup Instructions**

Prerequisites

- Terrafrom Installed
- Azure CLI logged in or Az module installed from PSGallery

Steps:

git clone #insert repo url
git branch #insert branch name

**Running direct from local machine:**
# Initialize Terraform
terraform init
# Run Plan to preview and confirm resources to be created
terraform plan
# Apply the configuration
terraform apply

**Running from Pipeline (ideal preferred method)**
##Once finished editing to confirm resources
terraform plan 
##push to repo
git init
git add .
git commit -m "Initial commit: Azure Web App with Docker via Terraform"
git push
##Once added to repo create pull request to pull changes into main branch. 

##Then run from YAML pipeline


Design Decisions
Linux App Service Plan is used since they are easier to run from Docker Containers, along with this the docker container provides flexibility for the packing proccess.
Clear definitions of each of the variables provides a clear understanding and future-proofing of the code.
Naming structure provides clear indication of 'location-environment-application/resource-number'. Making the infrastructure clear what each resource is used for and for monitoring:
'uks-dv-congroup-01-rg'
uks: UK South
dv: Development
congroup: would be replaced with application name etc
01: First resource, second rg in dev would be 02 etc
rg: used to define that this is a resource group

Potential Next Steps
- CI/CD pipelines or Azure DevOps for automated deployments updates and maintaining deployments. Reducing manual errors and faster, more repetable deployments/upgrades.
- Monitoring & Logging using Azure Monitor or Application Insights, to gain visibility into application health, performance, and failure points.
- Add security and identity intergration such as, authentication methods & managed identities. In order to protect the application and its users with secure access methods
- Various configuration management methods such as Key vaults to store environment variables, and application settings securely and at scale

🛡️ Authentication (Azure AD, social logins)

# Terraform 

[Terraform](https://www.terraform.io/) is an open-source infrastructure as code software tool that provides a consistent CLI workflow to manage hundreds of cloud services. Terraform codifies cloud APIs into declarative configuration files.  

Ansible-Terraform workspace contains a small example Terraform project that creates a server on the Scaleway cloud 

```
cd /home/examples/terraform-scaleway/ && terraform init
``` 

If you want to try, set your Scaleway credentials as environment variable in your workspace. 
Add the following lines to /home/abc/.zshrc:

```
export SCW_DEFAULT_PROJECT_ID=<YOUR_PROJECT_ID>
export SCW_ACCESS_KEY=<YOUR_ACCESS_KEY>
export SCW_SECRET_KEY=<YOUR_SECRET_KEY>
```

Restart terminal, and execute 

```
cd /home/examples/terraform-scaleway/ && terraform plan
``` 

Create Scaleway infrastructure with 

```
cd /home/examples/terraform-scaleway/ && terraform apply
``` 

## Terraform report

A small tool that produces several outputs from a terraform project and visualizes terraform plan as an interactive HTML page.  
Terraform report can be generated from the small example terraform project, included in the Workspace

```
cd /home/examples/terraform-scaleway/ 
terraform-report
```  

Terraform-report outputs artefacts to the folder `/home/static-server/terraform-reports/`. This folder is served by the Static File Server that you 
can use to view the artifacts, that include interactive HTML pages 


<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/terraform-report-scaleway.gif" alt="Htop" width="750">
</p>


**Example with AWS**

If you want to try Terraform report with your own AWS account, open workspace and configure AWS profile - 
create [file with AWS credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)

```
mkdir -p ~/.aws  
nano ~/.aws/credentials
```  

The file `~/.aws/credentials` would look like this

```
[terraform]
aws_access_key_id = <YOUR_AWS_KEY>
aws_secret_access_key = <YOUR_AWS_SECRET>
```

Clone your terraform project to the workspace, or if you don't have any, you can use this terraform example repository:

```
git clone https://github.com/pvarentsov/terraform-aws-free-tier /home/project/aws-example
``` 

Open file `/home/project/aws-example/src/free-tier/main.tf` and comment out the part that configures S3 backend

```
terraform {
  backend "s3" {}
}
```

Initialize a working Terraform directory 

```
cd /home/project/aws-example/src/free-tier && terraform init
```  

Paste public ssh key (for the sake of example you can type anything)  

```
nano ./provision/access/free-tier-ec2-key.pub
```

Now you can generate terraform report 

```
terraform-report
```  

Use Static File Server to review the report 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/terraform-report.gif" alt="Htop" width="900">
</p>

## Terraform Rover

[Rover](https://github.com/im2nguyen/rover) - is an awesome Terraform visualizer with browser-based UI. Rover helps to better understand 
Terraform state and planned changes. To see how Rover works, you can use a basic Terraform example in folder */home/examples/terraform-scaleway/*. 
Initialize Terraform project first  

```
cd /home/examples/terraform-scaleway/ && terraform init
```  

and start Rover to visualize terraform state 

```
rover --workingDir /home/examples/terraform-scaleway/
```  

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/rover-scaleway.gif" alt="rover-scaleway" width="900">
</p>

If you have followed hands-on the tutorial from the previous section (terraform report from the terraform-aws-free-tier repo), you 
can visualize it with Rover:

```
rover --workingDir /home/project/aws-example/src/free-tier
```

Go to the quickstart page, and open Rover WEB UI

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/rover-aws.gif" alt="rover-aws" width="900">
</p>

## Blast Radius

[Blast Radius](https://github.com/28mm/blast-radius) is a tool for reasoning about Terraform dependency graphs with interactive visualizations. 
You can try Blast Radius - launch workspace and visualize an example Terraform project.  

```
cd /home/examples/terraform-scaleway && terraform init
blast-radius --serve --port 8030
```

Go to the quickstart page, and open Blast Radius WEB UI

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/blast-radius.gif" alt="Htop" width="900">
</p>

***NOTE:** Blast Radius is a great project, but there is lack of updates to the project recently, and it might not work 
with some Terraform providers.*

### [Terraform Inframap](https://github.com/cycloidio/inframap)

- Visualize terraform state

```
inframap generate terraform.tfstate | dot -Tpng > graph.png
```

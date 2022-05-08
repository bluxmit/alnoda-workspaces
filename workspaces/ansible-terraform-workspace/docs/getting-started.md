# Getting started

## General

### Quicklaunch

From the quicklaunch page you can open workspace tools, such as code editor or terminal 

<div align="center" style="font-style: italic;">
    Demo: Quicklaunch
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/Workspace%20UI.png" alt="Htop" width="750">
</p>

### Code Editor

Code editor of this workspace is [**Eclipse Theia**](https://theia-ide.org/docs/) - an open-source version of popular Visual Studio Code IDE. 
despite Eclipse Theia is a browser-based code editor, it is fast, responsive, and full-featured. It features code highlighting, autocompletion, 
rendering of notebooks has a tree-based file browser, and a great number of pre-installed color themes.  

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/theia-themes.png" alt="theia-themes.png" width="900">
</p>

You can install any extension from [open-vsx.org](https://open-vsx.org/) that has hundreeds of extensions for VS Code compatible editors. 
The IDE is already configured to make code highlighting for a great number of programming languages and file types. It also has many 
popular extensions installed  

<div align="center" style="font-style: italic;">
    Demo: Eclipse Theia
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/theia.gif" alt="Theia demo" width="900">
</p>

### Terminal

Workspace has full-size browser-base terminal

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/base-workspace/img/base-workspace-terminal.gif" alt="Base-Workspace terminal" width="750">
</p> 

Use workspace workspace terminal to install new applications. 
Install with ```sudo apt install```. The default *abc* user is allowed to install packages.  

For example, in order to install [Emacs text editor](https://www.gnu.org/software/emacs/) open workspace terminal, and execute 

```
sudo apt-get update
sudo apt install emacs
```


## Ansible 

Workspace includes example ansible playbook - a simple play that installs packages in localhosts 

> `cd /home/examples/ansible-local && ansible-playbook install-packages.yml`

### [Ansible Ara](https://github.com/ansible-community/ara)

ARA Records Ansible and makes it easier to understand and troubleshoot. Ansible Ara is 
fully configured in the Ansible-Terraform workspace - it captures any execution (manual or scheduled) 
of any ansible playbook.  

Ara server is up and running in the workspace, and available on the internal port 8029. If you mapped standard ports to your Ansible-Terraform 
workspcae, then Ansible Ara WEB UI is on [localhost:8029](http://localhost:8029)

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/Ansible-Ara.gif" alt="Htop" width="750">
</p>


### Ansible report

Ansible-report is a small utility that generates several reports from your ansible project - visualizes inventory, represents 
all plays in a format of graphs, generates interactive static website with information about hosts etc.  

> `cd /home/examples/ansible-local && ansible-report`

Ansible-report is a shell script that simply executes several ansible tools in one shot:

- ansible-lint
- ansible-cmdb 
- ansible-inventory-grapher
- ansible-playbook-grapher (for all ansible plays in the folder)

You can also use any of the ansible tools separately. 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/ansible-report.gif" alt="Htop" width="900">
</p>


### [Ansible Lint](https://ansible-lint.readthedocs.io/en/latest/installing.html)
Ansible Lint is a command-line tool for linting playbooks, roles and collections aimed towards any Ansible users. Cd to the folder with 
your Ansible project and execute

```
ansible-lint --nocolor > /home/static-server/ansible-lint.txt
```

### [Ansible-cmdb](https://github.com/fboender/ansible-cmdb)

Ansible-cmdb takes the output of Ansible's fact gathering and converts 
it into a static HTML overview page (and other things) containing system configuration information. Cd to the folder with 
your Ansible project and execute

```
ansible -m setup --tree out/ all
ansible-cmdb out/ > overview.html
```

### [Ansible inventory grapher](https://github.com/willthames/ansible-inventory-grapher)

Ansible-inventory-grapher creates a dot file suitable for use by graphviz. Cd to the folder with 
your Ansible project and execute

```
ansible-inventory-grapher all | dot -Tpng > /home/static-server/my.png
```

### [Ansible Playbook Grapher](https://github.com/haidaraM/ansible-playbook-grapher)

Command line tool to create a graph representing your Ansible playbook plays, tasks and roles. 
The aim of this project is to have an overview of your playbook. Cd to the folder with 
your Ansible project and execute

```
ansible-playbook-grapher --include-role-tasks example.yml -o /home/static-server/example
```

### [Ansible Doctor](https://ansible-doctor.geekdocs.de/)

Ansible-doctor is a simple annotation like documentation generator based on Jinja2 templates. 
while ansible-doctor comes with a default template called readme, it is also possible to write your own templates.  

The first step is to identify if the given folder is an Ansible role. This check is very simple, 
if the folder contains a sub-directory called tasks is MUST be an Ansible role! :)   

After the successful check, ansible-doctor will try to read some static files into a dictionary:
- defaults/main.yml
- meta/main.yml

Cd to the folder with your Ansible project and execute

```
ansible-doctor -o /home/static-server/ roles/example_production
```

### Schedule Ansible playbook executions

Ansible-Terraform workspace has 2 tools (Cronicle and ARA) that make it simple and convenient to use Ansible for periodic tasks and jobs. For example, 
maintenance jobs for your cloud infrastructure. This is especially handy if you run this workspace on a remote server.  

- [**Cronicle**] - allows to schedule tasks and jobs, and lets you observe executions using a nice UI 
- [**Ansible Ara**] - tracks all executions of ansible playbooks (manual or scheduled), and has nice UI that provides informationn about every step 
 of every playbook execution

You can try scheduling an example ansible playbook with Cronicle

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/cronicle-ansible.gif" alt="Htop" width="900">
</p>

**NOTE:** Scheduling Ansible playbooks is especially useful if you [launch Workspace on a remote server](#run-on-remote-server) rather than 
on your local laptop.


## Terraform 

[Terraform](https://www.terraform.io/) is an open-source infrastructure as code software tool that provides a consistent CLI workflow to manage hundreds of cloud services. Terraform codifies cloud APIs into declarative configuration files.  

Ansible-Terraform workspace contains a small example Terraform project that creates a server on the Scaleway cloud 

> `cd /home/examples/terraform-scaleway/ && terraform init` 

Set Scaleway credentials as environment variable in your workspace. 
Add the following lines to /home/abc/.zshrc:

```
export SCW_DEFAULT_PROJECT_ID=<YOUR_PROJECT_ID>
export SCW_ACCESS_KEY=<YOUR_ACCESS_KEY>
export SCW_SECRET_KEY=<YOUR_SECRET_KEY>
```

Restart terminal, and execute 

> `cd /home/examples/terraform-scaleway/ && terraform plan` 

Create infrastructure with 

> `cd /home/examples/terraform-scaleway/ && terraform apply` 

### Terraform report

A small tool that produces several outputs from a terraform project and visualizes terraform plan as an interactive HTML page.  
Terraform report can be generated from the small example terraform project, included in the Workspace

> `cd /home/examples/terraform-scaleway/ && terraform-report`  

Terraform-report outputs artefacts to the folder `/home/static-server/terraform-reports/`. This folder is served by the Static File Server that you 
can use to view the artifacts, that include interactive HTML pages 


<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/terraform-report-scaleway.gif" alt="Htop" width="500">
</p>


**Example with AWS**

If you want to try Terraform report with your own AWS account, open workspace and configure AWS profile - 
create [file with AWS credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)

> `mkdir -p ~/.aws`   
> `nano ~/.aws/credentials`  

The file `~/.aws/credentials` would look like this

```
[terraform]
aws_access_key_id = <YOUR_AWS_KEY>
aws_secret_access_key = <YOUR_AWS_SECRET>
```

Clone your terraform project to the workspace, or if you don't have any, you can use this terraform example repository:

> `git clone https://github.com/pvarentsov/terraform-aws-free-tier /home/project/aws-example` 

Open file `/home/project/aws-example/src/free-tier/main.tf` and comment out the part that configures S3 backend

```
terraform {
  backend "s3" {}
}
```

Initialize a working Terraform directory 

> `cd /home/project/aws-example/src/free-tier && terraform init`  

Paste public ssh key (for the sake of example you can type anything)  

> `nano ./provision/access/free-tier-ec2-key.pub`

Now you can generate terraform report 

> `terraform-report`  

Use Static File Server to review the report 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/terraform-report.gif" alt="Htop" width="900">
</p>

### Terraform Rover

[Rover](https://github.com/im2nguyen/rover) - is an awesome Terraform visualizer with browser-based UI. Rover helps to better understand 
Terraform state and planned changes. To see how Rover works, you can use a basic Terraform example in folder */home/examples/terraform-scaleway/*. 
Initialize Terraform project first  

> `cd /home/examples/terraform-scaleway/ && terraform init`  

and start Rover to visualize terraform state 

> `rover --workingDir /home/examples/terraform-scaleway/`  

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/rover-scaleway.gif" alt="rover-scaleway" width="900">
</p>

If you have followed hands-on the tutorial from the previous section (terraform report from the terraform-aws-free-tier repo), you 
can visualize it with Rover:

> `rover --workingDir /home/project/aws-example/src/free-tier`

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/rover-aws.gif" alt="rover-aws" width="900">
</p>

### Blast Radius

[Blast Radius](https://github.com/28mm/blast-radius) is a tool for reasoning about Terraform dependency graphs with interactive visualizations. 
You can try Blast Radius - launch workspace and visualize an example Terraform project.  

> `cd /home/examples/terraform-scaleway && terraform init`  
> `blast-radius --serve --port 8030`

open [localhost:8030](http://localhost:8030) in browser  

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/blast-radius.gif" alt="Htop" width="900">
</p>

***NOTE:** Blast Radius is a great project, but there is lack of updates to the project recently, and it might not work 
with some Terraform providers.*


### [Terraform pre-commit hook](https://github.com/antonbabenko/pre-commit-terraform)

Pre-commit git hooks to take care of Terraform configurations. Workspace has all dependencies installed.  


### [Terraform Inframap](https://github.com/cycloidio/inframap)

- Visualize terraform state
```
inframap generate terraform.tfstate | dot -Tpng > graph.png
```

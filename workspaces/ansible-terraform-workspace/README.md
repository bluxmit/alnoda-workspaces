# Ansible-Terraform Workspace

Alnoda workspace with Ansible and Terraform toolchain. 
Create, provision, visualize and manage infrastructures, schedule maintenance tasks.

## Why this images

1. If you don't want to install all of those tools separately.
2. If you need self-hosted environment to create infrastructures and schedule maintenance ansible playbooks.

## Start

```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/ansible-terraform-workspace
```

Open [localhost:8020](http://localhost:8020)  

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  

## Terraform 

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

### Terraform Rover

[Rover](https://github.com/im2nguyen/rover) - is a Terraform visualizer with browser-based UI. Rover helps to better understand 
Terraform state and planned changes. To see how Rover works, you can use a basic Terraform example in folder */home/examples/terraform-scaleway/*. 
Initialize Terraform project first  

```
cd /home/examples/terraform-scaleway/ && terraform init
```  

and start Rover to visualize terraform state 

```
rover --workingDir /home/examples/terraform-scaleway/
```  

If you have followed hands-on the tutorial from the previous section (terraform report from the terraform-aws-free-tier repo), you 
can visualize it with Rover:

```
rover --workingDir /home/project/aws-example/src/free-tier
```

Open Rover from the workspace UI


### Blast Radius

[Blast Radius](https://github.com/28mm/blast-radius) is a tool for reasoning about Terraform dependency graphs with interactive visualizations. 
You can try Blast Radius - launch workspace and visualize an example Terraform project.  

```
cd /home/examples/terraform-scaleway && terraform init
blast
```

Go to workspace UI and open Blast Radius


### Terraform Inframap

[Terraform Inframap](https://github.com/cycloidio/inframap) can visualize terraform state

```
inframap generate terraform.tfstate | dot -Tpng > graph.png
```

## Ansible 

This tutorial is a little demonstration of the included ansible toolset. 
Workspace has an example ansible play which installs several installs packages. 
We will use this playbook for some of the examples. For other examples, create your own ansible project.  

To run an example ansible play, open terminal and execute

```
cd /home/examples/ansible-local 
ansible-playbook install-packages.yml
```

### Ansible Ara

[Ansible ARA](https://github.com/ansible-community/ara) Records Ansible and makes it easier to understand and troubleshoot. Ansible Ara is 
fully configured in the Ansible-Terraform workspace - it captures any execution (manual or scheduled) 
of any ansible playbook.  


### Ansible Lint
[Ansible Lint](https://ansible-lint.readthedocs.io/en/latest/installing.html) is a command-line tool for linting playbooks, roles and collections aimed towards any Ansible users. Cd to the folder with 
your Ansible project and execute

```
cd /home/examples/ansible-local
ansible-lint --nocolor > /home/project/ansible-lint.txt
```

You can view the resulted txt file with static file server or filebrowser. 

### Ansible-cmdb

[Ansible-cmdb](https://github.com/fboender/ansible-cmdb) takes the output of Ansible's fact gathering and converts 
it into a static HTML overview page (and other things) containing system configuration information.  

Cd to the folder with your Ansible project and execute

```
cd /home/examples/ansible-local
ansible -m setup --tree out/ all
ansible-cmdb out/ > /home/project/overview.html
```

You can view the resulted txt file with Serve (static file server)

### Ansible inventory grapher

[Ansible inventory grapher](https://github.com/willthames/ansible-inventory-grapher) creates a dot file suitable for use by graphviz. Cd to the folder with 
your Ansible project and execute

```
ansible-inventory-grapher all | dot -Tpng > /home/project/my.png
```

### Ansible Playbook Grapher

[Ansible Playbook Grapher](https://github.com/haidaraM/ansible-playbook-grapher) - is a command line tool 
that creates a graph representing your Ansible playbook plays, tasks and roles. 
The aim of this project is to have an overview of your playbook. Cd to the folder with 
your Ansible project and execute

```
ansible-playbook-grapher --include-role-tasks example.yml -o /home/static-server/example
```

### Ansible Doctor

[Ansible Doctor](https://ansible-doctor.geekdocs.de/) is a simple annotation like documentation generator based on Jinja2 templates. 
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

- **Cronicle** - allows to schedule tasks and jobs, and lets you observe executions using a nice UI 
- **Ansible Ara** - tracks all executions of ansible playbooks (manual or scheduled), and has nice UI that provides informationn about every step 
 of every playbook execution

You can try scheduling an example ansible playbook with Cronicle

**NOTE:** Scheduling Ansible playbooks is especially useful if you [launch Workspace on a remote server](#run-on-remote-server) rather than 
on your local laptop.

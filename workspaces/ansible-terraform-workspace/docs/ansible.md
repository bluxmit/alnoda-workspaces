# Ansible 

This tutorial is a little demonstration of the included ansible toolset. 
Workspace has an example ansible play which installs several installs packages. 
We will use this playbook for some of the examples. For other examples, create your own ansible project.  

To run an example ansible play, open terminal and execute

```
cd /home/examples/ansible-local 
ansible-playbook install-packages.yml
```

## Ansible Ara

[Ansible ARA](https://github.com/ansible-community/ara) Records Ansible and makes it easier to understand and troubleshoot. Ansible Ara is 
fully configured in the Ansible-Terraform workspace - it captures any execution (manual or scheduled) 
of any ansible playbook.  

Ara server is up and running. Open quickstart page and navigate to Ara WEB UI

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/Ansible-Ara.gif" alt="Htop" width="750">
</p>

## Ansible Lint
[Ansible Lint](https://ansible-lint.readthedocs.io/en/latest/installing.html) is a command-line tool for linting playbooks, roles and collections aimed towards any Ansible users. Cd to the folder with 
your Ansible project and execute

```
cd /home/examples/ansible-local
ansible-lint --nocolor > /home/static-server/ansible-lint.txt
```

You can view the resulted txt file with static file server, filebrowser. 

## Ansible report

Ansible-report is a small utility that generates several reports from your ansible project - visualizes inventory, represents 
all plays in a format of graphs, generates interactive static website with information about hosts etc.   

Create your own ansible project, cd and execute

```
ansible-report
```

Ansible-report is a shell script that simply executes several ansible tools in one shot:

- ansible-lint
- ansible-cmdb 
- ansible-inventory-grapher
- ansible-playbook-grapher (for all ansible plays in the folder)

You can also use any of the ansible tools separately. 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/ansible-report.gif" alt="Htop" width="900">
</p>


## Ansible-cmdb

[Ansible-cmdb](https://github.com/fboender/ansible-cmdb) takes the output of Ansible's fact gathering and converts 
it into a static HTML overview page (and other things) containing system configuration information.  

Cd to the folder with your Ansible project and execute

```
ansible -m setup --tree out/ all
ansible-cmdb out/ > overview.html
```

## Ansible inventory grapher

[Ansible inventory grapher](https://github.com/willthames/ansible-inventory-grapher) creates a dot file suitable for use by graphviz. Cd to the folder with 
your Ansible project and execute

```
ansible-inventory-grapher all | dot -Tpng > /home/static-server/my.png
```

## Ansible Playbook Grapher

[Ansible Playbook Grapher](https://github.com/haidaraM/ansible-playbook-grapher) - is a command line tool 
that creates a graph representing your Ansible playbook plays, tasks and roles. 
The aim of this project is to have an overview of your playbook. Cd to the folder with 
your Ansible project and execute

```
ansible-playbook-grapher --include-role-tasks example.yml -o /home/static-server/example
```

## Ansible Doctor

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

## Schedule Ansible playbook executions

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


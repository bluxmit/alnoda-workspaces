<p align="center">
  <img src="https://github.com/bluxmit/alnoda-workspaces/blob/main/img/Alnoda-white.svg" alt="Alnoda logo" width="150">
</p> 

# Ansible-Terraform Workspace

Dockerized development environment for Ansible and Terraform. Workspace will help to create and manage infrastructures; 
visualize planned terraform changes; display ansible hosts plays; schedule and observe executions.

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/ansible-terraform-wid-collage.png" alt="Collage" width="750">
</p>

## Why this images

1. If you don't want to install all of those tools separately.
2. If you need self-hosted environment to create infrastructures and schedule maintenance ansible playbooks.

## Start

```
docker run --name space-1 -d -p 8020-8035:8020-8035 -p 9000:9000 alnoda/ansible-terraform-workspace
```

and open [localhost:8020](http://localhost:8020) in browser.  

## Features

**Ansible tools:**

- [**Ansible Ara**](https://github.com/ansible-community/ara)
- [**Ansible-cmdb**](https://github.com/fboender/ansible-cmdb)
- [**Ansible inventory grapher**](https://github.com/willthames/ansible-inventory-grapher)
- [**Ansible Playbook Grapher**](https://github.com/haidaraM/ansible-playbook-grapher)
- [**Ansible Lint**](https://ansible-lint.readthedocs.io/en/latest/installing.html)
- [**Ansible Doctor**](https://ansible-doctor.geekdocs.de/)

**Terraform tools:**

- [**Pre-commit-terraform**](https://github.com/antonbabenko/pre-commit-terraform)
- [**Rover**](https://github.com/im2nguyen/rover)
- [**Blast-Radius**](https://github.com/28mm/blast-radius)
- [**Terraform Visual**](https://github.com/hieven/terraform-visual)
- [**Terraform Graph**](https://www.terraform.io/docs/cli/commands/graph.html)
- [**Inframap**](https://github.com/cycloidio/inframap)

## Docs
See our guides on [**getting started**](docs/getting-started.md) and [**advanced features**](docs/features.md).

<div align="center" style="font-style: italic;">
    Demo: Ansible-Terraform workspace
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/ansible-terraform-wid.gif" alt="Htop" width="900">
</p>

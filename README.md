# Workspaces in docker

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/img/Alnoda-white.svg" alt="Alnoda logo" width="250">
</p> 

Workspace is a single docker image with a number of applications and tools for specific task, 
such as Python development or Postgres management.

<div align="center" style="font-style: italic;">
    Demo: Ansible-Terraform workspace
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/ansible-terraform-wid.gif" alt="Htop" width="900">
</p>

> If you like this project, please support it by simply putting a Github star. 
Share this library with friends on Twitter and everywhere else you can.
 
### Contents

* [List of workspaces](#list-of-workspaces)
* [Why workspace In Docker](#why-workspace-in-docker)
* [Contribution](#contribution)

## List of workspaces

### [`Workspace-in-docker`](./workspaces/workspace-in-docker/README.md) 
General-purpose dockerized workspace - an environment fully isolated inside a docker container. 
It can run anywhere, can be started and stopped, moved to another machine, archived to file or restored, pushed to docker registry, started on a cloud server. 
This workspace has a powerful cod editor (browser-based VS-Code version), its own UI, and a collection of applications for more 
convenient work, such as File Browser to easily exchange files and folders with workspace, Cronicle - advanced job scheduler with great UI, 
MkDocs for documentation of the workspace and projects. Has all the features of the Base-workspace and Ubuntu-workspace.  

```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/workspace-in-docker
```

### [`Codeserver-Workspace`](./workspaces/codeserver-workspace/README.md) 
An alternative workspace to the workspace-in-docker. It has all the features ot the latter, except for the 
different implementation of the Visual Studio Code. While workspace-in-docker has [Eclipse Theia IDE](https://theia-ide.org/), Codeserver-Workspace 
includes [Codeserver](https://github.com/cdr/code-server) instead.   

```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/codeserver-workspace
```

### [`Python-Workspace`](./workspaces/python-workspace/README.md) 
Python development enviroment inside the isolated docker container. Includes VS-code IDE, 
job scheduler and other tools for linting, testing, auto-documentation and profiling. Start coding in Python rght away! Has all the features of 
the Base-workspace and Ubuntu-workspace.  

```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/python-workspace
```

### [`Ansible-Terraform-Workspace`](./workspaces/ansible-terraform-workspace/README.md) 
This workspace - is a "dockerized" development environment 
with [Ansible](https://docs.ansible.com/), [Terraform](https://www.terraform.io/) and lots of other stuff installed, 
so that you don't need to do it yourself. Create infrastructures with Terraform, and configure it with Ansible. 
Workspace will help to code and develop; visualize infrastructures and planned terraform changes; 
display ansible hosts plays; schedule and observe executions and more! Has all the features of 
the Base-workspace and Ubuntu-workspace.  

```
docker run --name space-1 -d -p 8020-8035:8020-8035 -p 9000:9000 alnoda/ansible-terraform-workspace
```

### [`Postgres-Workspace`](./workspaces/postgres-workspace/README.md) 
Great number of tools to manage PostgreSQL database, develop and schedule database scripts and applications. 
All in a single docker image.

```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/postgres-workspace
```

### [`Redis-Workspace`](./workspaces/redis-workspace/README.md) 
Docker image with Redis, and many other tools that make development with Redis much more convenient. Substitute 
in your development docker-compose.yaml file standard redis image with this one, add port-mapping -p 8020-8035:8020-8035. 
Now in addition to Redis, you've got a whole set of tools with UIs, that allow you to explore you Redis database, get and set keys, 
import datasets, install Redis modules and more.

```
docker run --name rwid-1 -d -p 8020-8035:8020-8035 alnoda/redis-workspace
```

### [`Kafka-Workspace`](./workspaces/kafka-workspace/README.md) 
Docker image with Kafka, and some other tools to improve Kafka development experience.
```
docker run --name rwid-1 -d -p 8020-8035:8020-8035 alnoda/kafka-workspace
```

### [`Elasticsearch-Workspace`](./workspaces/elasticsearch-workspace/README.md) 
A tool to quickly develop and schedule Elasticsearch/Opensearch maintenance scripts. 
Such as taking snapshot backups of indexes, migrating to another Elasticsearch cluster, transferring Elasticsearch data to S3, importing data into Elasticsearch. 
As well as deleting/moving/archeiving old indexes, reindexing, rebalancing uneven shard distribution, export report queries to S3, etc.
```
docker run --name elawid-1 -d -p 8020-8035:8020-8035 alnoda/elasticsearch-workspace
```

### [`MkDocs-MagicSpace`](./workspaces/mkdocs-magicspace/README.md) 
All-in-one tool, carefully crafted to develop, build and serve awesome static websites, for the purpose 
of documentation, tutorials, and training. Has all the features of the Base-workspace and Ubuntu-workspace.

```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/mkdocs-magicspace
```

### [`Ubuntu-workspace`](./workspaces/ubuntu-workspace/README.md) 
Docker as a "light-weight Virtual Machine". It 
provides isolation of environments, but uses less resources than VMs. Allows to start multiple processes inside the 
same docker container, has docker-in-docker, Python and Node.js, and a collection of common applications such as text editors, 
git, supervisord, z-shell etc. Ubuntu-workspace with browser-based terminal can be used on both local and remote server with the same experience. 
When it runs on the remote server, the access can be restricted with a password, and secured with TLS encryption.  

```
docker run --name space-1 -d -p 8020-8030:8020-8030 alnoda/ubuntu-workspace
```


## Why workspace In Docker 

When used locally, workspaces help to isolate development environments and easily switch between projects. Workspaces can be moved between laptops, PCs, 
backed up and shared with friends.  

When launched on remote server, workspaces can be used to schedule scripts and tasks, such as data ingestion.   

When deployed on K8S, workspaces can be used to manage databases, create backups.   



## Contribution

Simply create a pull request. It will be welcome.  
If you feel you need to discuss first, create an issue.




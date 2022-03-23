<!-- <p align="center">
  <img src="https://github.com/bluxmit/alnoda-workspaces/blob/main/img/Alnoda-white.svg" alt="Alnoda logo" width="150">
</p>  -->

<p align="center">
  <img src="https://github.com/bluxmit/alnoda-workspaces/blob/main/img/ukraine-flag.png" alt="Ukraine" width="150">
</p> 

# Workspaces in docker

Workspace is a single docker image with a number of applications and tools for specific task, 
such as Python development or Postgres management.

<div align="center" style="font-style: italic;">
    Demo: Ansible-Terraform workspace
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/ansible-terraform-wid.gif" alt="Htop" width="900">
</p>

> If you like this project, please support it by simply putting a Github star and sharing with friends on Twitter.
 
### Contents

* [List of workspaces](#list-of-workspaces)
* [Why workspace In Docker](#why-workspace-in-docker)
* [Contribution](#contribution)

## List of workspaces

### [`Workspace-in-docker`](./workspaces/workspace-in-docker/README.md) 
General-purpose dockerized development environment. Fully isolated inside a docker container. 
Includes code editor, terminal, scheduler and filebrowser. 

```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/workspace-in-docker
```

### [`Codeserver-Workspace`](./workspaces/codeserver-workspace/README.md) 
An alternative workspace to the workspace-in-docker but with [Codeserver](https://github.com/cdr/code-server).   

```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/codeserver-workspace
```

### [`Python-Workspace`](./workspaces/python-workspace/README.md) 
General purpose python development environment with a focus on 
linting, testing, auto-documentation, performance and profiling. 

```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/python-workspace
```

### [`Ansible-Terraform-Workspace`](./workspaces/ansible-terraform-workspace/README.md) 
Dockerized development environment for [Ansible](https://docs.ansible.com/) and [Terraform](https://www.terraform.io/). 
Workspace will help to create and manage infrastructures; visualize planned terraform changes; 
display ansible hosts plays; schedule and observe executions.  

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
Docker image with Redis, Redis Commander and other Redis CLI tools. Can be used to manage cloud Redis deployments, 
or as Redis docker image with batteries included for local development.

```
docker run --name rwid-1 -d -p 8020-8035:8020-8035 alnoda/redis-workspace
```

### [`Kafka-Workspace`](./workspaces/kafka-workspace/README.md) 
Docker image with Kafka, and many tools to manage Kafka clustters in cloud, improve development experience 
or get started with Kafka fast.

```
docker run --name rwid-1 -d -p 8020-8035:8020-8035 alnoda/kafka-workspace
```

### [`Elasticsearch-Workspace`](./workspaces/elasticsearch-workspace/README.md) 
A tool to manage Elasticsearch/Opensearch clusters. Schedule backups of Elasticsearch indexes, 
migrate to other clusters, export and import Elasticsearch data to S3.
```
docker run --name elawid-1 -d -p 8020-8035:8020-8035 alnoda/elasticsearch-workspace
```

### [`MkDocs-MagicSpace`](./workspaces/mkdocs-magicspace/README.md) 
MkDocs-MagicSpace is an all-in-one tool, carefully crafted to make the development of gorgeous documentation 
websites like [**this one**](https://mkdocs-magicspace.alnoda.org/) as easy as possible.  

```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/mkdocs-magicspace
```

### [`SQLite-Workspace`](./workspaces/sqlite-workspace/README.md) 
Collection of tools to develop SQLite databases. Useful if you need to create an embedded database for your application, 
and fill it with data.   
```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/sqlite-workspace
```

### [`Ubuntu-workspace`](./workspaces/ubuntu-workspace/README.md) 
Docker as a "light-weight Virtual Machine". Get an isolated Ubuntu environment for development, testing or experimentation 
that requires less resources than VM.    

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




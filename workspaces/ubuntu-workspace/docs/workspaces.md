# Workspaces

## Contents

* [Intro](#intro)
* [Why workspace in docker](#why-ide-workspace)
* [Workspace UIs](#workspace-uis)
    * [Quickstart](#quickstart)
    * [Code editor](#code-editor)
    * [Terminal](#terminal)
    * [Task scheduler](#task-scheduler)
* [Launch Workspace](#launch-workspace)
    * [Workspace terminal](#workspace-terminal)
    * [Multiple workspaces](#multiple-workspaces)
    * [Understanding ports](#understanding-ports)
* [Command line applications](#command-line-applications)
    * [Install apps](#install-apps)
    * [Schedule jobs with cron](#schedule-jobs-with-cron)
    * [Python](#python)
    * [Node.js](#node.js)
* [Manage workspaces](#manage-workspaces)
    * [Start and stop workspaces](#start-and-stop-workspaces)
    * [Create new workspace image](#create-new-workspace-image)
    * [Manage workspace images](#manage-workspace-images)
    * [Save and load workspace images](#save-and-load-workspace-images)
    * [Move workspace to the cloud](#move-workspace-to-the-cloud)
* [Extend workspaces](#extend-workspaces)
    * [Workspace tree](#workspace-tree)
    * [Java](#java)
    * [Run applications permanently](#run-applications-permanently)
* [Self-hosted workspace](#self-hosted-workspace)
    * [Unsecure remote workspace](#unsecure-remote-workspace)
    * [Secure remote workspace](#secure-remote-workspace)
* [Create documentation](#create-documentation)
* [Customize Workspace](#customize-workspace)
    * [Customize Quickstart](#customize-quickstart)
    * [Customize zsh](#customiz-zsh)

## Intro

This doc describes workspaces in docker. Examples are provided for the **ide-workspace** but can be used for other workspaces too.

## Why workspace in docker 

Workspace in docker - is a completely self-contained and fully isolated development environment, that runs inside a docker container. 
Workspace image includes toolset necessary to start coding or doing other tasks right away. 
To use workspace in docker, you won't need to install or use any other tools, apart from docker itself. 
Workspace can be used on a laptop, PC or launched on the remote server with HTTPS and authentication. Can be shared, backed up, and has versions. 
If you work on multiple projects, you can start and stop workspaces, and switch between them. 
Isolation in docker prevents from polluting your main environment.  

Read in detail about the [advantages of the dockerized workspace](https://github.com/bluxmit/alnoda-workspaces/blob/main/README.md#why-workspace-in-docker) 
and the [situations when workspace is a good choice](https://github.com/bluxmit/alnoda-workspaces/blob/main/README.md#use-cases)   

**TLDR:** This workspace might be useful when you want to:

- Avoid the tedious process of setting dev environment on your laptop
- Work conveniently with multiple projects on the same machine
- Be able to move all your work to another machine 
- Simple way to start coding
- Run dev environment in cloud and work from any device, being independent of cloud provider
- Back-up entire workspaces with important work, save versions of the workspaces before changes
- Collaborate with colleagues by sharing the entire workspace or run it in the cloud
- Move from dev to POC in minutes
- Make experiments (try new packages, versions, frameworks) without risking affecting existing environment
- With a single command start, stop and resume job schedules, related to the same project 
- Create a custom dev environment for your team, and help new-comers to save time on setting up their environments
- Move dev environment back and forth between powerful Windows PC and macOS laptop 


## Workspace UIs

Most of the workspaces have UI tools, except for workspaces designed to be used purely from the terminal (such as ubuntu-workspace). 
Nearly all the workspaces have quickstart page, code editor, full-size terminal, visual job scheduler, file browser, static file server, 
visual git interface. 

Different workspaces have other tools with grapthical interfaces. 

All UI tools are browser-based.

## Quickstart 

From the quicklaunch page you can open workspace tools, such as code editor or terminal. Workspace Quicklaunch UI 
is always exposed on the 8020 port

<div align="center" style="font-style: italic;">
    Demo: Workspace UI 
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/wid-ui.png" alt="wid-ui.png" width="750">
</p>

### Code editor

Code editor of this workspace is [**Eclipse Theia**](https://theia-ide.org/docs/) - an open-source version of popular Visual Studio Code IDE. 
despite Eclipse Theia is a browser-based code editor, it is fast, responsive, and full-featured. It features code highlighting, autocompletion, 
rendering of notebooks has a tree-based file browser, and a great number of pre-installed color themes.  

<div align="center" style="font-style: italic;">
    Demo: Eclipse Theia
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/theia.gif" alt="Theia demo" width="900">
</p>

You can install any extension from [open-vsx.org](https://open-vsx.org/) that has hundreeds of extensions for VS Code compatible editors. 
The IDE is already configured to make code highlighting for a great number of programming languages and file types. It also has many 
popular extensions installed  

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

### Task scheduler

[Cronicle](https://github.com/jhuckaby/Cronicle) is a multi-server task scheduler and runner, with a web based front-end UI. It handles both scheduled, repeating and on-demand jobs, 
targeting any number of worker servers, with real-time stats and live log viewer. 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ansible-terraform-workspace/img/cronicle-ansible.gif" alt="Htop" width="900">
</p>

**NOTE:** Scheduling Ansible playbooks is especially useful if you [launch Workspace on a remote server](#run-on-remote-server) rather than 
on your local laptop.


## Launch Workspace

Workspaces - are merely docker containers, that's why managing workspaces is easy and intuitive - it is enough to know only docker commands, 
no need to learn any new tools. 

*The further examples will *

In order to avoid confusion, the following convention is adopted: 

```sh
command to execute outside of the workspace
```

> `command to execute inside the workspace (after entering running docker container)`

To start a workspace simply execute in terminal

```sh
docker run --name space-1 -d -p 8020-8040:8020-8040 alnoda/ide-workspace
```

*(It is recommended to run workspace in the daemon mode)*

***Open [http://localhost:8020](http://localhost:8020)***   

Workspace has its own UI, which includes quiklaunch (home) page and documentation pages. 
From the quiklaunch you can open any workspace tool. Documentation pages you modify in order 
to document the project, workspace use and setup.  

## Workspace terminal

There are several ways how to work with terminal of the the ide-workspace: 

- built-it in-browser terminal
- use terminal provided by in-browser IDE [http://localhost:8025](http://localhost:8025) ([unless other ports are mapped](#multiple-workspaces))
- ssh into the running the docker container (of the workspace) from your terminal

*(Browser-based terminals always work under the user you started the workspace with, the default is non root user "abc")*

If you want to enter running workspace container from your terminal execute:
```sh
docker exec -it space-1 /bin/zsh
```

If you don't want to use z-shell
```
docker exec -it space-1 /bin/bash
```

This way allows to ssh into the workspace as a root user at any time, even if the workspace itself was not starter as root user (the default user is abc)

```sh
docker exec -it --user=root space-1 /bin/zsh
```

You can work in Ubuntu terminal now. Execute the followinng command to know your workspace user 

> `whoami`

## Multiple workspaces

Every workspace requires range of ports. If one workspace is up and running, the ports 8020-8040 are taken.   

ide-workspace itself uses 9 ports (8020-8028), but it is recommended to map several extra ports just in case. Having extra ports, 
you can always launch new applications on these ports, and they will be immediately exposed outside of the workspace.  

In order to start another workspace, you either need to stop currently runnning workspace, or to run another workspace 
on the different port range.  

If you are planning to run more than one workspace at the same time, you can run another workspace with 
the different port range, for example

```sh
docker run --name space-2 -d -p 8050-8070:8020-8040 -e ENTRY_PORT=8050 alnoda/ide-workspace
```

Notice that in addition we need to set environmental variable ENTRY_PORT, which should be equal to the first port in the new range. 
Workspace UI usues this variable to know the new port range, and redirects to the proper addresses of the workspace applications' UIs.

## Understanding ports
Usually workspace was started with a port range mapping ***-p 8020-8040***. 
This is because workspace contains a set of applications with browser-based UI 

| Port      | Application               |
| --------- | ------------------------- |
| 8020      | Workspace UI              |
| 8021      | Filebrowser               |
| 8022      | Static file server        |
| 8023      | Cronicle                  |
| 8024      | Ungit                     |
| 8025      | VS-Code (Theia)           |
| 8026      | Terminal                  |
| 8027      | Midnight Commander        |
| 8028      | Htop                      |

Other workspaces might have more applications running, and use additional ports. For example **ansible-terraform-workspace** includes 
additional GUI application - Ansible Ara

| Port      | Application               |
| --------- | ------------------------- |
| 8029      | Ansible Ara               |

You don't need to memorize these ports. Workspace has UI from where you can open any of the applications. 
Open [localhost:8020](http://localhost:8020), and from there open other applications included in the workspace.  

The rest of the ports from the port range can be used in order to expose optional applications, or applications you might 
install in future. So we map several extra ports just in case.   

If you are planning to expose more applications 
from inside of a container, add additional port mapping, for example

```sh
docker run --name space-1 -d -p 8020-8040:8020-8040 -p 8080:8080 alnoda/ide-workspace
```

You can add multiple port mappings:

```sh
docker run --name space-1 -d -p 8020-8040:8020-8040 -p 8080:8080 -p 443:443 alnoda/ide-workspace
```

**NOTE:** It is not a problem if you don't expose any ports, but later on realise you need them - 
you will just create new image, and run it exposing the required port (look in the section [Create new image](#create-new-workspace-image)) 


## Command line applications

Workspace usually includes many CLI tools and apps, such as Git and git tools, console text editors and file browsers and  
system monitors. 

Specialized workspaces include more CLI applications. 

Use workspace terminal to work with CLI apps.

### Install apps

Install new packages with ```sudo apt install```, for example emacs

```
sudo apt install emacs
```

### Schedule jobs with cron

Schedule execution of any task with cron. Create cron task with

```
crontab -e
```

*(chose [1] nano as editor)*
In the end of the opened file add line  

> `* * * * * echo $(whoami) >> /home/cron.txt`

This will print every minute username to file */home/cron.txt* . Ctrl+X to exit nano 

> ```
> Hint: example of cron job definition:   
> .---------------- minute (0 - 59)   
> |  .------------- hour (0 - 23)
> |  |  .---------- day of month (1 - 31)
> |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
> |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
> |  |  |  |  |
> *  *  *  *  *  command to be executed
> ```

**NOTE** you can disconnect from the image and close terminal. cron will continue working.

### Python

Python and Pip are installed. To start python console simply execute

```
python
``` 
Install python package with pip

```
pip install pandas
```
Install and start ipython

```
pip install ipython
ipython
```

Create and activate virtual environment called 'my_env'
```
mkdir /home/pytest
cd /home/pytest && python -m venv my_env
source my_env/bin/activate
```

### Node.js
Use nodeenv to create different node environments. For example, create folder npmgui, and activate environment with node v. 12.18.3 and npm v.6.0.0

```
cd /home 
mkdir npmgui; cd npmgui
nodeenv --node=12.18.3 --npm=6.0.0 env 
```
Let's install package and start node application 

```
. env/bin/activate && npm i -g npm-gui
npm-gui 0.0.0.0:19011
```
Open your browser on http://localhost:19011/ 

*(This is why we made a port mapping with "-p 19011:19011")*

> *NOTE* If you close terminal, the application will stop. 
> Find how to run applications permanently in the section [Run applications permanently](#run-applications-permanently)


## Manage workspaces

Workspace is just a docker container. You can start, stop, delete and do anything you can do with docker images and containers.    

There are two concepts to keep in mind: **images** and **containers**. Images are workspace blueprints. For example, **alnoda/ide-workspace** - 
is an image. When you execute this command 

```sh
docker run --name space-1 -d -p 8020-8040:8020-8040 alnoda/ide-workspace
```

you create container called **space-1** from the image **alnoda/ide-workspace**. You can create any number of containers, but you need to 
[map different ports to each of them](#multiple-workspaces).  

Container - is your workspace. You can start, stop and delete them. You can run multiple workspace containers at the same time, or work with 
one workspace at a time.   

From the workspace (which is a container) you can create new image. This is called **commit docker image**. 
Essentially, this means *"take my workspace and create new image with all the changes I've done in my workspace*"

### Start and stop workspaces

The workspace started in daemon mode will continue working in the background. 

See all the running docker containers

```
docker ps
```

Stop workspace

```sh
docker stop space-1 
```

Workspace is stopped. All the processes and cron jobs are not running. 

See all docker conntainers, including stopped

```
docker ps -a
```

Start workspace again. Processes and cron jobs are resumed. 

```sh
docker start space-1 
```

Delete workspace container (all work will be lost)

```
docker rm space-1 
```

### Create new workspace image

Having made changes, you can commit them creating new image of the workspace. In order to create new workspace image with the 
name "space-image" and version "0.2" execute

``` 
docker commit space-1 space-image:0.2
```

Run new workspace with 

```
docker run --name space2 -d space-image:0.2
```

The new workspace accommodates all the changes that you've made in your space-1. Hence you can have versions of your workspaces. 
Create different versions before the important changes.

### Manage workspace images

See all docker images

```
docker images
```

Delete workspace image entirely

```
docker rmi -f alnoda/ide-workspace
```

**NOTE:** you cannot delete image if there is a running container created from it. Stop container first.

### Save and load workspace images

After you commit workspace container, and create new image out of it, you can push it to your docker registry or save it in a file.  

#### Save workspace in a file 

Assuming you created new image **space-image:0.4** from your workspace, you can save it as a tar file 

```
docker save space-image:0.4 > space-image-0.4.tar
```

We can delete the image with

```
docker rmi -f space-image:0.4
```

And restore it from the tar file

```
docker load < space-image-0.4.tar
```

#### Push workspace to a registry

A better way to manage images is docker registries. You can use docker registries in multiple clouds. They are cheap annd very convenient.  
Check out for example, [Registry in DigitalOcean](https://www.digitalocean.com/products/container-registry/) or in [Scaleway container registry](https://www.scaleway.com/en/container-registry/). There are more.   

Pushing image to registry is merely 2 extra commands: 1) tag image; 2) push image   

You will be able to pull image on any device, local or cloud.

### Move workspace to the cloud

Ease of running workspace in cloud, and ability to move workspaces between local machine and remote server  - 
is one of the main features of the workspace, and the reasonn why the workspace is entirely in docker.  

It is often a case that experiment, which started on personal notebook require more computational 
resources, must be running for a long period of time, or executed periodically. All of these cases are 
the reasons to move a workspace to the cloud server. Usually it is a hassle, but this workspace can be moved 
to the remote server easily.    

The easiest way to move workspace to the cloud is to get your private docker registry. Then moving a workspace from a laptop to 
a remote server is only 3 commands:

1. [Commit workspace to the a image](#create-new-workspace-image)
2. [Push workspace to your docker registry](https://docs.docker.com/engine/reference/commandline/push/)
3. ssh to remote server, and [run workspace there](#run-on-remote-server)   

If you don't want to use container registry, then there are 2 steps more involved:

1. [Commit workspace to the a image](#create-new-workspace-image)
2. [Save image to file](#create-new-workspace-image) 
3. Copy file to remote server. There are many options:
    - Launch filexchange workspace on the remote server 
    - Use [cyberduck](https://cyberduck.io/) 
    - use [scp](https://linuxize.com/post/how-to-use-scp-command-to-securely-transfer-files/)
4. [Load workspace image from file](#save-and-load-workspace-images) on the remote server 
5. [Start workspace on the remote server](#run-on-remote-server) 


## Self-hosted workspace

Because workspace is just a docker image, running it in any other server is as easy as running it on local laptop.  

Running on remote server makes it much simpler to collaborate, because you can just share credentials to the workspace with your peers, and they will be able to use it. 
You can also run applications that should run permanently, and run jobs on schedule.  

#### Unsecure remote workspace

The simplest deployment of the workspace requires only 3 steps:

- get virtual server on your favourite cloud (Digital Ocean, Linode, AWS, GC, Azure ...) 
- [install docker](https://docs.docker.com/engine/install/) on this server
- ssh to the remote server and start workspace 

```
docker run --name space-1 -d -p 8020-8040:8020-8040 -e WRK_HOST="<ip-of-your-remote-server>" alnoda/ide-workspace
```

**NOTE:** When running workspace on the remote server, add envronmental variable `-e WRK_HOST="<ip-of-your-remote-server>"`. 
Workspace UI needss this variable to know how redirect properly to the workspace applications' UIs.

Open in your browser `<ip-of-your-remote-server>:8020`  

If docker-in-docker is required, then 

```
docker run --name space-1 -d -p 8020-8040:8020-8040 -e WRK_HOST="<ip-of-your-remote-server>" -v /var/run/docker.sock:/var/run/docker.sock alnoda/ide-workspace
```

This way launches workspace in cloud, but such workspace is not secure, everyone who knows IP of your server will be able to use it.  

#### Secure remote workspace

*You might want to restrict access to the workspace, and secure encrypted communication with the workspace*  

ide-workspace contains utility that will generate everything needed to launch the workspace in cloud in a secure way, with authentication and with TLS.  

If you want to run workspace on the remote server securely, start ide-workspace on your local laptop first, open its terminal and 
use utility `/home/abc/utils/remote.py` to generate create docker-compose project with TLS certificates. 

First install htpasswd 

> `apt-get install -y apache2-utils`

Second, execute

> `python /home/abc/utils/remote.py --workspace="ide-workspace" --port="8020" --host="68.183.69.198" --user="user1" --password="pass1"`  

**NOTE:** you have to specify the correct host (IP of the server you want to run the workspace on), and user and password of your choice, and specify 
the name of the workspace you use. 

After the command is executed, you will see folder `/home/abc/utils/remote` is created. Download it out from the workspace to the local environment using the Filebrowser:

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/wid-remote.gif" alt="wid-remote.gif" width="750">
</p>

Copy this folder to the remote server where you want to launch the Python workspace. 
You can use cyberduck or [scp](https://kb.iu.edu/d/agye). ssh to the server, cd to the directory you copied and execute 

```sh
docker-compose up -d
```  

That's it, you workspace is running securely on the remote server, using 
self-signed TLS certificates for encrypted https communication between you laptop and the remote workspace, and authentication is added. 


**NOTE:** The HTTPS is with self-signed certificate, and your browser will show a warning, asking you to accept the risk 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/accept-risks.png" alt="accept-risk" width="750">
</p> 

After you accept the risk, authentication window will appear asking you the user and password, that you have set as<ANY_USER_NAME>, <ANY_USER_PASSWORD> 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/auth.png" alt="auth" width="750">
</p> 


## Extend workspaces

### Workspace tree

Most of the workspaces are built from other workspaces, and include all the features of the parent workspaces. 

For example, ansible-terrafrorm-workspace is built from ide-workspace, ide-workspace is built from base-workspace, 
and the latter is built from ubuntu-workspace.   

ubuntu-workspace -> base-workspace -> ide-workspace -> ansible-terrafrorm-workspace   

Ansible-terrafrorm-workspace has all the features of ide-workspace, base-workspace and ubuntu-workspace.

### Java

Java is not installed in some of the workspaces. It can be installed as easy as

```
sudo apt-get install openjdk-8-jre
```

You will most likely need environmental variable JAVA_HOME being permanently set. To do this we will need to create new image committing 
ENV variable

```
docker commit --change "ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/" space-1 space-image:0.3
```

### Run applications permanently

If you want application to keep running after terminal is closed start it with **"&!"** at the end. For example, the application we started in the previous section (NodeJs) should be started like this 

> ```npm-gui 0.0.0.0:19011 &!```

Now, if you disconnect from the workspace and close terminal, the application will still continue running in the workspace, untill the workspace is fully stopped (look in the section "Stop workspace").  

If you want application to run permanently all the time, ewhen the workspace container restarted and even on all the new images 
created from this workspace, use supervisord. [Read here how to create configuration file for supervisord](http://supervisord.org/configuration.html)

For example, in case we want to make npm-gui running permanently, create file with any name and extension **.conf** in the folder */etc/supervisord*

```
nano /etc/supervisord/npm-gui.conf
```

Paste the following 

```
[program:npm-gui]
directory=/home/npmgui
command=/bin/sh -c " . env/bin/activate && npm-gui 0.0.0.0:19011 "
```

And create folder for logs

```
mkdir -p /home/log
```

Create new workspace image with all the changes 

```
docker commit space-1  space-image:0.4
```

Stop currently running workspace
```
docker stop space-1
```

And run workspace from the newly-created image
```
docker run --name space-4 -d -p 19011:19011 space-image:0.4
```

## Create documentation

[MkDocs](https://www.mkdocs.org/) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) are included in the workspace.  

To start, clone the boilerplate and install dependencies

```
git clone https://github.com/peaceiris/mkdocs-material-boilerplate.git
cd mkdocs-material-boilerplate
pip install -r requirements.txt
```

Start MkDocs development server 

```
mkdocs serve -a 0.0.0.0:8035 --config-file mkdocs-sample.yml
```

Open [localhost:8035](http://localhost:8035/) 

Build static docs 

```
mkdocs build -d /home/static-server/my-doc-website --config-file mkdocs-sample.yml
```

Open [localhost:8022](http://localhost:8022/)


## Customize Workspace

### Customize Quickstart

Quickstart is served with [MkDocs](https://www.mkdocs.org/) from the `/home/docs/` folder. Simply modify `/home/docs/mkdocs.yml` to 
see the changes applied immediately. 

For example, let's add new page to Quickstart. To do that create new `.md` file in folder `/home/docs/docs/`. 
And add reference about this file to the MkDocs config `/home/docs/mkdocs.yml`. You will see that 
the new page has appeared in your Workspace UI.

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/workspace-docs.gif" alt="workspace-docs" width="900">
</p>

### Customize zsh

Zsh config is located in `/home/abc/.zshrc`. Customize themes, plugins, colors.  

Add env variables, for example 

```
export MY_NAME="foo"
```

Add aliases, for example 

```
alias ls="ls -lah"
```

Restart terminal to see changes applied.



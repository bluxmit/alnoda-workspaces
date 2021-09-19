# Workspace-in-docker

General-purpose dockerized workspace - an environment fully isolated inside a docker container. It can run anywhere, can be started and stopped, moved to another machine, archived 
to file or restored, pushed to docker registry, started on a cloud server.  

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/workspace-in-docker/img/wid-collage.png" alt="Collage">
</p>


#### Try it out
 
```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/workspace-in-docker
```  

## Contents

* [About](#about)
* [Code Editor](#code-editor)
* [Why workspace in docker](#why-workspace-in-docker)
* [Launch Workspace](#launch-workspace)
    * [Workspace terminal](#workspace-terminal)
    * [Multiple workspaces](#multiple-workspaces)
    * [Understanding ports](#understanding-ports)
    * [Docker in docker](#docker-in-docker)
    * [Run on remote server](#run-on-remote-server)
* [Use Workspace](#use-workspace)
 	* [Install applications](#install-applications)
 	* [Schedule jobs with Cron](#schedule-jobs-with-cron)
 	* [Python](#python)
 	* [Node.js](#node.js)
 	* [Run applications and services inside the workspace](#run-applications-and-services-inside-the-workspace)
* [Manage workspaces](#manage-workspaces)
    * [Start and stop workspaces](#start-and-stop-workspaces)
    * [Create new workspace image](#create-new-workspace-image)
    * [Manage workspace images](#manage-workspace-images)
    * [Save and load workspace images](#save-and-load-workspace-images)
    * [Move workspace to the cloud](#move-workspace-to-the-cloud)

## About

The Workspace contains browser-based Visual Studio Code, and several browser-based tools that make it more convenient to work from inside a docker container.  

<div align="center" style="font-style: italic;">
    Demo: Workspace in docker
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/workspace-in-docker/img/wid-demo.gif" alt="WID demo" width="900">
</p>

**Tools with UI** 

- Workspace own UI. Launch all workspace tools from one place. Customize to your yown needs, include docs.
- [**Eclipse Theia**](https://theia-ide.org/docs/) - open source version of popular Visual Studio Code IDE. Theia is trully open-source, has 
VS-Code extensions and works in browser. This means it can run inside a docker container on local machine or in cloud. A lot of beautiful color themes and many common plugins are already installed to save time.  
- [**Terminal**](https://github.com/tsl0922/ttyd) - secure browser-based terminal.
- [**FileBrowser**](https://github.com/filebrowser/filebrowser)  - manage files and folders inside the workspace, and exchange data between local environment and the workspace
- [**Cronicle**](https://github.com/jhuckaby/Cronicle)  - task scheduler and runner, with a web based front-end UI. It handles both scheduled, repeating and on-demand jobs, targeting any number of worker servers, with real-time stats and live log viewer.
- [**Static File Server**](https://github.com/vercel/serve) - view any static html sites as easy as if you do it on your local machine. Serve static websites easily.
- [**Ungit**](https://github.com/FredrikNoren/ungit) - rings user friendliness to git without sacrificing the versatility of it.
- [**MkDocs**](https://squidfunk.github.io/mkdocs-material/)  - maintain documentation for your workspace or project with only markdown. 
- [**Midnight Commander**](https://midnight-commander.org/)  - Feature rich visual file manager with internal text viewer and editor. 
- [**Process Monitor**](https://htop.dev/)  - Monitor running process and resource utilization. 

**Other:**
- Docker in docker
- [Zsh](https://www.zsh.org/), [Oh my Zsh](https://ohmyz.sh/)
- Python 3, Pip 
- Node/nodeenv
- git, git-flow 
- curl, wget, telnet, jq, 
- nano, vim, mc, ncdu, htop
- supervisord
- cron

*NOTE: This is an alternative workspace to the `codeserver-workspace`. It has all the features ot the latter, except for the 
different implementation of the Visual Studio Code.*

## Code Editor

The main code editor of this workspace is [**Eclipse Theia**](https://theia-ide.org/docs/) - an open-source version of popular Visual Studio Code IDE. 
despite Eclipse Theia is a browser-based code editor, it is fast, responsive, and full-featured. It features code highlighting, autocompletion, 
rendering of notebooks has a tree-based file browser, and a great number of pre-installed color themes.  

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/workspace-in-docker/img/theia-themes.png" alt="theia-themes.png" width="900">
</p>

You can install any extension from [open-vsx.org](https://open-vsx.org/) that has hundreeds of extensions for VS Code compatible editors. 
The IDE is already configured to make code highlighting for a great number of programming languages and file types. It also has many 
popular extensions installed  

<div align="center" style="font-style: italic;">
    Demo: Eclipse Theia
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/workspace-in-docker/img/theia.gif" alt="Theia demo" width="900">
</p>

## Why workspace in docker 

Workspace-in-docker - is a completely self-contained and fully isolated development environment, that runs inside a docker container. 
This image includes everything necessary to start coding right away. To use Workspace-in-docker, you don't need to install or use any other tools, apart from docker itself. 
Workspace can be used on a laptop, PC or launched on the remote server with HTTPS and authentication. Can be shared, backed up, and has versions. 
Very convenient if you work on multiple projects and need an easy way to switch between them.  

Read in detail about the [advantages of the dockerized workspace](https://github.com/bluxmit/alnoda-workspaces/blob/main/README.md#why-workspace-in-docker) 
and the [situations when workspace is a good choice](https://github.com/bluxmit/alnoda-workspaces/blob/main/README.md#use-cases)   

**TLDR:** This workspace might be quite useful when you want to:

- Avoid the tedious process of setting dev environment on your laptop
- Work conveniently with multiple IT projects on the same machine
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


## Launch Workspace

Workspaces - are merely docker containers, that's why managing workspaces is easy and intuitive - it is enough to know only docker commands, 
no need to learn any new tools.

In order to avoid confusion, the following convention is adopted: 

```sh
command to execute outside of the workspace
```

> `command to execute inside the workspace (after entering running docker container)`

To start a workspace simply execute in terminal

```sh
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/workspace-in-docker
```

*(It is recommended to run workspace in the daemon mode)*

***Open [http://localhost:8020](http://localhost:8020)***   

Workspace has its own UI, which includes quiklaunch (home) page and documentation pages. 
From the quiklaunch you can open any workspace tool. Documentation pages you modify in order 
to document the project, workspace use and setup.  

### Workspace terminal

There are several ways how to work with terminal of the the workspace-in-docker: 

- built-it in-browser terminal
- use terminal provided by in-browser IDE [http://localhost:8025](http://localhost:8025) ([unless other ports are mapped](#multiple-workspaces))
- ssh into the running the docker container (of the workspace) from your terminal

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/base-workspace/img/base-workspace-terminal.gif" alt="Base-Workspace terminal" width="750">
</p> 

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

### Multiple workspaces

Every workspace requires range of ports. If one workspace is up and running, the ports 8020-8035 are taken.   

Workspace-in-docker itself uses 9 ports (8020-8028), but it is recommended to map several extra ports just in case. Having extra ports, 
you can always launch new applications on these ports, and they will be immediately exposed outside of the workspace.  

In order to start another workspace, you either need to stop currently runnning workspace, or to run another workspace 
on the different port range.  

If you are planning to run more than one workspace at the same time, you can run another workspace with 
the different port range, for example

```sh
docker run --name space-2 -d -p 8040-8055:8020-8035 -e ENTRY_PORT=8040 alnoda/workspace-in-docker
```

Notice that in addition we need to set environmental variable ENTRY_PORT, which should be equal to the first port in the new range. 
Workspace UI usues this variable to know the new port range, and redirects to the proper addresses of the workspace applications' UIs.


### Understanding ports
The workspace was started with a port range mapping ***-p 8020-8035***. 
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

You don't need to memorize these ports. Workspace has UI from where you can open any of these applications. 
Open [localhost:8020](http://localhost:8020), and from there open other applications included in the workspace.  

<div align="center" style="font-style: italic;">
    Demo: Workspace UI 
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/workspace-in-docker/img/wid-ui.png" alt="wid-ui.png" width="750">
</p>

The rest of the ports from the port range can be used in order to expose optional applications, or applications you might 
install in future. So we map several extra ports just inn case.   

If you are planning to expose more applications 
from inside of a container, add additional port mapping, for example

```sh
docker run --name space-1 -d -p 8020-8035:8020-8035 -p 8080:8080 alnoda/workspace-in-docker
```
You can add multiple port mappings:
```sh
docker run --name space-1 -d -p 8020-8035:8020-8035 -p 8080:8080 -p 443:443 alnoda/workspace-in-docker
```

**NOTE:** It is not a problem if you don't expose any ports, but later on realise you need them - 
you will just create new image, and run it exposing the required port (look in the section [Create new image](#create-new-workspace-image)) 

### Docker in docker

It is possible to work with docker directly from the workspace (using workspace terminal). 

```
docker run --name space-1 -d -p 8020-8035:8020-8035 -v /var/run/docker.sock:/var/run/docker.sock alnoda/workspace-in-docker
```

NOTE: in order to use docker in docker you need to or enter into the workspace container as root
```sh
docker exec -it --user=root space-1 /bin/zsh
```

### Run on remote server

Because workspace is just a docker image, running it in any other server is as easy as running it on local laptop.  

Running on remote server makes it much simpler to collaborate, because you can just share credentials to the workspace with your peers, and they will be able to use it. 
You can also run applications that should run permanently, and run jobs on schedule.  

#### Unsecure remote workspace

The simplest deployment of the workspace requires only 3 steps:

- get virtual server on your favourite cloud (Digital Ocean, Linode, AWS, GC, Azure ...) 
- [install docker](https://docs.docker.com/engine/install/) on this server
- ssh to the remote server and start workspace 

```
docker run --name space-1 -d -p 8020-8035:8020-8035 -e WRK_HOST="<ip-of-your-remote-server>" alnoda/workspace-in-docker
```

**NOTE:** When running workspace on the remote server, add envronmental variable `-e WRK_HOST="<ip-of-your-remote-server>"`. 
Workspace UI needss this variable to know how redirect properly to the workspace applications' UIs.

Open in your browser `<ip-of-your-remote-server>:8020`  

If docker-in-docker is required, then 

```
docker run --name space-1 -d -p 8020-8035:8020-8035 -e WRK_HOST="<ip-of-your-remote-server>" -v /var/run/docker.sock:/var/run/docker.sock alnoda/workspace-in-docker
```

This way launches workspace in cloud, but such workspace is not secure, everyone who knows IP of your server will be able to use it.  

#### Secure remote workspace

*You might want to restrict access to the workspace, and secure encrypted communication with the workspace*  

Workspace-in-docker contains utility that will generate everything needed to launch the workspace in cloud in a secure way, with authentication and with TLS.  

If you want to run workspace on the remote server securely, start workspace-in-docker on your local laptop first, open its terminal and 
use utility `/home/abc/utils/remote.py` to generate create docker-compose project with TLS certificates. Simply execute

> `python /home/abc/utils/remote.py --workspace="workspace-in-docker" --port="8020" --host="68.183.69.198" --user="user1" --password="pass1"`  

**NOTE:** you have to specify the correct host (IP of the server you want to run the workspace on), and user and password of your choice.  

After the command is executed, you will see folder `/home/abc/utils/remote` is created. Download it out from the workspace to the local environment using the Filebrowser:

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/workspace-in-docker/img/wid-remote.gif" alt="wid-remote.gif" width="750">
</p>

. Copy this folder to the remote server where you want to launch the Python workspace. 
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



## Use Workspace

Among the common actions you'd do in the workspace are

- installation of new applications and runtimes 
- edit files, write code, scripts
- build, compile and execute code 
- start/stop applications and services
- schedule tasks and scripts
- process data

### Install applications

Use workspace workspace terminal to install new applications. 
Install with ```sudo apt install```. The default *abc* user is allowed to install packages.  

For example, in order to install [Emacs text editor](https://www.gnu.org/software/emacs/) open workspace terminal, and execute 

> `sudo apt install emacs`


### Schedule jobs with Cron 

Schedule execution of any task with cron - a time-based job scheduler in Unix-like computer operating systems.   

Open workspace terminal, and execute

> `crontab -e`

*(chose [1] nano as editor on the first time)*
In the end of the opened file add line  

> `* * * * * echo $(whoami) >> /home/cron.txt`

This will print every minute username to file */home/cron.txt* . *(Hit Ctrl+X to exit nano)*

Hint: example of cron job definition:   
```
.---------------- minute (0 - 59)   
|  .------------- hour (0 - 23)
|  |  .---------- day of month (1 - 31)
|  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
|  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
|  |  |  |  |
*  *  *  *  *  command to be executed
```

**NOTE** you can disconnect from the image and close terminal - cron will continue working.

> Instead of cron you might want to use Cronicle - a tool with Web UI, and a great list of features 
> that will provide you with the dashboard, list of executions and statistics, even let you ser limis 
> on resources for each jobs, and create depenndencies between jobs.

### Python
Python and Pip are installed. To use python console, open workspace terminal and execute 

> `python`

install python package with pip, for 

> `pip install pandas`

If you are planning to work with python, we recommend to install IPython, that provides a rich toolkit to help 
you make the most of using Python interactively. Install and start ipython

> ```pip install ipython```  
> `ipython`

### Node.js
We recommend to use nodeenv to create different node environments.  

For example, open workspace terminal, create folder npmgui, and activate environment with node v. 12.18.3 and npm v.6.0.0

> `cd /home`  
> `mkdir npmgui; cd npmgui`  
> `nodeenv --node=12.18.3 --npm=6.0.0 env`

Let's install package and start node application 

> `. env/bin/activate && npm i -g npm-gui`   
> `npm-gui 0.0.0.0:8030`

Open your browser on http://localhost:8030/ 

**NOTE:** If you close terminal, the application will stop. See how to [start applications that reamin live after closing a workspace terminal](#run-applications-and-services-inside-the-workspace)


### Run applications and services inside the workspace

If you want application to keep running after workspace terminal is closed start it with **"&!"** at the end. 

For example, in the last section we started *npm-gui* tool with command `npm-gui 0.0.0.0:8030`. If you close the workspace terminal, 
this application witll stop running. To keep it running after terminal is closed, execute

> `npm-gui 0.0.0.0:8030 &!`   

Now, if you disconnect from the workspace and close terminal, the application will continue running in the workspace, untill [workspace is stopped](#start-and-stop-workspaces).   

## Manage workspaces

Workspace is just a docker container. You can start, stop, delete and do anything you can do with docker images and containers.    

There are two concepts to keep in mind: **images** and **containers**. Images are workspace blueprints. For example, **alnoda/workspace-in-docker** - 
is an image. When you execute this command 

```sh
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/workspace-in-docker
```
you create container called **space-1** from the image **alnoda/workspace-in-docker**. You can create any number of containers, but you need to 
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
docker rmi -f alnoda/workspace-in-docker
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


## Workspace Documentation

Workspace can easily be customized for your specific needs. You can also use Workspace for a complex project, and might need a 
tool to write remarks, plans, action plans. As well as architectural artefacts for the components you wish to implement. Often it is 
also needed to store somewhere snippets of code or shell commands that you often use in your work. It would be uncomfortable to use extra 
tool or solution outside of the Workspace to store such remarks. 

Because Workspace is a complete self-contained environment, it include tools to make remarks, plans, store pieces of code, write anything, 
and even build complete static documentation websites that you can host on GitHub Pages for example.  

[MkDocs](https://www.mkdocs.org/) is a part of the workspace, and its dev server is up and running every time you start the Workspace. In fact, 
the workspace UI (port 8020 by default) - is served by the MkDocs dev server.  

You can easily modify the UI, add more pages or update existing pages. The changes will be updated immediately without the need to do anything. 

MkDocs project is located in the `/home/docs/` folder. It has subfolder called `docs` (so it is `/home/docs/docs/`) where all the Markdown documents 
are stored. Simply create new `.md` file there. And add reference about this file to the MkDocs config `/home/docs/mkdocs.yml`. You will see that 
the new page has appeared in your Workspace UI - it has live reload, and you dont need to do annything, just write in the markdown files.


<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/workspace-docs.gif" alt="workspace-docs" width="900">
</p>

You can easily build beautiful static website from this documentation

> `cd /home/docs/ && mkdocs build -d /home/static-server/my-doc-website` 

The resulting HTML website is in folder `/home/static-server/my-doc-website`, you can view it with Static File Server and download to local 
with Filebrowser.  

You can make even more stunning documentation websites with advanced Markdown features using [MkDocs-Magicspace](https://mkdocs-magicspace.alnoda.org/).





# Base-workspace

Base-Workspace - is an attemp to use docker as a light-weight Virtual Machine with batteries included, which is intended to be used 
entirely through WEB-based interfaces - its own WEB-UI, WEB-based terminal, filebrowser, visual scheduler and other.  

> TL;DR  
> You can provide your users with many virtual environments, manage just one server, and have no hassle with server configuration.

Because Ddocker is not completely suitable to serve this purpose, Base-Workspace tries to cover some of the shortcomings: it has cron set up, supervisord, allows to start multiple processes 
inside the same container, has docker-in-docker, and some other applications installed, such as Git, Gitflow, wget, nano, vim etc.  

In addition Base-Workspace has some applications with WEB-UI, which make it easier to scheddule and monitor job executions, browse and 
exchange files, work with terminal, monitor resources and processes running inside the docker container.   

For convenience, Base-workspace has its own WEB UI, which you can use to quickly open in browser the UIs of the applications 
running inside the workspace. 

![base-workspace-presentation](./img/base-workspace.gif)  

Base-Workspace can be used as isolated environment on local machine, or as alternative to VM on the cloud server. It can run as root, 
or as default **abc** user that is allowed to use *apt-get*.

## Contents

 * [Use-cases](#use-cases)
 * [Features](#features)
 * [Launch Workspace](#launch-workspace)
    * [Workspace terminal](#workspace-terminal)
    * [Multiple workspaces](#multipl-workspaces)
    * [Open more ports](#open-more-ports)
    * [Run as root](#run-as-root)
    * [Docker in docker](#docker-in-docker)
    * [Run on remote server](#run-on-remote-server)
 * [Use Workspace](#use-workspace)
 	* [Install new packages](#install-new-packages)
 	* [Schedule jobs with Cron](#schedule-jobs-with-cron)
 	* [Python](#python)
 	* [Node.js](#node.js)
 	* [Run applications and services inside the workspace](#run-applications-and-service-inside-the-workspace)
* [Manage workspaces](#manage-workspaces)
    * [Start and stop containers](#start-and-stop-containers)
    * [Create new workspace image](#create-new-workspace-image)
    * [Manage workspace images](#manage-workspace-images)
    * [Save and load workspace images](#save-and-load-workspace-images)


## Use-cases

VMs are great, but they are too heavy and require way too much resources, even more than enhanced docker containers like this one. There exist  
cases when we need isolation as in VMs, but not all the features and security of VMs. Hence there is no need to pay extra price. 

A typical example of such use cases are virtual environments to run background jobs, check liveness of services or websites, do all kind of checks, 
schedule maintenance tasks, have cli to a database, run internal non-critical services, launch WEB-scrapping applications, generate reports, 
run ETL scripts and many others.  

Since these jobs are owned by multiple users we need some kind of isolation. Running separate servers for every user would be too cost-inefficient. 
Most periodic tasks utilize compute resources from time to time, and running the server all the time would be such a waste. It makes more sense 
to have one server where all these virtual environments are running. Aslo it easier for sysops to monitor and maintain a single server.  

Base-workspace is a way to provide isolated environments on a shared server, which is used by multiple users. It is more resource-efficient than VM, 
it is secure (if running under defualit user), and it is convenient to use, becuause Base-workspace is bootstrapped with many commonly used applications, 
it has WEB-UI, and users work with it entirely through browser. 

## Features

Being an extension of [ubuntu-workspace-in-docker](https://github.com/Alnoda/ubuntu-workspace-in-docker), this image has all the features that 
ubuntu-workspace has.   

Workspace includes several open-source tools with browser-based GUI:

- [**FileBrowser**](./features.md#filebrowser)  - manage files and folders inside the workspace, and exchange data between local environment and the workspace
- **Terminal**  - Full-fledged browser-based terminal with Z-shell. 
- [**Cronicle**](./features.md#cronicle)  - task scheduler and runner, with a web based front-end UI. It handles both scheduled, repeating and on-demand jobs, targeting any number of worker servers, with real-time stats and live log viewer.
- [**Static File Server**](./features.md#static-file-server) - view any static html sites as easy as if you do it on your local machine. Serve static websites easily.
- [**Ungit**](./features.md#ungit) - rings user friendliness to git without sacrificing the versatility of it.
- [**MkDocs**](./docs.md)  - create documentation for your workspace or project with only markdown. 
- **Midnight Commander**  - Feature rich visual file manager with internal text viewer and editor. 
- **Process Monitor**  - Monitor for running process and resource utilization. 

Despite having WEB UI tools, Base-Workspace does not include IDE. This workspace serves eitehr of 2 use-cases:

- for those who prefer coding in terminal-based editors (emacs, vim, nano etc.)
- for customization and adding IDE of chioce or closed-source ide

## Launch Workspace

In order to avoid confusion, the following convention is adopted: 

```sh
command to execute outside of the workspace
```

> `command to execute inside the workspace (after entering running docker container)`

To start Base Workspace simply execute in terminal

```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 alnoda/base-workspace
```

### Workspace terminal

enter into the running workspace container
```sh
docker exec -it space-1 /bin/zsh
```

If you don't want to use z-shell
```
docker exec -it space-1 /bin/bash
```

You can work in Ubuntu terminal now. Execute the followinng command to know your workspace user 

> `whoami`

### Multiple workspaces

Every workspace requires range of ports. If one workspace is up and running, the ports 8020-8030 are taken.   

In order to start another workspace it is necessary either to stop currently runnning workspace, or to run another workspace 
on the different port range.  

If you are planning to run multiple workspaces at the same time, you can run second workspace with different port range

```sh
docker run --name space-2 -d -p 8040-8050:8020-8030 -e ENTRY_PORT=8040 alnoda/base-workspace
```

Notice that in addition we need to set environmental variable ENTRY_PORT, which should be equal to the first port in the new range. 
This is needed for the documentation main page to set up correct links to other tools (Filebrowser, Cronicle etc.)


### Open more ports
We started workspace container with a port range mapped "-p 8020-8030". If you are planning to expose more applications 
from inside of a container, add additional port mapping, for example

```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 -p 8080:8080 alnoda/base-workspace
```
You can add multiple port mappings:
```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 -p 8080:8080 -p 443:443 alnoda/base-workspace
```

**NOTE:** It is not a problem if you don't expose any ports, but later on realise you need them - 
you will just create new image, and run it exposing the required port (look in the section [Create new image](#create-new-image)) 

### Run as root
The default user is **abc** with passwordless sudo to install packages. If you'd rather work as root, then you should ssh into running container as
```sh
docker exec -it --user=root space-1 /bin/zsh
```
You can of course open several terminals to the same running containner as both abc and root users at the same time.

### Docker in docker

It is possible to work with docker directly from the workspace. 

```
docker run --name space-1 -d -p 8020-8030:8020-8030 -v /var/run/docker.sock:/var/run/docker.sock alnoda/base-workspace
```

NOTE: in order to use docker in docker you need to or enter into the workspace container as root
```sh
docker exec -it --user=root space-1 /bin/zsh
```

### Run on remote server

Because workspace is just a docker image, running it in cloud is as easy as running it on local laptop. There are only 3 steps: 

- get virtual server on your favourite cloud (Digital Ocean, Linode, AWS, GC, Azure ...) 
- [install docker](https://docs.docker.com/engine/install/) on this server
- ssh to the remote server and start workspace. Add envronmental variable `-e WRK_HOST="<ip-of-your-remote-server>"` 

```
docker run --name space-1 -d -p 8020-8030:8020-8030 -e WRK_HOST="<ip-of-your-remote-server>" alnoda/base-workspace
```

if docker-in-docker needed then 

```
docker run --name space-1 -d -p 8020-8030:8020-8030 -e WRK_HOST="<ip-of-your-remote-server>" -v /var/run/docker.sock:/var/run/docker.sock alnoda/base-workspace
```

Open in your browser `<ip-of-your-remote-server>:8020`


## Use Workspace

The common actions inside the workspace include

- installation of new applications and runtimes 
- edit files, write code, scripts
- build, compile and execute code 
- start/stop applications and services
- schedule tasks and scripts
- process data

### Install new packages
Install new packages with ```sudo apt install```. The default abc user is allowed to install packages.  

For example, in order to install [Emacs text editor](https://www.gnu.org/software/emacs/) make sure you 
have entered running docker container (of the workspace), and execute in terminal

> `sudo apt install emacs`


### Schedule jobs with Cron 

Schedule execution of any task with cron - a time-based job scheduler in Unix-like computer operating systems.   

In order to create scheduled job enter running docker container, and execute in terminal

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

> In addition to the commonly known ***cron scheduler*** you can use Cronicle - the tool with Web UI and great features 
> which is bundeled together with the Base-Workspace.  

### Python
Python and Pip are installed. To start python console, enter running docker container, and execute in terminal 

> `python`

install python package with pip, for 

> `pip install pandas`

If you are planning to work with python, we recommend to install IPython, that provides a rich toolkit to help 
you make the most of using Python interactively. Install and start ipython

> ```pip install ipython```  
> `ipython`

### Node.js
We recommend to use nodeenv to create different node environments.  

For example, create folder npmgui, and activate environment with node v. 12.18.3 and npm v.6.0.0 (make sure you are inside workspace docker container)

> `cd /home`  
> `mkdir npmgui; cd npmgui`  
> `nodeenv --node=12.18.3 --npm=6.0.0 env`

Let's install package and start node application 

> `. env/bin/activate && npm i -g npm-gui`   
> `npm-gui 0.0.0.0:8030`

Open your browser on http://localhost:8030/ 

**NOTE:** If you close terminal, the application will stop. See how to [start applications that reamin live after closing a workspace terminal](#run-applications-and-services-inside-the-workspace)


### Run applications and services inside the workspace

If you want application to keep running after terminal is closed start it with **"&!"** at the end. 

For example, enter into the running workspace container, and start the example node application from the previous section:  

> `cd /home/npmgui`   
> `. env/bin/activate && npm i -g npm-gui &!`

Now, if you disconnect from the workspace and close terminal, the application will still continue running in the workspace, untill [workspace is stopped](#start-and-stop-workspaces).   

If you want application to start automatically each time workspaces is restarted, or the new workspace is created, see [running applications permanently](extend.md#add-applications-and-services)


## Manage workspaces

Workspace is just a docker container. You can start, stop, delete and do anything you can do with docker images and containers.    

There are two concepts to keep in mind: **images** and **containers**. Images are workspace blueprints. For example, **alnoda/base-workspace** - 
is an image. When you execute this command 

```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 alnoda/base-workspace
```
you create container called **space-1** from the image **alnoda/base-workspace**. You can create any number of containers, but you need to 
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
docker rmi -f alnoda/base-workspace
```

**NOTE:** you cannot delete image if there is a running container created from it. Stop container first.

### Save and load workspace images

After you commit workspace container, and create new image out of it, you can push it to your docker registry or save it as a file.  

**SAVING IMAGE AS FILE**   

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

**PUSHING IMAGE TO YOUR REGISTRY**   

A better way to manage images is docker registries. You can use docker registries in multiple clouds. They are cheap annd very convenient.  
Check out for example, [Registry in DigitalOcean](https://www.digitalocean.com/products/container-registry/) or in [Scaleway container registry](https://www.scaleway.com/en/container-registry/). There are more.   

Pushing image to registry is merely 2 extra commands: 1) tag image; 2) push image   

You will be able to pull image on any device, local or cloud.






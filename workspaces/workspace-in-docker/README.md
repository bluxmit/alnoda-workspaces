# Workspace-in-docker

Workspace-in-docker has all the features of the *Base-Workspace*, and in addition it includes 
a powerful browser-based version of Visual Studio Code. It is a lightweight VM alternative, which provides full isolation, 
consumes little resources and contains full-fledged IDE.

![Workspaces are amazing!](./img/workspace-demo.gif)

This workspace allows complete isolation of many IT-related projects, such as software development, devops, QA, data analysis, data engineering, data science and other. 
Workspace can be used as local development environment, as well as remote, when started on the cloud server, and can be secured with password. 

Workspace-in-docker allows to completely isolate and switch easily between projects that involve multiple programming languages, cloud CLIs, 
k8s clusters, configurations and have system dependencies. Withou this workspace swithing between such complex environments would require multiple actions and can be tedious work.  

Workspace-in-docker is great for collaborative work - itcan be easily shared, moved to any cloud server, backed up, has versions and can be easily extended and customized.  
Can be used as build, test or even runtime environment. 

Workspace-in-docker is a good choice if you want control and versatility. It is lightweight, 
includes open-source tools and nearly as convenient as working directly with a local environment.   

## Contents

 * [What's included](#what's-included)
 * [Use-cases](#use-cases)
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
    * [Start and stop workspaces](#start-and-stop-workspaces)
    * [Create new workspace image](#create-new-workspace-image)
    * [Manage workspace images](#manage-workspace-images)
    * [Save and load workspace images](#save-and-load-workspace-images)

## What's included

- **Workspace UI** - launch all workspace tools from one place.
- [**Eclipse Theia**](https://theia-ide.org/docs/) - open source version of popular Visual Studio Code IDE. Theia is trully open-source, has 
VS-Code extensions and works in browser. This means it can run inside a docker container on local machine or in cloud.
- [**FileBrowser**](https://github.com/filebrowser/filebrowser)  - manage files and folders inside the workspace, and exchange data between local environment and the workspace
- [**Cronicle**](https://github.com/jhuckaby/Cronicle)  - task scheduler and runner, with a web based front-end UI. It handles both scheduled, repeating and on-demand jobs, targeting any number of worker servers, with real-time stats and live log viewer.
- [**Static File Server**](https://github.com/vercel/serve) - view any static html sites as easy as if you do it on your local machine. Serve static websites easily.
- [**Ungit**](https://github.com/FredrikNoren/ungit) - rings user friendliness to git without sacrificing the versatility of it.
- [**MkDocs**](https://squidfunk.github.io/mkdocs-material/)  - maintain documentation for your workspace or project with only markdown. 

Built on top of Base-workspace and Ubuntu-workspace, this workspace has all the features those workspaces have. 
In particular, workspace-in-docker provides excellent experience when working directly in the terminal, and has docker-in-docker.

## Use-cases

Based on Ubuntu, this workspace works best for users who know what `apt-install` is. This workspace has open-source WEB-based 
VS-code variant, and a set of tools that make it easy to manage data inside docker, exchange files with local environnment, work with Git 
and create beautiful documentations for your projects.  

Workspace-in-docker has Python and Node.js, but if you need other runtimes such as Java, Ruby or Go, you will have to install it yourself. 

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
docker run --name space-1 -d -p 8020-8030:8020-8030 alnoda/workspace-in-docker
```

***Open [http://localhost:8020](http://localhost:8020)***   

Workspace has web-based documentation with home page, from where you can open any workspace tool.  

It is recommended to run workspace in the daemon mode.

### Workspace terminal

There are 2 ways how to work with terminal inside the workspace-in-docker: 

- use terminal provided by in-browser IDE [http://localhost:8025](http://localhost:8025) ([unless other ports are mapped](#multiple-workspaces))
- enter running workspace docker container from your terminal

If you want to enter running workspace container from your terminal execute:
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
docker run --name space-2 -d -p 8040-8050:8020-8030 -e ENTRY_PORT=8040 alnoda/workspace-in-docker
```

Notice that in addition we need to set environmental variable ENTRY_PORT, which should be equal to the first port in the new range. 
This is needed for the documentation main page to set up correct links to other tools (Filebrowser, Cronicle etc.)


### Open more ports
We started workspace container with a port range mapped "-p 8020-8030". If you are planning to expose more applications 
from inside of a container, add additional port mapping, for example

```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 -p 8080:8080 alnoda/workspace-in-docker
```
You can add multiple port mappings:
```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 -p 8080:8080 -p 443:443 alnoda/workspace-in-docker
```

**NOTE:** It is not a problem if you don't expose any ports, but later on realise you need them - 
you will just create new image, and run it exposing the required port (look in the section [Create new image](#create-new-workspace-image)) 

### Run as root
The default user is **abc** with passwordless sudo to install packages. If you'd rather work as root, then you should ssh into running container as
```sh
docker exec -it --user=root space-1 /bin/zsh
```
You can of course open several terminals to the same running containner as both abc and root users at the same time.

### Docker in docker

It is possible to work with docker directly from the workspace. In order to be able to use docker directly inside the workspace, 
start the workspace with mounting `/var/run/docker.sock` and using root user:

```
docker run --name space-1 -d -p 8020-8030:8020-8030 -v /var/run/docker.sock:/var/run/docker.sock --user=root alnoda/workspace-in-docker
```

Alternatively you can run workspace as non-root
```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 -v /var/run/docker.sock:/var/run/docker.sock alnoda/workspace-in-docker  
```
but whenever you want to use docker enter into the workspace container as root
```
docker exec -it --user=root space-1 /bin/zsh
```

### Run on remote server

Because workspace is just a docker image, running it in cloud is as easy as running it on local laptop. There are only 3 steps involved: 

- get virtual server on your favourite cloud (Digital Ocean, Linode, AWS, GC, Azure ...) 
- [install docker](https://docs.docker.com/engine/install/) on this server
- ssh to the remote server and start workspace with envronmental variable `-e WRK_HOST="<ip-of-your-remote-server>"` 

```
docker run --name space-1 -d -p 8020-8030:8020-8030 -e WRK_HOST="<ip-of-your-remote-server>" alnoda/workspace-in-docker
```

if docker-in-docker needed then 

```
docker run --name space-1 -d -p 8020-8030:8020-8030 -e WRK_HOST="<ip-of-your-remote-server>" -v /var/run/docker.sock:/var/run/docker.sock alnoda/workspace-in-docker
```

Open in your browser `<ip-of-your-remote-server>:8020`   

When running workspace-in-docker on the remote server, it is useful to add authentication mechanism, otherwise anyone in the world 
who gets to know the IP of the remote server will be able to use your workspace. We have created a docker-compose file, that will 
let you launching workspace with authentication - [read the instructions here](https://github.com/Alnoda/workspaces-in-docker/blob/main/workspaces/workspace-in-docker/md/auth-for-remote-workspace.md)

> [Check out the complete docs](https://alnoda.org) to know more.

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
> which is bundeled together with the workspace-in-docker.  

### Python
Python, Pip and Venv are installed. To start python console, enter running docker container, and execute in terminal 

> `python`

install python package with pip, for 

> `pip install pandas`

If you are planning to work with python, we recommend to install IPython, that provides a rich toolkit to help 
you make the most of using Python interactively. Install and start ipython

> ```pip install ipython```  
> `ipython`

Example of using [venv](https://docs.python.org/3/tutorial/venv.html)

> `cd ~p; mkdir /home/project/venv-test; cd venv-test`  
> `python3 -m venv example-env`  
> `source example-env/bin/activate`

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

**NOTE:** If you close terminal, the application will stop. See how to [start applications that keep running after closing a workspace terminal](#run-applications-and-services-inside-the-workspace)


### Run applications and services inside the workspace

If you want application to keep running after terminal is closed start it with **"&!"** at the end. 

For example, enter into the running workspace container, and start the example node application from the previous section:  

> `cd /home/npmgui`   
> `. env/bin/activate && npm i -g npm-gui &!`

Now, if you disconnect from the workspace and close terminal, the application will still continue running in the workspace, untill [workspace is stopped](#start-and-stop-workspaces).   

If you want application to start automatically each time workspaces is restarted, or the new workspace is created, see [running applications permanently](extend.md#add-applications-and-services)


## Manage workspaces

Workspace is just a docker container. You can start, stop, delete and do anything you can do with docker images and containers.    

There are two concepts to keep in mind: **images** and **containers**. Images are workspace blueprints. For example, **alnoda/workspace-in-docker** - 
is an image. When you execute this command 

```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 alnoda/workspace-in-docker
```
you create container called **space-1** from the image **alnoda/workspace-in-docker**. You can create any number of containers, but you need to 
[map different ports to each of them](#multiple-workspaces).  

Container - is your workspace. You can start, stop and delete them. You can run multiple workspace containers at the same time, or work with 
one workspace at a time.   

From the workspace (which is a container) you can create new image. This is called **commit docker image**. 
Essentially, this means *"take my workspace and create new image with all the changes I've done in my workspace*"

### Start and stop workspaces

The workspace started in daemon mode will continue working in the background. 

See all the running docker containers (including workspaces)

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

After you commit workspace container, and create new image out of it, you can push it to your docker registry or save it as a file.  

#### Save workspace as file

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

#### Push workspace to private docker registry 

A better way to manage images is docker registries. You can use docker registries in multiple clouds. They are cheap annd very convenient.  
Check out for example, [Registry in DigitalOcean](https://www.digitalocean.com/products/container-registry/) or in [Scaleway container registry](https://www.scaleway.com/en/container-registry/). There are more.   

Pushing image to registry is merely 2 extra commands: 1) tag image; 2) push image   

You will be able to pull image on any device, local or cloud.
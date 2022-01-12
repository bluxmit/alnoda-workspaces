# Ubuntu-workspace

Use docker as a lightweight Virtual Machine. Provides isolation of environments, 
and requires less resources than VMs. Run locally or on a cloud server (with HTTPS and auth).  

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/ubuntu-wid-collage.png" alt="Collage">
</p>

Try it out:

```
docker run --name space-1 -d -p 8026:8026 alnoda/ubuntu-workspace
```

and open localhost:8026 in browser.

## Contents

* [About](#about)
* [Why this workspace](#why-this-workspace)
* [Getting started](#getting-started)
    * [Ports](#ports)
    * [Run as root](#run-as-root)
    * [Docker in docker](#docker-in-docker)
    * [Run in cloud](#run-in-cloud)
* [Features](#features)
* [Use Workspace](#use-workspace)
    * [Install new packages](#install-new-packages)
    * [Schedule jobs with cron](#schedule-jobs-with-cron)
    * [Python](#python)
    * [Node.js](#node.js)
* [Manage workspaces](#manage-workspaces)
    * [Start and stop containers](#start-and-stop-containers)
    * [Create new image](#create-new-image)
    * [Manage images](#manage-images)
    * [Save and load images](#save-and-load-images)
    * [Move workspace to the cloud](#move-workspace-to-the-cloud)
    * [Collaborate and share workspaces](#collaborate-and-share-workspaces)
* [Extend](#extend)
    * [Java](#java)
    * [Run applications permanently](#run-applications-permanently)


## About 

Ubuntu-workspace comes in 2 versions: minimal an standard. The default version is standard. 

### Minimal 

Minimal Ubuntu-workspace allows to start multiple processes inside the same docker container, has Python, Node.js (nodeenv), 
and a collection of common applications such as text editors, git, supervisord, z-shell, etc.

Primarily intended as an advanced Ubuntu terminal that runs anywhere, this workspace works best 
when you need interactive Linux, python, or node shell for ad-hock tasks.  

<div align="center" style="font-style: italic;">
    Demo: Minimal Ubuntu-workspace
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/ubuntu-workspace.gif" alt="Ubuntu workspace" width="900">
</p>

### Standard

In addition to the features of the Minimal Ubuntu-workspace, this workspace also has docker-in-docker and a browser-based 
terminal. The latter allows to launch workspace on any cloud server and work with it from any device. When the workspace 
runs on the remote server, access can be restricted with a password, and communication with the server is encrypted. 

<div align="center" style="font-style: italic;">
    Demo: Standard Ubuntu-workspace
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/ubuntu-workspace-remote.gif" alt="Standard Ubuntu workspace" width="900">
</p>


## Why this workspace

This workspace provides a terminal to the completely isolated Linux environment. This can be quite useful when you need to:

- make experiments (try new packages, versions, stacks, etc.) without risk of affecting the primary environment.
- collaborate with colleagues easily by sharing the entire workspaces.
- run background jobs on schedule, and be able to start/stop the whole group of jobs with one action.
- move the entire local workspace to any powerful cloud server in minutes.
- back up entire workspaces with important work, and have versions of the workspaces.

More information: 
- [Advantages of the dockerized workspace](https://github.com/bluxmit/alnoda-workspaces/blob/main/README.md#why-workspace-in-docker) 
- [Situations when workspace is a good choice](https://github.com/bluxmit/alnoda-workspaces/blob/main/README.md#use-cases)
- [The way I use Docker as interactive environment for tries and experiments](https://medium.com/@bluxmit/the-way-i-use-docker-as-interactive-environment-for-tries-and-experiments-52ac06c0ec69)
- [Docker as a lightweight VM - docker image that you can use as VM substitute](https://medium.com/@bluxmit/docker-as-a-lightweight-vm-docker-image-that-you-can-use-as-vm-substitute-164032e4ed0b)


## Launch Workspace

In order to avoid confusion, the following convention is adopted: 

```sh
command to execute outside of the workspace
```

> `command to execute inside the workspace (after entering running docker container, or in the browser-based workspace terminal)`

### Start local workspace

In order to **start standard Ubuntu-workspace** open terminal, and execute:

```sh
docker run --name space-1 -d -p 8026:8026 alnoda/ubuntu-workspace
```
and navigate in browser to [http://localhost:8026](http://localhost:8026)  

Minimal Ubuntu-workspace does not expose any applications, and does not require a port. 
You can **start minimal Ubuntu-workspace** by executin in terminal

```
docker run --name space-1 -d alnoda/ubuntu-workspace:minimal
```

Now you can ssh into the running workspace container (both minimal and standard workspaces) 
```sh
docker exec -it space-1 /bin/zsh
```

If you don't want to use z-shell
```
docker exec -it space-1 /bin/bash
```

### Ports
In the example above, the standard Ubuntu-workspace container was started with a port mapping "-p 8026:8026" to expose a browser-based terminal. 
Browser-based is especially useful if you are planning to move your workspace to cloud server or prefer web-based terminal over your system terminal. 
Browser-based terminal is true color, and might work better with some of the terminnal-based applications.  

Workspace - is an interactive environment, and you often don't know how many applications you will launch when working inside the workspace. 
That's why it is reasonable to allocate a small port range for the workspace. Then you will always have extra ports that you 
can use

```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 alnoda/ubuntu-workspace
```

Sometimes you cannot chose the port applications runs on, and might want to provide it separately when starting the workspace

```
docker run --name space-1 -d -p 8020-8030:8020-8030 -p 19011:19011 alnoda/ubuntu-workspace
```

**NOTE:** It is not a problem if you don't expose any ports from the start. If later on you realise that other ports are needed, 
you will simply [commit workspace to a new image, and start the workspace again with more ports](#create-new-image).


### Run as root

The default workspace user is **abc**, it has passwordless sudo to install packages. If you'd rather work as root, then you should ssh into running container as

```sh
docker exec -it --user=root space-1 /bin/zsh
```

You can of course open several terminals to the same running containner as both abc and root users at the same time.  

If you plan to work as root user all the time, start workspace as a root in the first place:

```
docker run --name space-1 -d -p 8020-8030:8020-8030 --user=root alnoda/ubuntu-workspace
``` 

**NOTE:** start workspace as a root user if you run workspace for personal use only! If you provide workspace for freelancer, partner, 
collaborator, client or for internal development platform - use default user `abc`. 


### Docker in docker

Standard Ubuntu-workspace has docker in docker. This means that you can build docker images, start and stop docker 
containers directly from the workspace. In order to enable docker-in-docker start workspace with:

```
docker run --name space-1 -d -p 8026:8026 -v /var/run/docker.sock:/var/run/docker.sock alnoda/ubuntu-workspace
```

**NOTE:** Default `abc` user will not be able to use docker inside the workspace. 
To use docker in docker you need to or enter into the workspace container as a root user 

```sh
docker exec -it --user=root space-1 /bin/zsh
```

*(or launch workspace as root in the first place)*  


**NOTE:** docker-in-docker is realised by mapping `docker.sock` to the container. This essentially means that 
root user of the workspace has control over all docker containers in the entire system. Allow docker-in-docker 
only for personal use.

### Run in cloud

Running workspaces on the remote server is convenient for collaboration (share workspace); running heavy or long-running workloads 
(i.e. simulations); scheduling periodic tasks, and other. Ubuntu-workspace has WEB-based terminal, 
and you will be able to use workspace from any device.   

Workspace - is just a docker image, hence it can run on any server where docker can run. The easiest way to 
launch workspace on the remote server is to ssh there, and execute the same command you'd use for the local 

```
docker run --name space-1 -d -p 8026:8026 alnoda/ubuntu-workspace
```

**NOTE:** workspace launched this way is not secure and not protected. Anyone will be able to use it. Use this 
method only in the trusted internal network.   

#### Secure remote workspace

Ubuntu-workspace (the standard version) can be launchedd on the cloud server securely, with authentication and TLS 
encryption. There are different ways how to make this happen, one of thm - is to put workspace behind the reverse proxy 
with HTTPS, TLS encryption and auth middleware. Here is an [example of a docker-compose with Traefik proxy](./doc/remote-wid.md), 
it add auth but no encryption.  

Standard Ubuntu-workspace includes a small utility that will generate everything needed to spin-up workspace with 
authentication and HTTPS with self-signed certificate. To use the utility, [start the workspace on a local machine first](#standard), 
open workspace terminal, and execute 

> `python /home/abc/utils/remote.py --workspace="ubuntu-workspace" --host="<IP_OF_CLOUD_SERVER_WITH_PUBLIC_ACCESS>" --user="<ANY_USER_NAME>" --password="<ANY_USER_PASSWORD>"`   

Notice that you'll need to set the following: 

- IP_OF_CLOUD_SERVER_WITH_PUBLIC_ACCESS
- ANY_USER_NAME
- ANY_USER_PASSWORD 

For example,   

> `python /home/abc/utils/remote.py --workspace="ubuntu-workspace" --host="68.183.69.198" --user="user1" --password="pass1"`   

Now you can navigate in your browser to `<IP_OF_CLOUD_SERVER_WITH_PUBLIC_ACCESS>:8026` in order to open the workspace terminal.  

**NOTE:** The HTTPS is with self-signed certificate, and your browser will show a warning, asking you to accept the risk 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/accept-risks.png" alt="accept-risks.png" width="750">
</p>

After you accept the risk, authentication window will appear asking you the user and password, that you have set as`<ANY_USER_NAME>`, `<ANY_USER_PASSWORD>`.   

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/auth.png" alt="auth.png" width="750">
</p>


## Features

To make working in the ubuntu-workspace more convenient, it already includes several terminal-based applications. 
The latter make it easier to browse files, check running processes and resource utilization and edit text files.  

Explore file system with Midnight Commander

> ```mc```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/mc.png" alt="Moonlignt commander" width="750">
</p>

Launch system-monitor, process-viewer and process-manager  
```
htop
```
<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/htop.png" alt="Htop" width="750">
</p>

Explore file/folder sizes
```
ncdu
```
<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/ncdu.png" alt="Htop" width="750">
</p>

Text editors ```vim```, ```nano``` and ```mcedit``` are available. For example, clone git repo and edit python file with nano
```
git clone https://github.com/dimaba/sendmail.git
cd sendmail
nano sendmail.py 
```
<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/nano.png" alt="Htop" width="750">
</p>

```
mcedit sendmail.py 
```
<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/mcedit.png" alt="Htop" width="750">
</p>

## Use Workspace

### Install new packages
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

Workspace is just a docker container. You can start, stop, delete and do anything ypou can do with docker images and containers.    

Essentially, there are two concepts: **images** and **containers**. Images are workspace blueprints. **alnoda/ubuntu-workspace** is an 
image. When you execute this command 

```sh
docker run --name space-1 -p 8026:8026 -d alnoda/ubuntu-workspace
```
you create container called **space-1** from the image **alnoda/ubuntu-workspace**. You can create any number of containers.  
Container - is your workspace. You can start, stop annd delete them.  

From the workspace (which is a container) you can create new image. This is called **committing**. Essentially, this means *"take my workspace and create new image with all the changes I've done in my workspace*"

### Start and stop containers

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

### Create new image

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

### Manage images

See all docker images

```
docker images
```

Delete workspace image entirely

```
docker rmi -f alnoda/ubuntu-workspace
```

**NOTE:** you cannot delete image if there is a running container created from it. Stop container first.

### Save and load images

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

### Move workspace to the cloud

Ease of running workspace in cloud, and ability to move workspaces between local machine and remote server  - 
is one of the main features of the workspace, and the reasonn why the workspace is entirely in docker.  

It is often a case that experiment, which started on personal notebook require more computational 
resources, must be running for a long period of time, or executed periodically. All of these cases are 
the reasons to move a workspace to the cloud server. Usually it is a hassle, but this workspace can be moved 
to the remote server easily.    

The easiest way to move workspace to the cloud is to get your private docker registry. Then moving a workspace from a laptop to 
a remote server is only 3 commands:

1. [Commit workspace to the a image](#save-and-load-images)
2. [Push workspace to your docker registry](https://docs.docker.com/engine/reference/commandline/push/)
3. ssh to remote server, and [run workspace there](#run-in-cloud)   

If you don't want to use container registry, then there are 2 steps more involved:

1. [Commit workspace to the a image](#save-and-load-images)
2. [Save image to file](#save-and-load-images)
3. Copy file to remote server. There are many options:
    - Launch filexchange workspace on the remote server 
    - Use [cyberduck](https://cyberduck.io/) 
    - use [scp](https://linuxize.com/post/how-to-use-scp-command-to-securely-transfer-files/)
4. [Load workspace image from file](#save-and-load-images) on the remote server 
5. Start workspace (with auth) on the remote server 

### Collaborate and share workspaces

Same as with moving worspaces to the cloud - it is trivial to share workspaces with the peers:
- share workspace saved as a file
- share common docker registry 
- start workspace in cloud and collaborate in real time

## Extend

### Java

Java is not installed. It can be installed as easy as

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

The application is running and can be accessed on localhost:19011   
It will be running even if you stop the container, or commit it and create new images

##### Potential features
- [hyper](https://github.com/vercel/hyper)
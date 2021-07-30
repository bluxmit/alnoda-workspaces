# Ubuntu-workspace

```ubuntu-workspace``` is an enhanced Ubuntu image for convenient interactive work with Ubuntu running inside a docker container, 
creating a feeling of a virtual machine. It has docker-in-docker, python, node, cron, supervisord, z-shell and other packages set up for convenient 
work directly insde a running docker container.

<p align="center">
  <img src="img/ubuntu-workspace.gif" alt="Ubuntu workspace" width="750">
</p>

## Contents

 * [Use-cases](#use-cases)
 * [Getting started](#getting-started)
    * [Ports](#ports)
    * [Run as root](#run-as-root)
    * [Docker in docker](#docker-in-docker)
* [Features](#features)
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
* [Extra features](#extra-features)
    * [Java](#java)
    * [Run applications permanently](#run-applications-permanently)

## Use-cases

Primarily intended as an advanced Ubuntu terminal that runs anywhere, this workspace works best 
when you need interactive linux, python or node shell for ad-hock tasks.  

Ubuntu workspace is also a basis for building more sophisticated workspaces with UI interfaces.

## Getting started

```sh
docker run --name space-1 -d -p 19011:19011 alnoda/ubuntu-workspace
```

Ssh into the running container
```sh
docker exec -it space-1 /bin/zsh
```

If you don't want to use z-shell
```
docker exec -it space-1 /bin/bash
```

***You can work in Ubuntu via terminal now.***

### Ports
We started workspace container with a port mapping "-p 19011:19011" because in example below will use this port to launch 
a web application.  
If you know for sure you won't run any applications, remove "-p 19011:19011" and start workspace container as  

```sh
docker run --name space-1 -d alnoda/ubuntu-workspace
```

If you don't know whether you will or will not need ports, expose some range just in case, for example

```sh
docker run --name space-1 -d -p 19011-19020:19011-19020 alnoda/ubuntu-workspace
```

> It is not a problem if you don't expose any ports, but later on realise you need them -
> you will just create new image, and run it exposing the required port (look in the section [Create new image](#create-new-image)) 

### Run as root
The default user is **abc** with passwordless sudo to install packages. If you'd rather work as root, then you should ssh into running container as
```sh
docker exec -it --user=root space-1 /bin/zsh
```
You can of course open several terminals to the same running containner as both abc and root users at the same time.


### Docker in docker

It is possible to work with docker directly from the workspace. 

```
docker run --name space-1 -d -p 19011:19011 -v /var/run/docker.sock:/var/run/docker.sock alnoda/ubuntu-workspace
```

NOTE: in order to use docker in docker you need to or enter into the workspace container as root
```sh
docker exec -it --user=root space-1 /bin/zsh
```

## Features

Ubuntu-workspace makes best out of terminal, to the level when it can be used even as a development or runtime environment.

If you want to browse files, execute 
```
mc
```
<p align="center">
  <img src="img/mc.png" alt="Moonlignt commander" width="500">
</p>

Launch system-monitor, process-viewer and process-manager with 
```
htop
```
<p align="center">
  <img src="img/htop.png" alt="Htop" width="500">
</p>

Explore file/folder sizes
```
ncdu
```
<p align="center">
  <img src="img/ncdu.png" alt="Htop" width="500">
</p>

Text editors ```vim```, ```nano``` and ```mcedit``` are available. For example, clone git repo and edit python file with nano
```
git clone https://github.com/dimaba/sendmail.git
cd sendmail
nano sendmail.py 
```
<p align="center">
  <img src="img/nano.png" alt="Htop" width="500">
</p>

```
mcedit sendmail.py 
```
<p align="center">
  <img src="img/mcedit.png" alt="Htop" width="500">
</p>

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
docker run --name space-1 -d alnoda/ubuntu-workspace
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

Giving ways to save image described in section [Save and load images](#save-and-load-images) it is obviously easy to 
move your complete local workspace to the cloud. 

You will typically do this when you need extra power of a cloud server, or you cwant to schedule your jobs to run when  
your laptop is shut down.

### Collaborate and share workspaces

Same as with moving worspaces to the cloud - it is trivial to share workspaces with the peers:
- share workspace saved as a file
- share common docker registry 
- start workspace in cloud and collaborate in real time

## Extra features

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

```npm-gui 0.0.0.0:19011 &!```

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

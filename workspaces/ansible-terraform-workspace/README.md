# Ansible-Terraform Workspace

This workspace - is a "dockerized" development environment with [Ansible](https://docs.ansible.com/) 
and [Terraform](https://www.terraform.io/) and lots of other stuff installed, 
so that you don't need to do it yourself. Create infrastructures with Terraform, and configure it with Ansible.

```
docker run --name space-1 -d -p 8020-8034:8020-8034 -p 9000:8035 alnoda/ansible-terraform-workspace
```

and open [localhost:8020](http://localhost:8020) in browser.  

## Contents

* [About](#about)
* [Use-cases](#use-cases)
* [Launch Workspace](#launch-workspace)
    * [Workspace terminal](#workspace-terminal)
    * [Multiple workspaces](#multiple-workspaces)
    * [Open more ports](#open-more-ports)
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

The workspace contains browser-based Visual Studio Code and multiple tools which make working with Ansible and Terraform more convenient.  

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

**Workspace tools with UI:**

- **Workspace UI** - Browser-based UI for Ansible-Terraform Workspace. Launch all workspace tools from one place. Customize to your yown needs.
- [**Eclipse Theia**](https://theia-ide.org/docs/) - open source version of popular Visual Studio Code IDE. Theia is trully open-source, has 
VS-Code extensions and works in browser. This means it can run inside a docker container on local machine or in cloud. For the Ansible-Terraform workspace beautiful [SynthWave '84](https://open-vsx.org/extension/RobbOwen/synthwave-vscode) theme is set by default.
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

By default workspace runs under user **abc** - a secure non-root user, abile to install new packages with apt-get, pip, npm. Workspace 
can be launched as root user too, but it is less secure, and not recommended if provided as a service for other users.  

## Use-cases

There are several reasons to use this workspace. 

1) Deploy the workspace on a cloud server. Schedule ansible playbooks with Cronicle and observe ansible executions with Ara dashboard. 
Deployment of this workspace on a cloud server is very handy when you need security, and most of your infra is running in a private network. 
The latter makes it impossible to use a local machine as an executor for Ansible playbooks unless you set up a complex VPN. This workspace can 
be launched on a bridge server that is in both private and public networks, and you can use browser-based tools to develop and execute 
Ansible or Terraform code. Here it is explained how to launch Ansible-Terraform Workspace on a cloud server with HTTPS and authentication. 

<p align="center">
  <img src="./img/infra-wrk-network.png" alt="Htop" width="750">
</p>


2) Reduce the risk of conflicting executions. Despite there are ways to prevent conflicting executions of Ansible playbooks or 
applying Terraform code (i.e. remote Terraform state), this Workspace makes it even easier, when it is deployed on the remote 
cloud server, and used by multiple users.  

<p align="center">
  <img src="./img/collaborate.png" alt="Htop" width="750">
</p>


In addition to what's already mentioned, Ansible-Terraform Workspace has the benefits of any other dockerized workspace:

1) Convenience. Get started fast, without wasting time on setting all those tools yourself. 
Getting Ansible and Terraform ready to be used, is as simple as starting a docker container. In addition, you get the ability to start and stop multiple workspaces, this makes managing separate independent cloud infrastructures much easier and safe, 
for example, you don't need to switch AWS profiles all the time. Also, you can export the entire workspace to file, push to a (private) Docker registry, and keep different versions of the workspace.

2) Shareability. You can share your workspace as a whole, with all the dependencies and installed applications. Prepare workspace for the team, 
or deliver as a result to your client. You can even push it to docker hub and make a public contribution. 

3) Environment in cloud. Start workspace inn cloud rather than on your local machine, and use it from any device.


***NOTE:*** you need to implement lock file in Ansible yourself, it is not a standard feature of Ansible.   

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
docker run --name space-1 -d -p 8020-8034:8020-8034 -p 9000:8035 alnoda/ansible-terraform-workspace
```

*(It is recommended to run workspace in the daemon mode)*

***Open [http://localhost:8020](http://localhost:8020)***   

Workspace has its own UI, which includes quiklaunch (home) page and documentation pages. 
From the quiklaunch you can open any workspace tool. Documentation pages you modify in order 
to document the project, workspace use and setup.  

### Understanding ports
In a previous section workspace was started with a port range mapping ***-p 8020-8034*** 
and additional separate port mapping ***9000:8035***. This is because workspace contains a set of applications 
with browser-based UI 

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
| 8029      | Ansible Ara               |

You don't need to memorize these ports. Ansible-Terraform workspace has UI from where you can open any of these applications. 
Open [localhost:8020](http://localhost:8020), and from there open other applications inncluded in the workspace.  

<p align="center">
  <img src="./img/Workspace UI.png" alt="Htop" width="750">
</p>

The rest of the ports from the port range can be used in order to expose optional applications, or applications you might 
install in future. So we map several extra ports just inn case.   

Ansible-Terraform workspace has the following applications installed, but not started by default  

1) **Terraform Rover** provides great visualisation for your terraform infrastructure. To visualize any (innitialized) teffarorm project 
execute 

> `rover --workingDir <TERRAFORM_PROJECT_FOLDER>`   

For example, `rover --workingDir /home/examples/terraform-scaleway/`

**NOTE:** Terraform Rover only runs on the internal port 9000, that's why when running Ansible-Terraform workspace 
it is necessary to map this port explicitly.  

2) **Terraform Blast-Radius** - a tool for reasoning about Terraform dependency graphs with interactive visualizations.   

Start Blast-Radius on any of the free port in the mapped range:   

> `cd /home/examples/terraform-scaleway && terraform init && blast-radius --serve --port 8030`  

If you are planning to expose more applications 
from inside of a container, add additional port mapping, for example


Of course, you can add even more port mappings to your workspace, for example:
```sh
docker run --name space-1 -d -p 8020-8034:8020-8034 -p 9000:8035 -p 8080:8080 -p 443:443 alnoda/ansible-terraform-workspace
```

**NOTE:** It is not a problem if you don't expose any ports from the first run. You can expose the required ports by [creating new image](#create-new-image). 

### Multiple workspaces

Typically you would run one workspace at a time, but there might be cases whenn launching more than one workspace might be needed. 
Every workspace requires range of ports. If one workspace is up and running, the ports 8020-8035 are taken.   

Ansible-terraform workspace itself uses 10 ports (8020-8029), but it is recommended to map several extra ports just in case. Having extra ports, 
you can always launch new applications on these ports, and they will be immediately exposed outside of the workspace.  

In order to start another workspace we need to provide a different port range, for example

```sh
docker run --name space-2 -d -p 8040-8054:8020-8034 -p 8055:9000 -e ENTRY_PORT=8040 alnoda/ansible-terraform workspace
```

Notice that in addition we set environmental variable ***ENTRY_PORT***, which should be equal to the first port in the new range. 
Environmental variable ENTRY_PORT tells workspace that non-default port range is used, for Workspace UI to open applications 
on proper ports in browser.

### Workspace terminal

Terminnal - is one of the main developer tools. There are several ways how to work with terminal of the the ansible-terraform workspace: 

- built-it in-browser terminal
- use terminal provided by in-browser IDE [http://localhost:8025](http://localhost:8025) ([unless other ports are mapped](#multiple-workspaces))
- ssh into the running the docker container (of the workspace) from your terminal

<p align="center">
  <img src="./img/terminal.gif" alt="Base-Workspace terminal" width="500">
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

### Docker in docker

It is possible to work with docker directly from the workspace (using workspace terminal). 

```
docker run --name space-1 -d -p 8020-8034:8020-8034 -p 9000:8035 -v /var/run/docker.sock:/var/run/docker.sock alnoda/ansible-terraform-workspace
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
docker run --name space-1 -d -p 8020-8034:8020-8034 -p 9000:8035 -e WRK_HOST="<ip-of-your-remote-server>" alnoda/ansible-terraform-workspace
```

**NOTE:** When running workspace on the remote server, add envronmental variable `-e WRK_HOST="<ip-of-your-remote-server>"`. 
Workspace UI needs this variable to know how redirect properly to the workspace applications' UIs.

Open in your browser `<ip-of-your-remote-server>:8020`  

If docker-in-docker is required, then 

```
docker run --name space-1 -d -p 8020-8034:8020-8034 -p 9000:8035 -e WRK_HOST="<ip-of-your-remote-server>" -v /var/run/docker.sock:/var/run/docker.sock alnoda/ansible-terraform-workspace
```

This way launches workspace in cloud, but such workspace would not be secure, everyone who knows IP of your server will be able to use it. You should 
use this method only if you launch workspace in the secure internal network or inside a VPN.  

#### Secure remote workspace

*You might want to restrict access to the cloud workspace, and secure encrypted communication with it*  

There are many situations when running Ansible-Terraform workspace in the public network over Internet is required. This can be done 
by running the Workspace behind the reverse proxy over secure encrypted HTTPS protocol with authentication. For some it might be an easy 
task to do, but for many engineers, who do not have experience in this area this would be an extra complication that can easily 
eat several days of your life. That's why Ansible-Terraform workspace comes with a nice little tool, that generates a docker-compose project 
(including certificates and passwords) to easily, securely and without hassle launch workspace on any cloud server  

***Ansible-terraform-workspace contains utility that will generate everything needed to launch the workspace in cloud in a secure way, with authentication and with TLS.***  

If you want to run workspace on the remote server securely, launch ansible-terraform workspace on your local laptop first, open its terminal and 
use utility `/home/abc/utils/remote.py` to generate create docker-compose project with TLS certificates. Simply execute

> `python /home/abc/utils/remote.py --workspace="ansible-terraform-workspace" --port="<ENTRY_PORT>" --host="<IP_OF_CLOUD_SERVER_WITH_PUBLIC_ACCESS>" --user="<ANY_USER_NAME>" --password="<ANY_USER_PASSWORD>"`   

for example:

> `python /home/abc/utils/remote.py --workspace="ansible-terraform-workspace" --port="8020" --host="68.183.69.198" --user="user1" --password="pass1"`  

**NOTE:** you have to specify the correct host (IP of the server you want to run the workspace on), and user and password of your choice.  

After the command is executed, you will see folder `/home/abc/utils/remote` is created. Get it out from the workspace using Filebrowser:






. Copy this folder to the remote server (any location). Ssh to the server, cd into 
the directory you copied and execute 

```sh
docker-compose up -d
```  

That's it, you workspace is running securely on the remote server, using 
self-signed TLS certificates for encrypted https communication between you laptop and the remote workspace, 
and authentication is added. 




## Use Workspace

### Ansible 

#### Ansible report

#### Schedule playbooks



### Terraform 

#### Terraform report

A small tool that produces several outputs from a terraform project, and visualizes terraform plan as an interactive HTML page.  

If you want to try it out yourself, create key/secret for your AWS account, open workspace and create [file with AWS credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)

> `mkdir -p ~/.aws`   
> `nano ~/.aws/credentials`  

The file `~/.aws/credentials` would look like this

```
[terraform]
aws_access_key_id = <YOUR_AWS_KEY>
aws_secret_access_key = <YOUR_AWS_SECRET>
```

Clone this terraform example repo into your workspace

> `git clone https://github.com/pvarentsov/terraform-aws-free-tier /home/project/aws-example` 

Open file `/home/project/aws-example/src/free-tier/main.tf` and comment out the part that configures S3 backend

```
terraform {
  backend "s3" {}
}
```

Initialize a working Terraform directory 

> `cd /home/project/aws-example/src/free-tier && terraform init`  

Paste public ssh key (for the sake of example you can type anything)  

> `nano ./provision/access/free-tier-ec2-key.pub`

Now you can generate terraform report 

> `terraform-report`  

Use Static File Server to review the report 

<p align="center">
  <img src="./img/terraform-report.gif" alt="Htop" width="900">
</p>

#### Rover

[Rover](https://github.com/im2nguyen/rover) - is an awesome Terraform vizualizer with browser-based UI. Rover helps to better understand 
Terraform state and planned changes. Assuming, you have followed hands-on the tutorial from the previous section (Terraform report), you 
can use the same Terraform repo to vizualize with Rover. Simply execute  

> `rover --workingDir /home/project/aws-example/src/free-tier`

#### Blast Radius

[Blast Radius](https://github.com/28mm/blast-radius) is a tool for reasoning about Terraform dependency graphs with interactive visualizations. 
You can try Blast Radius - launch workspace and visualize an example Terraform project.  

> `cd /home/examples/terraform-scaleway && terraform init`  
> `blast-radius --serve --port 8030`

open [localhost:8030](http://localhost:8030) in browser  

<p align="center">
  <img src="./img/blast-radius.gif" alt="Htop" width="900">
</p>

***NOTE:** Blast Radius is a great project, but there is lack of updates to the project recently, and it might not work 
with some Terraform providers.*


### Workspace 

Common actions you'd do in the workspace 

- installation of new applications and runtimes 
- edit files, write code, scripts
- build, compile and execute code 
- start/stop applications and services
- schedule tasks and scripts
- process data

#### Install applications

Use workspace workspace terminal to install new applications. 
Install with ```sudo apt install```. The default *abc* user is allowed to install packages.  

For example, in order to install [Emacs text editor](https://www.gnu.org/software/emacs/) open workspace terminal, and execute 

> `sudo apt install emacs`


#### Schedule jobs with Cron 

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

#### Python
Python and Pip are installed. To use python console, open workspace terminal and execute 

> `python`

install python package with pip, for 

> `pip install pandas`

If you are planning to work with python, we recommend to install IPython, that provides a rich toolkit to help 
you make the most of using Python interactively. Install and start ipython

> ```pip install ipython```  
> `ipython`

#### Node.js
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


#### Run applications and services inside the workspace

If you want application to keep running after workspace terminal is closed start it with **"&!"** at the end. 

For example, in the last section we started *npm-gui* tool with command `npm-gui 0.0.0.0:8030`. If you close the workspace terminal, 
this application witll stop running. To keep it running after terminal is closed, execute

> `npm-gui 0.0.0.0:8030 &!`   

Now, if you disconnect from the workspace and close terminal, the application will continue running in the workspace, untill [workspace is stopped](#start-and-stop-workspaces).   



## Manage workspaces

Workspace is just a docker container. You can start, stop, delete and do anything you can do with docker images and containers.    

There are two concepts to keep in mind: **images** and **containers**. Images are workspace blueprints. For example, **alnoda/ansible-terraform-workspace** - 
is an image. When you execute this command 

```sh
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/ansible-terraform-workspace
```
you create container called **space-1** from the image **alnoda/ansible-terraform-workspace**. You can create any number of containers, but you need to 
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
docker rmi -f alnoda/ansible-terraform-workspace
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
2. [Save image to file](save-and-loa-images) 
3. Copy file to remote server. There are many options:
    - Launch filexchange workspace on the remote server 
    - Use [cyberduck](https://cyberduck.io/) 
    - use [scp](https://linuxize.com/post/how-to-use-scp-command-to-securely-transfer-files/)
4. [Load workspace image from file](#save-and-load-workspace-images) on the remote server 
5. [Start workspace on the remote server](#run-on-remote-server) 
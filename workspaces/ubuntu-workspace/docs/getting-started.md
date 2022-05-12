# Getting started

## Start

```sh
docker run --name space-1 -d alnoda/ubuntu-workspace
```

Now you can ssh into the running workspace container  
```sh
docker exec -it space-1 /bin/zsh
```

## Root user

ssh into the running workspace container as root user
```sh
docker exec -it --user=root space-1 /bin/zsh
```

## File browser

Explore file system with Midnight Commander

```
mc
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/mc.png" alt="Midnight commander" width="750">
</p>

Or with Xplr

```
xplr
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/xplr.png" alt="Xplr" width="750">
</p>


## Text editor

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
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/mcedit.png" alt="Mcedit" width="750">
</p>


## System monitor

Launch system-monitor, process-viewer and process-manager  

```
htop
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/htop.png" alt="Htop" width="750">
</p>

Explore processes and resources with Glances   

```
glances
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/glances.png" alt="glances" width="750">
</p>

Explore file/folder sizes
```
ncdu
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/ncdu.png" alt="Ncdu" width="750">
</p>

## Git

Clone Git repo and explore with Lazygit

```
git clone https://github.com/peaceiris/mkdocs-material-boilerplate.git
lazygit
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-workspace/img/lazygit.png" alt="lazygit" width="750">
</p>

## Browser terminal

This workspace has browser-based terminal up and running. Open [localhost:8026](http://localhost:8026) in browser. 
Start the workspace on Rasberri Pi and use it via Tablet. 

In order to use browser-based terminal, expose port 8026

```
docker run --name space-1 -d -p 8026:8026 alnoda/ubuntu-workspace
```

<p align="center">
  <img src="https://github.com/bluxmit/alnoda-workspaces/blob/main/workspaces/ubuntu-workspace/img/web-based-terminal.png?raw=true" alt="dive" width="500">
</p>

## Docker in docker

If you want to use docker, check out [**ubuntu-docker-workspace**](../../ubuntu-docker-workspace/README.md). It is the same, but with docker-in-docker. 


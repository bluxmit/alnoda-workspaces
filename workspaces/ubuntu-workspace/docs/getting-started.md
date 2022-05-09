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

## Examples

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

## Docker in docker

If you want to use docker, check out **ubuntu-docker-workspace**. It is the same, but with docker-in-docker. 


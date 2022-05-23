# Getting started

## About

This workspace has browser-based full-screen terminal, file manager, and task scheduler. 
You can upload and dowload files and schedule periodic executios of scripts and jobs.  

Workspace is based on the Ubuntu 20 docker image, with common CLI applications, such as Git, Vim, Nano and curl installed.

## Quicklaunch

From the quicklaunch page you can open workspace tools, such as filebrowser or terminal 

## Terminal

Workspace has full-size browser-base terminal

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/base-workspace/img/base-workspace-terminal.gif" alt="Base-Workspace terminal" width="750">
</p> 

## Scheduler

Cronicle can execute on schedule scripts, jobs and tasks. It has nice UI to monitor executions and failures

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/cronicle.gif" alt="Cronicle" width="750">
</p>

## Install applications

Open workspace terminal to install new applications. 
Simply execute `apt install` with `sudo`.  

For example, install emacs 

```sh
sudo apt-get install emacs
```

If you want to install PHP, execute

```sh
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php8.1
```

## Python
Python and Pip are installed. Execute `python3` in terminal.  

To install python packages use PIP

```
pip install pandas
```

## Node.js
Use Nodeenv to create Node.js environments.  

For example, open workspace terminal, create folder npmgui, and activate environment with node v.12.18.3 and npm v.6.0.0

```
cd /home
mkdir npmgui; cd npmgui  
nodeenv --node=12.18.3 --npm=6.0.0 env
```

Let's install package and start node application, explicitly on port 8040

```
. env/bin/activate && npm i -g npm-gui   
npm-gui 0.0.0.0:8040
```

In the Quicklaunch go to the tab 'My apps' and open app on the port 8040. 

> **NOTE:** If you close terminal, the application will stop. If you want application to keep running after workspace terminal is closed 
start it with **"&!"** at the end. 

## Keep services runnning

Any application started in the terminal will run as long as your terminal session is alive. 
If you want any application or service runing after terminal session is closed, start service with **"&!"** at the end of 
the command.  

For example, to start *npm-gui* and keep it running after terminal is closed, run 

```
npm-gui 0.0.0.0:8040 &!
```   

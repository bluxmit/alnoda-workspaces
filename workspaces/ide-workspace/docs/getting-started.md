# Getting started

## Intro

The main feature of the workspace is IDE, a browser-based VS-Code version. Often IDE alone is not enough for convenient software development. 
In addition, workspace includes full-screen terminal, file manager, and task scheduler. This workspace is based on the Ubuntu 20 docker image, 
with typical terminal applications, such as Git installed.

## Quicklaunch

From the quicklaunch page you can open workspace tools, such as code editor or terminal 

<div align="center" style="font-style: italic;">
    Demo: Workspace UI 
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/wid-ui.png" alt="wid-ui.png" width="750">
</p>

## Code Editor

Code editor of this workspace is [**Eclipse Theia**](https://theia-ide.org/docs/) - an open-source version of popular Visual Studio Code IDE. 
despite Eclipse Theia is a browser-based code editor, it is fast, responsive, and full-featured. It features code highlighting, autocompletion, 
rendering of notebooks has a tree-based file browser, and a great number of pre-installed color themes.  

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/theia-themes.png" alt="theia-themes.png" width="900">
</p>

You can install any extension from [open-vsx.org](https://open-vsx.org/) that has hundreeds of extensions for VS Code compatible editors. 
The IDE is already configured to make code highlighting for a great number of programming languages and file types. It also has many 
popular extensions installed  

<div align="center" style="font-style: italic;">
    Demo: Eclipse Theia
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/theia.gif" alt="Theia demo" width="900">
</p>

## Terminal

Workspace has full-size browser-base terminal

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/base-workspace/img/base-workspace-terminal.gif" alt="Base-Workspace terminal" width="750">
</p> 

## Install applications

Use workspace workspace terminal to install new applications. 
Install with ```sudo apt install```. The default *abc* user is allowed to install packages.  

For example, in order to install PHP open workspace terminal, and execute 

```
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php8.1
```

## Python
Python and Pip are installed. To use python console, open workspace terminal and execute 

> `python3`

install python package with pip, for 

> `pip install pandas`

If you are planning to work with python, we recommend to install IPython, that provides a rich toolkit to help 
you make the most of using Python interactively. Install and start ipython

> ```pip install ipython```  
> `ipython`

## Node.js
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

## Scheduler

Cronicle allows scheduling scripts, jobs and tasks and it has nice UI

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/cronicle.gif" alt="Cronicle" width="750">
</p>
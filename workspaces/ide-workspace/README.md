<p align="center">
  <img src="https://github.com/bluxmit/alnoda-workspaces/blob/main/img/Alnoda-white.svg" alt="Alnoda logo" width="150">
</p> 

# IDE-workspace
General-purpose dockerized development environment. Fully isolated inside a docker container. 
Includes code editor, terminal, scheduler and filebrowser. 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/wid-collage-sm.jpg" alt="Collage" width="750">
</p>

## Why this images

1. If you need isolated dev environment where you can code and install packages and apps without affecting the base operating system.
2. If you want self-hosted remote development environment on your Rasberri Pi.

## Start
 
```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/ide-workspace
```  

and open [localhost:8020](http://localhost:8020) in browser.  

## Features

- [**Eclipse Theia**](https://theia-ide.org/docs/) - open source version of popular Visual Studio Code IDE. Theia is trully open-source, has 
VS-Code extensions and works in browser. This means it can run inside a docker container on local machine or in cloud. A lot of beautiful color themes and many common plugins are already installed to save time.  
- [**Terminal**](https://github.com/tsl0922/ttyd) - secure browser-based terminal.
- [**FileBrowser**](https://github.com/filebrowser/filebrowser)  - manage files and folders inside the workspace, and exchange data between local environment and the workspace
- [**Cronicle**](https://github.com/jhuckaby/Cronicle)  - task scheduler and runner, with a web based front-end UI. It handles both scheduled, repeating and on-demand jobs, targeting any number of worker servers, with real-time stats and live log viewer.
- [**Static File Server**](https://github.com/vercel/serve) - view any static html sites as easy as if you do it on your local machine. Serve static websites easily.
- [**Ungit**](https://github.com/FredrikNoren/ungit) - rings user friendliness to git without sacrificing the versatility of it.
- [**MkDocs**](https://squidfunk.github.io/mkdocs-material/)  - create awesome documentation for your project with only markdown. 
- [**Midnight Commander**](https://midnight-commander.org/)  - Feature rich visual file manager with internal text viewer and editor. 
- [**Process Monitor**](https://htop.dev/)  - Monitor running process and resource utilization. 
- Quicklaunch UI with getting started tutorial
- **Ubuntu 20.4** with the following CLI apps installed:
    - [Zsh](https://www.zsh.org/), [Oh my Zsh](https://ohmyz.sh/)
    - Python 3, Pip 
    - Node/nodeenv
    - git, git-flow, lazygit 
    - curl, wget, telnet, jq
    - nano, vim, mc
    - ncdu, htop, glances, vizex
    - supervisord
    - cron

## Docs
See our guides on [**getting started**](docs/getting-started.md) and [**advanced features**](../ubuntu-workspace/docs/workspaces.md).

<div align="center" style="font-style: italic;">
    Demo: Workspace in docker
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/wid-demo.gif" alt="WID demo" width="900">
</p>

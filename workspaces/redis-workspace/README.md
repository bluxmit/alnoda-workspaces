<p align="center">
  <img src="../../img/Alnoda-white.svg" alt="Alnoda logo" width="150">
</p>  

# Redis workspace

Docker image with Redis, Redis Commander and several CLI tools to interact with Redis.

<p align="center">
  <img src="img/redis-wid-collage.png" alt="Collage" width="750">
</p>

## Why this images

1. To directly interact with Redis inside your kubernetes cluster.
2. A better Redis docker image for local dev environment. You get Redis together with the toolset to work with it.

## Start
 
```
docker run --name rwid-1 -d -p 8020-8040:8020-8040 alnoda/redis-workspace
```  

open [localhost:8020](http://localhost:8020) in browser.  

## Features

**Redis tools:**

- [Redis-commander](https://github.com/joeferner/redis-commander#readme) - Redis web management tool.
- [Iredis](https://github.com/laixintao/iredis) - CLI for Redis with AutoCompletion and Syntax Highlighting.
- [Redis-dump](https://github.com/yannh/redis-dump-go) - dump Redis keys to a file.
- [Redis-Tui](https://github.com/mylxsw/redis-tui) - Redis Text-based UI client in CLI.
- [Redis extension for VS-Code](https://open-vsx.org/extension/cweijan/vscode-redis-client)

**Dev tools:**

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

Image is built from **Ubuntu 20.4** with the additional CLI apps

- [Zsh](https://www.zsh.org/), [Oh my Zsh](https://ohmyz.sh/)
- Python 3, Pip 
- Node/nodeenv
- curl, wget, telnet, jq
- **Git:** git, git-flow, lazygit 
- **File browsers:** mc, xplr
- **Text editors:** nano, vim, mcedit
- **System monitors:** ncdu, htop, glances, vizex
- **Process Control:** supervisord
- **Job scheduler:** cron

## Docs

See our guides on 

- [**getting started**](https://docs.alnoda.org/get-started/common-features/)
- [**workspace tutorial**](https://docs.alnoda.org/redis-workspace/tutorial/) 
- [**project docs**](https://docs.alnoda.org/)

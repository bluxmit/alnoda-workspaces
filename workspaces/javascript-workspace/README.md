<p align="center">
  <img src="./img/nodejs-circle.svg" alt="Nodejs logo" width="150">
</p>  

# Node.js workspace 

Containerized isolated development environment for Javascript and Node.js

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/codeserver-workspace/img/codeserver-collage-sm.jpg" alt="Collage" width="750">
</p>

## Why this images

1. If you need self-hosted development environment.
2. If you want to be one terminal command away from coding in JavaScript.

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 alnoda/nodejs-workspace
```  

open [localhost:8020](http://localhost:8020) in browser.  

## Features

- Node 
- Npm 
- Yarn
- [Nvm](https://github.com/nvm-sh/nvm)
- [Nodeenv](https://pypi.org/project/nodeenv/)

**Dev tools:**

- [**Eclipse Theia**](https://theia-ide.org/docs/) - open source version of popular Visual Studio Code IDE. Theia is trully open-source, has 
VS-Code extensions and works in browser. This means it can run inside a docker container on local machine or in cloud. A lot of beautiful color themes and many common plugins are already installed to save time.
- [**Terminal**](https://github.com/tsl0922/ttyd) - secure browser-based terminal.
- [**FileBrowser**](https://github.com/filebrowser/filebrowser)  - manage files and folders inside the workspace, and exchange data between local environment and the workspace
- [**Ungit**](https://github.com/FredrikNoren/ungit) - rings user friendliness to git without sacrificing the versatility of it.
- **Ubuntu 20.4** with the following CLI apps
    - [Zsh](https://www.zsh.org/), [Oh my Zsh](https://ohmyz.sh/)
    - Python 3, Pip 
    - Node/nodeenv
    - curl, wget, telnet, jq
    - **Git:** git, git-flow, lazygit 
    - **File browsers:** mc
    - **Text editors:** nano, vim, mcedit
    - **System monitors:** ncdu, htop, glances, vizex
    - **Process Control:** supervisord
    - **Job scheduler:** cron
    - **Terminal multiplexer:** tmux 


## Docs

See our guides on 

- [**getting started**](https://docs.alnoda.org/get-started/common-features/)
- [**workspace tutorial**](https://docs.alnoda.org/nodejs-workspace/) 
- [**project docs**](https://docs.alnoda.org/)


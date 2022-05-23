<p align="center">
  <img src="../../img/Alnoda-white.svg" alt="Alnoda logo" width="150">
</p>   

# Base-workspace
Containerized Linux environment for running jobs on schedule with browser-based scheduler, terminal and file manager. 
You can host on your favourite Rasberry Pi. 

## Start

```
docker run --name space-1 --user=root -d -p 8020-8040:8020-8040 alnoda/base-workspace
```

open [localhost:8020](http://localhost:8020) in browser. 

## Features

- [**FileBrowser**](./features.md#filebrowser)  - manage files and folders inside the workspace, and exchange data between local environment and the workspace
- **Terminal**  - Full-fledged browser-based terminal with Z-shell. 
- [**Cronicle**](./features.md#cronicle)  - task scheduler and runner, with a web based front-end UI. It handles both scheduled, repeating and on-demand jobs, targeting any number of worker servers, with real-time stats and live log viewer.
- [**Static File Server**](./features.md#static-file-server) - view any static html sites as easy as if you do it on your local machine. Serve static websites easily.
- [**Ungit**](./features.md#ungit) - rings user friendliness to git without sacrificing the versatility of it.
- [**Midnight Commander**](https://midnight-commander.org/)  - Feature rich visual file manager with internal text viewer and editor. 
- [**Process Monitor**](https://htop.dev/)  - Monitor running process and resource utilization. 
- Quicklaunch UI with getting started tutorial
- **Ubuntu 20.4** with the following CLI apps
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

## Why this image

If you need to schedule scripts and jobs, monitor executions, upload and download files. 

## Docs

See our guides

- [**getting started**](https://docs.alnoda.org/get-started/common-features/)
- [**project docs**](https://docs.alnoda.org/)

## Demo

<div align="center" style="font-style: italic;">
    Demo: Base workspace
</div>

<p align="center">
  <img src="https://github.com/bluxmit/alnoda-workspaces/blob/main/workspaces/base-workspace/img/base-workspace.gif?raw=true" alt="Base Workspace" width="750">
</p>




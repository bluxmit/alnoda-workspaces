<p align="center">
  <img src="./img/r-circle.svg" alt="R logo" width="150">
</p>  

# R workspace 

Development and execution environment for R programming language. 
Experiment, prototype, code and schedule executions.

<p align="center">
  <img src="img/r-workspace-collage.png" alt="Collage" width="750">
</p>

## Why this images

1. You need self-hosted remote development environment for R.
2. You want to be one 'docker run' command away from having everything needed to work with R.
3. You need isolated environment where you can work with R without affecting main environment.
4. You need an environment that you can "move" to a more powerful machine if needed.

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 alnoda/r-workspace
```  

and open [localhost:8020](http://localhost:8020) in browser.  

## Features

- [R](https://www.r-project.org/) 

**Dev tools:**

- **RStudio server** - open source version of popular R IDE, browser-based. 
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
- [**workspace tutorial**](https://docs.alnoda.org/r-workspace/tutorial/) 
- [**project docs**](https://docs.alnoda.org/)

# Base-devspace

Basis for other workspaces. This workspace does not have code editor or IDE up & running.  

This workspace prepares basis for Alnoda workspaces.  
It has [__alnoda-wrk__](https://pypi.org/project/alnoda-wrk/) installed, and workspace initialised.   

## Start

```
docker run --name space-1 --user=root -d -p 8020-8040:8020-8040 alnoda/base-devspace
```

open [localhost:8020](http://localhost:8020) in browser. 

## Features

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



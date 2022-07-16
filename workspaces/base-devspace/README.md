# Base-devspace

Template for other coding workspaces.

## Start

```
docker run --name space-1 --user=root -d -p 8020-8040:8020-8040 alnoda/base-devspace
```

open [localhost:8020](http://localhost:8020) in browser. 

## Features

- [**FileBrowser**](./features.md#filebrowser)  - manage files and folders inside the workspace, and exchange data between local environment and the workspace
- **Terminal**  - Full-fledged browser-based terminal with Z-shell. 
- [**Static File Server**](./features.md#static-file-server) - view any static html sites as easy as if you do it on your local machine. Serve static websites easily.
- [**Ungit**](./features.md#ungit) - rings user friendliness to git without sacrificing the versatility of it.
- Quicklaunch UI with getting started tutorial
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



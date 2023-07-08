# Alnoda workspace

Flexible isolated containerized development environment that is actually easy to use

## Start

```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/alnoda-workspace
```

open [localhost:8020](http://localhost:8020) in browser. 

## Features
- workspace UI:
    - homepage
    - app quicklaunch dashboard
    - admin interface (configure workspace UI fonts, colors, name, version etc)
    - project links, bookmarks, description
- **alnoda-wrk** - CLI tool to install applications from [alnoda.org](https://alnoda.org/registry/)
- [**Terminal**](https://github.com/tsl0922/ttyd) - secure browser-based terminal.
- [**FileBrowser**](https://github.com/filebrowser/filebrowser)  - manage files and folders inside the workspace, and exchange data between local environment and the workspace
- **Ubuntu 20.4** with the following CLI apps
    - [Zsh](https://www.zsh.org/), [Oh my Zsh](https://ohmyz.sh/)
    - Python 3, Pip 
    - Node/nodeenv
    - curl, wget, telnet, jq
    - **Git:** git, git-flow 
    - **File browsers:** mc
    - **Text editors:** nano, vim, mcedit
    - **System monitors:** ncdu, htop
    - **Process Control:** supervisord
    - **Job scheduler:** cron
    - **Terminal multiplexer:** tmux 

# Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  
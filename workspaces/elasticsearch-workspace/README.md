<p align="center">
  <img src="./img/osearch-circle.svg" alt="Opensearch logo" width="150">
</p>  

# Elasticsearch workspace

Containerized environment to interact, manage and administer Opensearch and Elasticsearch cluster.

## Why this images

1. If you need self-hosted tool to interact with Elasticsearch/Opensearch, schedule backups of indexes, 
migrate to other clusters, export and import Elasticsearch data to S3.

2. To directly access Elasticsearch/Opensearch inside your kubernetes cluster.

## Start
 
```
docker run --name elawid-1 -d -p 8020-8040:8020-8040 alnoda/elasticsearch-workspace
```  

and open [localhost:8020](http://localhost:8020) in browser.  

## Features

**Elasticsearch CLI tools**

- [elasticdump](https://github.com/elasticsearch-dump/elasticsearch-dump) - awesome tool for moving and saving indices.
- [esbulk](https://github.com/miku/esbulk) - fast parallel command line bulk loading utility for Elasticsearch. 
- [vulcanizer](https://github.com/github/vulcanizer) - cli for interacting with an Elasticsearch cluster.

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

See our guides

- [**getting started**](https://docs.alnoda.org/get-started/common-features/)
- [**workspace tutorial**](https://docs.alnoda.org/elasticsearch-workspace/tutorial/)
- [**workspace docs**](https://docs.alnoda.org/elasticsearch-workspace/)
- [**project docs**](https://docs.alnoda.org/)

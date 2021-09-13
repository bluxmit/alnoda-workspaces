# Python workspace 

Self-contained complete dockerized environment for a better Python experience. 
Contains WEB-based VS-code and many tools set up and configured: job scheduler, linter, testing, auto-documentation, profiling. 
Launch it on your laptop, or on a cloud server and work from any device. 

Try it out

```
docker run --name space-1 -d -p 8020-8035:8020-8035 -p 9000:9000 alnoda/python-workspace
```

and open [localhost:8020](http://localhost:8020) in browser.  

## Contents

* [About](#about)
* [Use-cases](#use-cases)
* [Launch Workspace](#launch-workspace)
    * [Start local workspace](#start-local-workspace)
    * [Understanding ports](#understanding-ports)
    * [Workspace terminal](#workspace-terminal)
    * [Multiple workspaces](#multiple-workspaces)
    * [Docker in docker](#docker-in-docker)
    * [Run on remote server](#run-on-remote-server)
        * [Unsecure remote workspace](#unsecure-remote-workspace)
        * [Secure remote workspace](#secure-remote-workspace)
* [Use Workspace](#use-workspace)
    * [Python tooling](#python-tooling)

    * [Common workspace actions](#common-workspace-actions)
 	    * [Install applications](#install-applications)
 	    * [Schedule jobs with Cron](#schedule-jobs-with-cron)
 	    * [Python](#python)
 	    * [Node.js](#node.js)
 	    * [Run applications and services inside the workspace](#run-applications-and-services-inside-the-workspace)
* [Manage workspaces](#manage-workspaces)
    * [Start and stop workspaces](#start-and-stop-workspaces)
    * [Create new workspace image](#create-new-workspace-image)
    * [Manage workspace images](#manage-workspace-images)
    * [Save and load workspace images](#save-and-load-workspace-images)
        * [Save workspace as a file](#save-workspace-as-a-file)
        * [Push workspace to a docker registry](#push-workspace-to-a-docker-registry)
    * [Move workspace to the cloud](#move-workspace-to-the-cloud)
* [Workspace Documentation](#workspace-documentation)


## About
The workspace contains browser-based Visual Studio Code and multiple tools which make working with Ansible and Terraform more convenient.  


**Workspace tools with UI:**

- **Workspace UI** - Browser-based UI for Ansible-Terraform Workspace. Launch all workspace tools from one place. Customize to your yown needs.
- [**Eclipse Theia**](https://theia-ide.org/docs/) - open source version of popular Visual Studio Code IDE. Theia is trully open-source, has 
VS-Code extensions and works in browser. This means it can run inside a docker container on local machine or in cloud. For the Ansible-Terraform workspace beautiful [SynthWave '84](https://open-vsx.org/extension/RobbOwen/synthwave-vscode) theme is set by default.
- [**Terminal**](https://github.com/tsl0922/ttyd) - secure browser-based terminal.
- [**FileBrowser**](https://github.com/filebrowser/filebrowser)  - manage files and folders inside the workspace, and exchange data between local environment and the workspace
- [**Cronicle**](https://github.com/jhuckaby/Cronicle)  - task scheduler and runner, with a web based front-end UI. It handles both scheduled, repeating and on-demand jobs, targeting any number of worker servers, with real-time stats and live log viewer.
- [**Static File Server**](https://github.com/vercel/serve) - view any static html sites as easy as if you do it on your local machine. Serve static websites easily.
- [**Ungit**](https://github.com/FredrikNoren/ungit) - rings user friendliness to git without sacrificing the versatility of it.
- [**MkDocs**](https://squidfunk.github.io/mkdocs-material/)  - maintain documentation for your workspace or project with only markdown. 
- [**Midnight Commander**](https://midnight-commander.org/)  - Feature rich visual file manager with internal text viewer and editor. 
- [**Process Monitor**](https://htop.dev/)  - Monitor running process and resource utilization. 

**Other:**
- Docker in docker
- [Zsh](https://www.zsh.org/), [Oh my Zsh](https://ohmyz.sh/)
- Python 3, Pip 
- Node/nodeenv
- git, git-flow 
- curl, wget, telnet, jq, 
- nano, vim, mc, ncdu, htop
- supervisord
- cron

## Use-cases

Workspace entirely in Docker is, of course, less flexible than a workspace on your laptop, which some of us have been carefully 
crafting for years. So why would you even consider starting a new project in a dockerized workspace? Here are the reasons:

**Get started fast.** Building a new workspace is a tedious task. You need to install a programming language, 
set up and configure multiple tools (this can take days). You'd have to research, chose, and learn how to do such things as linting, 
testing, pre-commit hooks, debugging, and profiling (can take months). This workspace has those tools selected and set up. 
Documentation on how to use them is provided, with an example.

**Switch between projects easily.** If you are working on a serious development project, the chances are that you are dealing with multiple 
Git branches, various configuration files, and environmental variables. There is a good chance Git branches have different dependencies 
and versions, so you also use virtual environments. It is likely that you also have different development and production environments, 
with the need to change the profile of a cloud provider, kubeconfig, ssh-key. Switching between such environments of a single project 
requires several actions, which is terrible. Now, what if you are working on multiple software engineering projects? Managing and 
switching between them becomes a real overhead. When you are working in a dockerized workspace, the switch is just one action of 
stopping one container and starting another!    

**Movable workspaces.** You mostly work on a Linux/macOS laptop, which is easy to take anywhere. 

Do you have a powerful gaming PC 


Workspaces in cloud.


Workspaces with backups.


Collaboration made simple.

Isolate experiments. 

Fast POC.


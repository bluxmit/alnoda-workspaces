# MkDocs-MagicSpace

MkDocs-MagicSpace is a higly opinionated tool, carefully crafted to develop, build and serve awesome static websites, primarily focusing 
on websites for documentation, tutorials and trainings.  

## Contents

* [About](#about)
* [Use-cases](#use-cases)
* [Why documentation websites](#why-documentation-websites)
* [What's included](#what's-included)
* [The technology behind](#the-technology-behind)
* [Launch Workspace](#launch-workspace)
    * [Workspace terminal](#workspace-terminal)
    * [Multiple workspaces](#multiple-workspaces)
    * [Open more ports](#open-more-ports)
    * [Run as root](#run-as-root)
    * [Docker in docker](#docker-in-docker)
    * [Run on remote server](#run-on-remote-server)
* [Manage workspace](#manage-workspace)
    * [Start and stop workspaces](#start-and-stop-workspaces)
    * [Create new workspace image](#create-new-workspace-image)
    * [Manage workspace images](#manage-workspace-images)
    * [Save and load workspace images](#save-and-load-workspace-images)
* [Use Workspace](#use-workspace)
    * [First steps](#first-steps)
    * [Start new documentation project](#start-new-documentation-project)
    * [Customize the project](#customize-the-project)

## About

MkDocs-MagicSpace - is a tool that you could build on your own, but we made it to save your time. 
Otherwise you would waste precious hours on researching and trying open-source packages, 
that are not always well-documented and conflicting each oter. You could easily miss a great package with markdown extensions, 
but we selected and installed the most useful ones.

***And we have created the training website (with MkDocs-MagicSpace of course) where you can learn all the feature of this magic 
workspace.*** 

Building good documentation is is not easy, and that's is often depioritized. MkDocs-MagicSpace is created to fight this problem. 
This is probably one of the easiest way to develop and deploy awesome documentation websites.

## Use-cases

MkDocs-MagicSpace can be used for developing, building andd serving

1. Enterprise documentation websites that unite hundreed git repositories into one documentation project, include readme files, code autodocumentation, 
swagger files and jupyter notebooks.

2. User manuals and API docs. Whils enterprise docs are for internal use, create great looking API websites for your users, and manuals for your customers.

3. Awesome looking docs for your open-source project. Use HTML & CSS to create front page and markdown for doc pages.  

4. Tutorials and training websites. You have a lot of experience in something? Share it with the world. MkDocs-MagicSpace helps you 
to highlight the code in many programming languages, properly render jupyter notebooks, complex mathematical formulas, 
[Mermaid diagrams](https://mermaid-js.github.io/mermaid/#/) and so much more! 

With MkDocs-MagicSpace you can also create dock, books, booklets and brochures as .pdf files.  

One of the most convenient features of the MkDocs-MagicSpace is that it is a workspace in docker. 
You use it on your local machine, you can run it on remote server and collaborate with your colleagues, 
you can give it to your peer as a whole. And you can use it to serve your docs from any server, 
no matter if it is public or inside the company's VPN. 

## Why documentation websites

*Why create separate documentation websites? Why not just write Git readme files?*

- MkDocs website with beautiful themes looks much better than any readme file. The resulting documentation website looks professional and awesome.
- MkDocs adds text search to your documentation website.
- In case of closed-source software, sharing readme files from the git repository with external users is not an option.
- Github does not render beautiful extended markdown features like admonitions, tabs etc. Neither renders diagrams, formulas, swagger docs or notebooks.
- Using MkDocs-MagicSpace you create documentation from the same markdown readme files you have in your repo together with the code. And you 
can create unified documentation website from multiple repositories in Github, GitLab, Bitbucket.
- You can add such features as Google Analytics, multi-language localization.

*And what about Confluent?*   

The approach of having docs in different places (Git repositories, Confluent, Wiki etc.) has serious drawbacks. It creates chaos, and documentation inevitably diverge with time.
And you never know where to look for the information you need.

The best docs live together with the code. With MkDocs-MagicSpace you can follow this practice with ease, build documentation website 
from one or many git repositories, include readme files that live close to the code. You can have a build process that even 
creates autodocumentation directly from the code. 

## What's included

MkDocs-MagicSpace has [**MkDocs**](https://squidfunk.github.io/mkdocs-material/) installed with a collection of extensions and plugins 
that bring MkDocs to the next level. 

MkDocs-MagicSpace is an extension of the [workspace-in-docker](https://github.com/Alnoda/workspaces-in-docker/blob/main/workspaces/workspace-in-docker/README.md) 
and has all its features:

- **Workspace UI** - launch all workspace tools from one place.
- [**Eclipse Theia**](https://theia-ide.org/docs/) - open source version of popular Visual Studio Code IDE. Theia is trully open-source, has 
VS-Code extensions and works in browser. This means it can run inside a docker container on local machine or in cloud.
- [**FileBrowser**](https://github.com/filebrowser/filebrowser)  - manage files and folders inside the workspace, and exchange data between local environment and the workspace
- [**Cronicle**](https://github.com/jhuckaby/Cronicle)  - task scheduler and runner, with a web based front-end UI. It handles both scheduled, repeating and on-demand jobs, targeting any number of worker servers, with real-time stats and live log viewer.
- [**Static File Server**](https://github.com/vercel/serve) - view any static html sites as easy as if you do it on your local machine. Serve static websites easily.
- [**Ungit**](https://github.com/FredrikNoren/ungit) - rings user friendliness to git without sacrificing the versatility of it.

Built on top of Base-workspace and Ubuntu-workspace, this workspace gets all the features those workspaces have. 
In particular, workspace-in-docker provides excellent experience when working directly in the terminal, and has docker-in-docker.

## The technology behind

MkDocs-MagicSpace in its essense is all about 

- [**MkDocs**](https://www.mkdocs.org/) -  a fast, simple and downright gorgeous static site generator that's geared towards 
building project documentation. 
- [**Material for MkDocs**](https://squidfunk.github.io/mkdocs-material/) - one of the best themes for MkDocs, makes your website look very professional, customizable, 
searchable, mobile-friendly, has 40+ languages, has built-in search. It also adds lots of markdown features such as tabbed content containers, mathematical formulas, critic markup, 
task lists, and more than 10k icons and emojis.

and lots of packages and extensions that greatly improve your capabilities, these are only some of them 

- [PyMdown Extensions](https://facelessuser.github.io/pymdown-extensions/) - add even more cool features of the extended markdown: sub- and superscripts, keys, magic links, sane headers etc.
- [Mkdocs-macro plugin](https://mkdocs-macros-plugin.readthedocs.io/en/latest/) - add variables and macros written in Python!
- [Mkdocs-monorepo plugin](https://backstage.github.io/mkdocs-monorepo-plugin/) - build multiple documentation folders in a single Mkdocs. Designed for large codebases. 
- [MkDocs Newsletter](https://lyz-code.github.io/mkdocs-newsletter/) - show the changes of documentation repositories in a user friendly format, at the same time that it's easy for the authors to maintain.
- [Mkdocs-mermaid2-plugin](https://github.com/fralau/mkdocs-mermaid2-plugin) - renders textual graph descriptions into Mermaid graphs (flow charts, sequence diagrams, pie charts, etc.).
- [Pygments](https://pygments.org/) - a generic syntax highlighter suitable for use in code hosting, forums, wikis or other applications that need to prettify source code, with over 500 languages and other text formats.
- [Mkdocs-include-markdown-plugin](https://github.com/mondeja/mkdocs-include-markdown-plugin) - include Markdown files completely or partially, and include files of any type.
- [Mkdocs-table-reader-plugin]() - directly insert CSV files as tables in your website.

***We don't just install all these packages, and let you research how to use them on your own. We have created a training website where you can learn 
how to get the most out of the MkDocs-MagicSpace, its features and markdown extensions***

## Launch workspace

Workspaces - are merely docker containers, that's why managing workspaces is easy and intuitive - it is enough to know only docker commands, 
no need to learn any new tools.

In order to avoid confusion, the following convention is adopted: 

```sh
command to execute outside sof the workspace
```

> `command to execute inside the workspace (after entering running docker container)`

To start MkDocs-MagicSpace execute in terminal

```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 alnoda/mkdocs-magicspace
```

***Open [http://localhost:8020](http://localhost:8020)***   

Workspace has web-based documentation with home page, from where you can open any workspace tool.  

It is recommended to run workspace in the daemon mode.

### Workspace terminal

There are 2 ways how to work with terminal inside the mkdocs-magicspace: 

- use terminal provided by in-browser IDE [http://localhost:8025](http://localhost:8025) ([unless other ports are mapped](#multiple-workspaces))
- enter running workspace docker container from your terminal

If you want to enter running workspace container from your terminal execute:
```sh
docker exec -it space-1 /bin/zsh
```

If you don't want to use z-shell
```
docker exec -it space-1 /bin/bash
```

You can work in Ubuntu terminal now. Execute the followinng command to know your workspace user 

> `whoami`

### Multiple workspaces

Every workspace requires range of ports. If one workspace is up and running, the ports 8020-8030 are taken.   

In order to start another workspace it is necessary either to stop currently runnning workspace, or to run another workspace 
on the different port range.  

If you are planning to run multiple workspaces at the same time, you can run second workspace with different port range

```sh
docker run --name space-2 -d -p 8040-8050:8020-8030 -e ENTRY_PORT=8040 alnoda/mkdocs-magicspace
```

Notice that in addition we need to set environmental variable ENTRY_PORT, which should be equal to the first port in the new range. 
This is needed for the documentation main page to set up correct links to other tools (Filebrowser, Cronicle etc.)


### Open more ports
We started workspace container with a port range mapped "-p 8020-8030". If you are planning to expose more applications 
from inside of a container, add additional port mapping, for example

```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 -p 8080:8080 alnoda/mkdocs-magicspace
```
You can add multiple port mappings:
```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 -p 8080:8080 -p 443:443 alnoda/mkdocs-magicspace
```

**NOTE:** It is not a problem if you don't expose any ports, but later on realise you need them - 
you will just create new image, and run it exposing the required port (look in the section [Create new image](#create-new-workspace-image)) 

### Run as root
The default user is **abc** with passwordless sudo to install packages. If you'd rather work as root, then you should ssh into running container as
```sh
docker exec -it --user=root space-1 /bin/zsh
```
You can of course open several terminals to the same running containner as both abc and root users at the same time.

### Docker in docker

It is possible to work with docker directly from the workspace. In order to be able to use docker directly inside the workspace, 
start the workspace with mounting `/var/run/docker.sock` and using root user:

```
docker run --name space-1 -d -p 8020-8030:8020-8030 -v /var/run/docker.sock:/var/run/docker.sock --user=root alnoda/mkdocs-magicspace
```

Alternatively you can run workspace as non-root
```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 -v /var/run/docker.sock:/var/run/docker.sock alnoda/mkdocs-magicspace  
```
but whenever you want to use docker enter into the workspace container as root
```
docker exec -it --user=root space-1 /bin/zsh
```

### Run on remote server

Because workspace is just a docker image, running it in cloud is as easy as running it on local laptop. There are only 3 steps involved: 

- get virtual server on your favourite cloud (Digital Ocean, Linode, AWS, GC, Azure ...) 
- [install docker](https://docs.docker.com/engine/install/) on this server
- ssh to the remote server and start workspace with envronmental variable `-e WRK_HOST="<ip-of-your-remote-server>"` 

```
docker run --name space-1 -d -p 8020-8030:8020-8030 -e WRK_HOST="<ip-of-your-remote-server>" alnoda/mkdocs-magicspace
```

if docker-in-docker needed then 

```
docker run --name space-1 -d -p 8020-8030:8020-8030 -e WRK_HOST="<ip-of-your-remote-server>" -v /var/run/docker.sock:/var/run/docker.sock alnoda/mkdocs-magicspace
```

Open in your browser `<ip-of-your-remote-server>:8020`   

When running mkdocs-magicspace on the remote server, it is useful to add authentication mechanism, otherwise anyone in the world 
who gets to know the IP of the remote server will be able to use your workspace. We have created a docker-compose file, that will 
let you launching workspace with authentication - [read the instructions here](https://github.com/Alnoda/workspaces-in-docker/blob/main/workspaces/mkdocs-magicspace/md/auth-for-remote-workspace.md)

> [Check out the complete docs](https://alnoda.org) to know more.

## Manage workspace

Workspace is just a docker container. You can start, stop, delete and do anything you can do with docker images and containers.    

There are two concepts to keep in mind: **images** and **containers**. Images are workspace blueprints. For example, **alnoda/mkdocs-magicspace** - 
is an image. When you execute this command 

```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 alnoda/mkdocs-magicspace
```
you create container called **space-1** from the image **alnoda/mkdocs-magicspace**. You can create any number of containers, but you need to 
[map different ports to each of them](#multiple-workspaces).  

Container - is your workspace. You can start, stop and delete them. You can run multiple workspace containers at the same time, or work with 
one workspace at a time.   

From the workspace (which is a container) you can create new image. This is called **commit docker image**. 
Essentially, this means *"take my workspace and create new image with all the changes I've done in my workspace*"

### Start and stop workspaces

The workspace started in daemon mode will continue working in the background. 

See all the running docker containers (including workspaces)

```
docker ps
```

Stop workspace

```sh
docker stop space-1 
```
Workspace is stopped. All the processes and cron jobs are not running. 

See all docker conntainers, including stopped

```
docker ps -a
```

Start workspace again. Processes and cron jobs are resumed. 

```sh
docker start space-1 
```

Delete workspace container (all work will be lost)

```
docker rm space-1 
```

### Create new workspace image

Having made changes, you can commit them creating new image of the workspace. In order to create new workspace image with the 
name "space-image" and version "0.2" execute

``` 
docker commit space-1 space-image:0.2
```

Run new workspace with 

```
docker run --name space2 -d space-image:0.2
```

The new workspace accommodates all the changes that you've made in your space-1. Hence you can have versions of your workspaces. 
Create different versions before the important changes.

### Manage workspace images

See all docker images

```
docker images
```

Delete workspace image entirely

```
docker rmi -f alnoda/mkdocs-magicspace
```

**NOTE:** you cannot delete image if there is a running container created from it. Stop container first.

### Save and load workspace images

After you commit workspace container, and create new image out of it, you can push it to your docker registry or save it as a file.  

#### Save workspace as file

Assuming you created new image **space-image:0.4** from your workspace, you can save it as a tar file 

```
docker save space-image:0.4 > space-image-0.4.tar
```

We can delete the image with

```
docker rmi -f space-image:0.4
```

And restore it from the tar file

```
docker load < space-image-0.4.tar
```

#### Push workspace to private docker registry 

A better way to manage images is docker registries. You can use docker registries in multiple clouds. They are cheap annd very convenient.  
Check out for example, [Registry in DigitalOcean](https://www.digitalocean.com/products/container-registry/) or in [Scaleway container registry](https://www.scaleway.com/en/container-registry/). There are more.   

Pushing image to registry is merely 2 extra commands: 1) tag image; 2) push image   

You will be able to pull image on any device, local or cloud.

## Use workspace

### First steps

In the workspace you will typically work with the IDE and use terminal often.

Open worspace UI at [*http://localhost:8020*](http://localhost:8020) (unless you mapped other ports), go to the **Home** page 
and click on the IDE icon to open WEB-based version of Visual Studio Code. When you open IDE, click on *Terminal* in the upper 
toolbar and then on the **New Terminal**.  

Terminal allows you to run scripts, compile code, build applications, install new software, 
[use docker](#docker-in-docker), deploy and serve web applications etc.  

We recommend to keep all your projects in folder `/home/project`. In terminal this folder has a shortcut `~p` (try executing `cd ~p`).

### Start new documentation project

The first thing when starting a new documentation project, is to copy the mkdocs boilerplate to your project folder.   

There boilerplate for MkDocs is already available in folder `/home/docs`. This boilerplate is actually used as WEB UI for most workspaces, and served by the 
mkdocs server with the live reload, available at *http://localhost:8020* by default.  

Copy existing mkdocs boilerplate to your project folder. Let's assume your project is called **awesome-project** 

> `cp -r /home/docs /home/project/awesome-project`

Now you can start live development server that would serve this boilerplate 
documentation website. We will serve it on port 8026, because it falls in the range 
of ports we provided for the workspace upon creation (unless you've mapped other ports)  

> `cd /home/project/awesome-project && mkdocs serve -a 0.0.0.0:8026` 

Open your browser on [*http://localhost:8026*](http://localhost:8026) and you will see 
another workspace WEB UI up and running.  

At this moment you might want to initialize a git repository, make first commit and push 
the code to remote.

### Customize the project 

You probably want your documentation website to look different from the workspace WEB UI.  

There are 2 adjustments you would typically do: 

1. Create, update and delete doc pages, or include docs from other projects and repositories
2. Customize the appearance of your documentation website

The key configuration happens in the file `mkdocs.yaml`, which is always in the root folder of the mkdocs project. 
It is in this file we specify what markdown files should be shown, and what is the order. In this file we also configure the appearance of the whole 
documentation website, and list the plugins that should be used.   

if we look in the file `mkdocs.yaml` of the boilerplate MkDocs project, that we copied into `/home/project/awesome-project` we will 
see entry called `nav` 

```
nav:
  - Home: pages/home/home.md
  - About: README.md
  - Get started: get-started.md
```

here we list all the makdown files from the subfolder `docs` that should be shown in our documenntation website. We can create 
nested structures 

```
nav:
  - Home: pages/home/home.md
  - About:
        - Mission: mission.yaml
        - Team: team.yaml
  - Get started: 
        - First steps: get-started/first-steps.yaml
        - Customization: get-started/customization.yaml
```

***We have created documentation website for MkDocs-MagicSpace. You can learn how to customize your MkDocs project and use extended markdown to create awesome doc projects.***




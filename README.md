# Workspaces in docker

*Good engineers make, great engineers share.*  

Making a tool - environment ready for complex engineering, analytical, operations, data science, or other IT project - is not easy. 
If you've made one, share it! It might be of great use for someone.  

This project was created to share dockerized workspaces, and to set an example of how such workspaces can be developed.
 
### Contents

* [What is workspace In Docker](#what-is-workspace-in-docker)
* [Available workspaces](#available-workspaces)
* [Why workspace In Docker](#why-workspace-in-docker)
* [Use-cases](#use-cases)
* [How to make your own workspace](#how-to-make-your-own-workspace)
* [Publications](#publications)
* [Feedback and contribution](#feedback-an-contribution)

## What is workspace In Docker 

***TLDR: Workspaces are toolsets designed for a specific project and packaged as docker images. They make it easy to switch between projects; 
can be moved between laptops, PCs, and cloud servers; can run in the cloud and be used from any device; have versions and 
backups; can be used by several users and make collaboration easier.***


<p align="center">
  <img src="./img/wid-advantages.svg" alt="Htop">
</p>

Essentially, workspace - is everything needed for a specific kind of work, packed in a docker image. It is a self-contained environment 
that is ready to use as soon as you execute `docker run`. Dockerized workspaces do not require other tools to be set up on the host 
machine, apart from docker itself. You can use such workspace locally or launch it securely on any cloud server.

Workspace would typically include file browser, code editor, IDE, terminal, job scheduler, resource and process monitor, documentation 
solution. Designed for specific IT projects, workspaces could also include frameworks, linters, profilers, testing, and auto-documentation tools, 
tools to visualize and study data, report generators, task orchestrators, infrastructure visualization tools, interactive notebooks, 
simulation UIs, custom dashboards, and many other.   


<div align="center" style="font-style: italic;">
    Demo: Workspace in docker
</div>


<p align="center">
  <img src="./workspaces/workspace-in-docker/img/workspace-demo.gif" alt="Htop" width="750">
</p>


## Available workspaces

[`Ubuntu-workspace`](./workspaces/ubuntu-workspace/README.md) - docker as a light-weight Virtual Machine. It 
provides isolation of environments, but uses less resources than VMs. Ubuntu-workspace allows to start multiple processes inside the 
same docker container, has docker-in-docker, Python and Node.js, and a collection of common applications such as text editors, 
git, supervisord, z-shell etc. Ubuntu-workspace with browser-based terminal can be used on both local and remote server with the same experience. 
When it runs on the remote server, the access can be restricted with a password, and secured with TLS encryption. 

[`Python-Workspace`]

[`Ansible-Terraform-Workspace`]

[`Workspace-in-docker`](./workspaces/workspace-in-docker/README.md) - has all the features of the *Base-Workspace*, and in addition - 
a powerful browser-based version of Visual Studio Code. This workspace allows complete isolation of many IT-related projects, such as 
software development, devops, QA, data analysis, data engineering, data science and other. Workspace can be used as local development environment, 
as well as remote, when started on the cloud server, and can be secured with password. Workspace-in-docker allows to completely isolate and switch easily 
between projects that involve multiple programming languages, different clouds, k8s clusters and have system dependencies. Withou this workspace 
swithing between such complex environments would require multiple actions and can be tedious work. Workspace-in-docker is great for collaborative work, 
can be easily shared, moved to any cloud server, backed up, has versions and can be easily extended and customized. Can be used as build, test or even 
runtime environment.  

[`Codeserver-Workspace`](./workspaces/codeserver-workspace/README.md) - alternative workspace to the `workspace-in-docker`. It has all the features ot the latter, except for the 
different implementation of the Visual Studio Code. While `workspace-in-docker` has [Eclipse Theia IDE](https://theia-ide.org/), Codeserver-Workspace 
includes [Codeserver](https://github.com/cdr/code-server) instead.   

[`MkDocs-MagicSpace`](./workspaces/mkdocs-magicspace/README.md) - an all-in-one tool, carefully crafted to develop, build and serve awesome static websites, for the purpose 
of documentation, tutorials, and training.  

[`Base-Workspace`](./workspaces/base-workspace/README.md) - docker as a light-weight Virtual Machine with batteries included, 
designed to be used entirely through browser-based interfaces. Base-Workspace has its own UI, and a collection of applications for more 
convenient work, such as File Browser to easily exchange files and folders with workspace, Cronicle - advanced job scheduler with great UI, 
MkDocs for documentation of the workspace and projects. This workspace includes all the features of the *Ubuntu-workspace*.

## Why workspace In Docker 

Compared to the local environment, where you can install any application with a nice native interface, dockerized workspaces are much 
less flexible. They contain only terminal-based or browser-based tools. Also, workspaces in docker have an overhead of running inside 
the docker container, which can result in some performance implications.  

At the same time, dockerized workspaces have several very strong advantages, that local workspaces don't. 
Some workspace benefits come from docker itself:

- **Containerization.** Everything in the workspace is packed in a docker container.
- **Isolation.** Changes in one environment cannot affect another environment.
- **Easy-to-switch.** Start and stop workspaces with just one action. 
- **Shareability.** Share workspace as a whole (code, files, secrets, configuration, data, etc.) with your peers.
- **Platform-agnostic.** Run on any system where docker can run.
- **Movability.** You can move the entire workspaces between laptops, PCs, and servers.
- **Collaboration.** Launch workspace in cloud, and use together with your peers.
- **Versions and backups.** Commit workspaces to images, or save to files. Back up the entire workspace before making changes, keep versions. 

Other features are coming from the concept of the workspace itself, and only satisfied if the workspace is done properly:

- **Cloud-ready.** You work with workspace through browser-based or terminal-based interfaces. Hence workspace is ready to be launched on the remote server, 
container orchestration platform or Kubernetes, and be used from any of your devices. 
- **Feature-reach.** Workspace is not merely an IDE inside a docker container. It includes the whole toolkit necessary to solve the problem.   
- **Readiness.** Tooling that is needed to tackle a specific problem is pre-selected, set up, and configured with sane defaults.
- **Easy to use.** Workspace is convenient, it has UI, and tooling is well-documented. 
- **Independence.** Workspace is fully open-source. It does not use any proprietary technology, it does not depend on any cloud.
- **Opinionated.** Workspace is an opinionated system of chosen tools and practices, that according to its creator, are best suited 
for the specific purpose.         

## Use-cases

There are many problems that workspaces in docker can solve. Dockerized workspaces can be a good choice in situations when:

**You need to get started fast.** The creation of a new workspace is a tedious task. You need to install a programming language, 
set up and configure multiple tools (this can take days). You'd have to research, chose, and learn how to do such things as linting, 
testing, pre-commit hooks, debugging, and profiling (can take months). This workspace has those tools selected and set up. 
Documentation on how to use them is provided, with an example.

**You are working on multiple projects.** If you are working on a serious IT project, the chances are that you are dealing with multiple 
Git branches, various configuration files, and environmental variables. There is a good chance Git branches have different dependencies 
and versions, so you also use virtual environments. It is likely that you also have different development and production environments, 
with the need to change the profile of a cloud provider, kubeconfig, use another ssh-key. Switching between such environments even of 
a single project requires several actions, which is terrible. Things become even less convenient when we are working with multiple IT projects. 
Managing such projects, and switching between them becomes a real overhead. When you are working in a dockerized workspace, the switch 
is just one action of stopping one container and starting another!   

**You need to move workspaces.** Let's assume you mostly work on a Linux/macOS laptop, but you have a powerful gaming PC at home, 
and might want to use it for builds, simulations, training ML models, etc. You might realize the algorithm you are using needs extra 
high resources or needs to run for many hours to finish, and a very powerful cloud server should be used. Dockerized workspace 
can be moved as-is from one machine to another within minutes, no matter if it is a laptop, PC, or virtual cloud server.    

**You need to put your work to production really fast.** You have developed a piece of code that must be running all the time. Or jobs that should run on schedule. 
You cannot keep your laptop running all the time. You need to quickly move to the cloud. If you don't have time or resources to build production-ready 
docker images, create CI/CD, configure servers, you can simply move your workspace to the cloud as-is. Depending on the situation, such "rapid" deployment might 
be well-justified for proofs-of-concept, experiments, scheduling supporting tasks, etc. 

**Yo need an environment to isolate an experiment.** You want to try a new framework, library, package, or simply update your dependencies to the latest version. Try to do it in 
a self-contained isolated environment first. 

**You require backups and versions for the entire workspace.** Your work may go well beyond the development-debugging-testing-deployment cycle. 
For example, if you are a data analyst, data scientist, researcher you make experiments, simulations, train ML models. Such work often involves 
frequent changes to your environment (updating packages, install new applications, change datasets, etc.). To reproduce analytics, 
experiment, or ML model training you need to have an exact version of your environment at a specific point in time. Dockerized workspaces in docker 
solve this problem very well! At any moment you can backup and save your entire workspace running in the docker container, and launch it 
as a new workspace whenever you want.

**Collaboration made simple.** You need a workspace that can be shared with your peers or colleagues. Launch it on the cloud server 
and use together.  

**You need to deliver results.** If you are a freelancer or contractor, you might want to send your client the whole workspace 
you worked in. This will help your client to reproduce results without bothering you with questions after the contract is closed.    

**You want to improve team's productivity.** The workspace for a serious project includes a lot of tooling, standards and conventions, 
secrets and configurations, ssh keys, environmental variables, VPN, and much more. Your team probably would like to do it once. 
When everyone needs to make this work, it is such a waste of time! An how much easier it is to onboard new team members if they can use 
an environment where everything is ready to get started right away. 

**You need to onboard freelancer/contractor asap.** The time freelancer spends to set up the environment - is the time you are paying for. 
Use a workspace, customized for the tasks you typically hire an external workforce for. Let freelancers be able to start real work 
as soon as possible. Save time and money.

**You are buildding internal development platform.** An Internal Developer Platform, or IDP, is a self-service layer that allows developers 
to interact independently with their organization's delivery setup, enabling them to self-serve environments, deployments, databases, 
logs, and anything else they need to run their applications. Customize workspaces for the specifics of your IDP. Support and maintain 
workspaces for your company, and let engineers do the real work rather than bothering how to configure and use your company's IDP. 

**You want to help others.** You know how to tackle a complex project. You know how to use different tooling, practices, and standards, 
to be successful and efficient in the specific area or tasks. You spent months setting it up, you have tried different versions and package combinations. 
You have made scripts to automate work. Everything seems easy for you now, and you are ready to write a blog post to help others. 
You can go one step further! Fellow engineers, analysts, and scientists are months behind you. Create a workspace with everything set up and ready. 
Together with your publication, it will greatly help people who struggle with the same problem.  


## How to make your own workspace

This repo was created with the idea in mind - to set up basics for building custom workspaces. The workspaces, shared in this project 
are build based on each other. Some of the workspaces are highly customized, have a narrow scope, and focus on a specific task. 
Other workspaces are more general and intended to be used for further customization.  

The most general workspace - is [`Ubuntu-workspace`](./workspaces/ubuntu-workspace/README.md). It sets the basics for using docker 
in order to run multiple processes, adds cron, zsh, and other applications that will be used in most workspaces. 

Other general workspaces are the [`Base-Workspace`](./workspaces/base-workspace/README.md), which adds several browser-based applications,  
like task scheduler, file browser, documentation framework and workspace own page. [`Workspace-in-docker`](./workspaces/workspace-in-docker/README.md) 
adds [Eclipse Theia](https://theia-ide.org/) to the Base-Workspace. Theia - is an open-source browser-based VS-Code version, making 
Workspace-in-docker to be a general base workspace, to be used in order to create workspaces for specific tasks (like Python workspace, or 
Ansible workspace). 

[`Codeserver-Workspace`](./workspaces/codeserver-workspace/README.md) - is an alternative to the Workspace-in-docker. It is also a general 
base workspace to build upon, but it has a different VS-Code version - [Codeserver](https://github.com/cdr/code-server). 


## Publications

- [The way I use Docker as interactive environment for tries and experiments](https://medium.com/@bluxmit/the-way-i-use-docker-as-interactive-environment-for-tries-and-experiments-52ac06c0ec69)
- [Docker as a lightweight VM - docker image that you can use as VM substitute](https://medium.com/@bluxmit/docker-as-a-lightweight-vm-docker-image-that-you-can-use-as-vm-substitute-164032e4ed0b)

## Feedback and contribution

Workspaces in docker helped me to manage multiple projects in different clouds and k8s clusters. They made my work so much easier, 
and I hope they can be useful for other people too.  

I will highly appreciate any suggestions, ideas for improvements, contribution or any other form of collaboration. 
Send me an email bluxmit@gmail.com




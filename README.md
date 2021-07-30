# Workspaces in docker

### Contents

* [About](#about)
* [Quickstart](#quickstart)
* [Available workspaces](#available-workspaces)
* [Why dev environmet in docker](#why-dev-environmet-in-docker)
* [Workspaces-in-docker vs. cloud IDE](#workspaces-in-docker-vs.-cloud-ide)
* [Workspaces-in-docker vs. other docker workspaces](#workspaces-in-docker-vs.-other-docker-workspaces)
* [Workspaces-in-docker principles](#workspaces-in-docker-principles)
* [Feedback and contribution](#feedback-an-contribution)


## About

Workspaces make development, experiments and workloads isolated in their own dockerized environments, 
enable working directly inside the running docker containers, and help managing multiple projects easily.    

Workspaces include tools and software that make working inside docker nearly as convenient as working 
directly in local environment.  

![Workspaces are amazing!](./workspaces/workspace-in-docker/img/workspace-demo.gif)

Workspace is not only a development environment. Some workspaces include lots of tools and packages, that otherwise would 
take lots of time to set up.

Workspaces are familar docker images and containers. Working with workspaces will not require learning any new tools, 
only will help to improve docker skills.  

Workspaces allow moving complete environments between machinnes and cloud servers as easy as 2 clicks. With workspaces you can 
actually have 2 develpment machines, and sync them very easily. You can even work in the vary same workspace on your Mac laptop 
and Windows PC. And then you move the complete development or runtime environment to a cloud Linux server in under 1 minute.  

Workspaces are great for collaboration. Imagine being able to share with your peer not only the codebase, but also to the whole environment 
with all the dependencies and config files. 

Workspaces make containerization and deployment as easy as possible, without the need of building docker 
images again. We love containers for their ability to run on production environment exactly the same way 
they are running on "your laptop". We already run a lot in containers. Why not build our apps in containers as well? 
Then we can simply skip the extra step of building images again and again.   

Workspaces can be used as true Linux terminals. Anywhere. On any system. In fact, workspaces include lots of tools that 
make woking in terminal a pleasure.  

<p align="center">
  <img src="./workspaces/ubuntu-workspace/img/ubuntu-workspace.gif" alt="Ubuntu workspace" width="750">
</p> 

Workspaces are great to preserve sometnig that works. Imagin you have made an MVP. Something actually working. It is not enough just to 
commit the code. Save the complete workspace! With all environments, dependencies and configurations. Later it might save you a lot of time.  

Workspaces are completely open-source and include only popular wide-spread open-source tools. No proprietary software.  

## Quickstart

Launching new workspace is as easy as 

```sh
docker run --name space-1 -d -p 8020-8030:8020-8030 alnoda/workspace-in-docker
```

that is it! Open workspace UI ***[http://localhost:8020](http://localhost:8020)***   

or enter workspace terminal 
```sh
docker exec -it space-1 /bin/zsh
``` 

## Available workspaces

1. [`ubuntu-workspace`](./workspaces/ubuntu-workspace/README.md). Primarily intended as an advanced Ubuntu terminal that runs anywhere, this workspace works best 
when you need interactive linux, python or node shell for ad-hock tasks.  

2. [`base-workspace`](./workspaces/base-workspace/README.md). Does not include IDE, and serves as a building base for other workspaces with different IDEs.  

3. [`workspace-in-docker`](./workspaces/workspace-in-docker/README.md). Workspace-in-docker is a good choice if you want control and versatility. It is lightweight, 
includes open-source web-based version of Visual Studio Code, and a reasonable collection of tools that 
make working inside docker container nearly as convenient as working on local environment. 
Very customizable. 


## Why dev environmet in docker

Have your ever participated in several software (sysops, analytics, BI, data science, ML) projects at the same time? 
And each of them having different environments (dev, stage, prod), cloud config file, k8s cluster, ansible secret, 
terraform workspace... Managing such a collection of environments is so much easier 
if everything is packaged inside a docker container, that you can start and stop by one single command.

There are lots of limitations compared to local environment. For example, you will have to work only with WEB-based tools - this limits your choices 
and might not include your favourite shiny IDE, on which you spent so many months to configure and learn. Also a web-based IDE is always slower 
than its native alternative, and probably not as feature-rich.  

But the benefits of isolating everything related to the specific project in one docker image that can be saved, versioned, moved to another machine, 
deployed on cloud server or shared with anyone, by far outweighs those limitations.   

*Workspaces promote non-canonical way of using docker, taking advantage of features, we don't often use.* 

We already run a lot in containers. Why not build our apps in containers as well? 
Workspace encapsulates nicely project or experiment with all the dependencies, helping to avoid situation when one environment can affect another.

> Docker is a great tool to bundle together all the things that are related to the same project. It is light-weight and you can start multiple workspaces.

We often over-engineer and waste time on something that we could do better. If we do something on our local machines, it becomes isolated, non-transferrable 
and not shareable. If we do the same work inside a running docker container, we can commit it to the new image and share with peers or run 
on cloud servers, and this is all - just 3 commands in terminal.

## Workspaces-in-docker vs. cloud IDE

There are other options that provide isolated environments and let work in cloud directly. 
Cloud9, CodeAnywhere, GitPod, GroomIDE you name it - are awesome and affordable services, that are even easier to use than workspaces-in-docker. 
But workspaces-in-docker have some serious advantages: 

- workspaces-in-docker are transferrable, they can be used on both local machine as well as in cloud, 
being easily moved back and forth. You might not always have perfect internet, and running workspace on the local machine can be more convenient. 
And you can always move workspace to a powerfule server in cloud within couple minutes.  

- workspaces-in-docker are more configurable. Tey are open-source docker images after all. Create new image from the workspace image, 
and you will have  highly customized personal workspace. 

Workspaces-in-docker is a middle ground between two extremes: the unwieldy static local environment - unseparable from your laptop, 
and euphemeral cloud environments that are much less versatile. 

## Workspaces-in-docker vs. other docker workspaces 

The idea of development in docker is not new at all. In fact there are other projects in GitHub 
that encourage users to work directly in the docker containers.   

On the left side of the spectrum, there are WEB-based IDE, each of them having their own docker images.   

On the right side there exist over-packed docker images for particular use-cases, that include way too many tools than probably needed.  

Workspaces-in-docker take the niche in the middle. Instead of building one heavy unwieldy image that focuses on one specific use-case, 
we create a "constructor" stack of images build on top of each other for better control and ease of customization.  

And we take security seriously. Workspaces-in-docker by default run under non-root user. Of course you can run or enter workspace as root too. 
This makes it secure to share with peers, or deploy production ready applications directly as workspace container.

## Workspaces-in-docker principles 

When developing our dockerized workspaces, we try to set and follow some rules:

- worksapces should be easy to use and solve real problems
- start with generic workspaces, suitable for common needs
- more specific workspaces should be built on top of generic workspaces
- rather than building ubder-workspace for all needs, workspaces should branch out from ther generic workspace and focus on specific needs
- workspaces should be well-tested and documented
- workspaces should include only open source tools
- workspaces don't include as much stuff as possible, workspace should have minimal needed set of tools
- include in the workspace only tools that share processes and data. Reverse proxy, load balanncers, 
databases, server resource monitors should not be the part of the workspace. Instead they should be integrated with 
workspace in docker compose.

## Feedback and contribution

Workspaces in docker helped me to manage multiple projects in different clouds and k8s clusters. They made my work so much easier, 
and I hope they can be useful for other people too.  

I will highly appreciate any suggestions, ideas for improvements, contribution or any other form of collaboration. 
Send me an email bluxmit@gmail.com




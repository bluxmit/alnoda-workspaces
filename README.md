<p align="center">
  <img src="img/alnoda-red.svg" alt="Alnoda logo" width="100">
</p> 

Open-source portable containerized browser-based development environments in Docker containers. You can create your own 
custom workspace or customize any of the workspaces with your preferred stack of applications without knowing much of the Docker.

![demo](img/wrk-demo.gif)

How to make this: 

```
FROM alnoda/alnoda-workspace:latest

RUN wrk install openvscode
RUN wrk install kodexplorer
RUN wrk install cloud-commander
RUN wrk install zellij-ui
RUN wrk install mate-desktop
RUN wrk install jupyterlab
RUN wrk install r
RUN wrk install rstudio
RUN wrk install excalidraw
RUN wrk install vvvebjs
```

__*Create your own workspace choosing from hundreeds of applications in [Alnoda Hub](https://alnoda.org/)*__ 

# Alternatively 

Start workspace: 

```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/alnoda-workspace
```

open [localhost:8020](http://localhost:8020) in browser and then terminal

Install apps: 

```
wrk install openvscode
wrk install kodexplorer
wrk install cloud-commander
wrk install zellij-ui
wrk install mate-desktop
wrk install jupyterlab
wrk install r
wrk install rstudio
wrk install excalidraw
wrk install vvvebjs
```

Restart workspace:

```
wrk kill
```

Ready to begin? Have a look at the [__*Getting Started Guide*__](https://docs.alnoda.org/get-started/launch-workspace/).

## Docs

Please visit our [**documentation website**](https://docs.alnoda.org)

## This repository

This repository houses a variety of workspaces with different selection of installed applications. These workspaces can serve as customized environments 
for specific projects or serve as examples for reference.


<p align="center">
  <img src="img/stand_with_ukraine.png" alt="Ukraine" width="250">
</p> 

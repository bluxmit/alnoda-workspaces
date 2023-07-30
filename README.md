<p align="center">
  <img src="img/alnoda-red.svg" alt="Alnoda logo" width="100">
</p> 

Open-source portable containerized workspaces. Isolate your work, make backups, copy, move between computers and cloud seamlessly.  

🚀 __NOW WITH FREE CHAT GPT!__ 🚀   

- 🔥 Have a full chat GPT in the workspace. 
- 🔥 Free without registration required
- 🔥 __Works even offline!__   

## Flexible

You can select preconfigured workspace [here](https://alnoda.org/registry/workspaces/) or make your own special workspace.  

![demo](img/wrk-demo.gif)

How to make this (Dockerfile): 

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

## Alternatively 

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

## Chat GPT 

__*Need full chat GPT experience?*__ 

Open workspace termial and innstall GPT: 

```
wrk install gpt
```

After installation has finished, reload terminal window, and open chat by executing `gpt` command in the terminal 

```
gpt
```

__💡 NOTE:__ GPT is experimental feature! Currently it is supported only in alnoda workspace v.2   

__❗ INFO:__ GPT is based on the Vicuna 7B model and only allowed for personal use. 

## Sharing 

Do you want to share any application of your workspace with your colleague? 

✅ Code editor, IDE, termial, notebook - you can grant access to any of the workspace applications over the Internet.  

One click, and your colleague will work together with you __*directly in your workspace running on your laptop!*__ 

## Self-hosting 

Wnat to run it in cloud and work from anywhere and any device? Read [__here__](https://docs.alnoda.org/user-guide/cloud-deployment/server/)

- [Docker compose with https and authentication](https://github.com/bluxmit/wrk-compose)   
- [Kubernetes Helm chart](https://github.com/bluxmit/alnoda-charts)

## Docs

Please visit our [**documentation website**](https://docs.alnoda.org)

## This repository

This repository houses a variety of workspaces with different selection of installed applications. These workspaces can serve as customized environments 
for specific projects or serve as examples for reference.


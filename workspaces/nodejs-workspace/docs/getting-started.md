# Getting started

## Intro  

To start, open Quickstart page [localhost:8020](http://localhost:8020/) for quick access to all the tools
    
From the quicklaunch page you can open workspace tools, such as code editor or terminal 

<div align="center" style="font-style: italic;">
    Demo: Workspace UI 
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/wid-ui.png" alt="wid-ui.png" width="750">
</p>

The code editor in this workspace is [Code-server](https://github.com/cdr/code-server)

<div align="center" style="font-style: italic;">
    Demo: Code-server
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/codeserver-workspace/img/codeserver-demo.gif" alt="Code-server demo" width="900">
</p>

Workspace has full-size browser-base terminal

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/base-workspace/img/base-workspace-terminal.gif" alt="Base-Workspace terminal" width="750">
</p> 

## Node.js

Check Node.js and npm versions 

```
node -v
npm -v
```

## NVM

NOTE: nvm does not work from the Codeserver embedded terminal.  

Use another version of Node.js

```
nvm install 16.0.0
nvm use 16.0.0
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/nodejs-workspace/img/nvm.png" alt="nvm.png" width="500">
</p>


## NPM

Check npm version 

```
npm -v
```

Install latest version of npm

```
npm install -g npm@latest
```

## Yarn

[Yarn](https://yarnpkg.com/) is a package manager for Node. js that focuses on speed, security, and consistency. 
It was originally created to address some issues with the popular NPM package manager.

```
npm install --global yarn
yarn --version
```

## Nodeenv

Node.js virtual environment - a tool to create isolated node.js environments.

It creates an environment that has its own installation directories, that doesn’t share libraries with other node.js virtual environments.  

Create folder and vrtual ennvironment in it

```
mkdir /home/project/venv-test 
cd /home/project/venv-test
nodeenv --node=12.18.3 env && . env/bin/activate 
```

Check Nnode.js version

```
node -v
npm -v
```

## Simple example

Clone example project 

```
cd /home/project
git clone https://github.com/contentful/the-example-app.nodejs.git 
cd the-example-app.nodejs
```

Install the dependencies

```
npm install
```

Start app

```
export PORT=8030
npm run start:dev
```

Open browser on [localhost:8030](http://localhost:8030/)



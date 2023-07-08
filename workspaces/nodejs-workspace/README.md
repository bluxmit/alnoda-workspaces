# Node.js workspace 

Browser-based portable and containerized development environment for Javascript Node.js projects

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/nodejs-workspace
```  

open [localhost:8020](http://localhost:8020) in browser.  

## Features

- Node 
- Npm 
- Yarn
- [Nvm](https://github.com/nvm-sh/nvm)
- [Nodeenv](https://pypi.org/project/nodeenv/)
- [*Codeserver workspace features*](https://github.com/bluxmit/alnoda-workspaces/tree/main/workspaces/codeserver-workspace)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  

## Node.js

Open workspace terminal and check Node.js or npm versions 

```
node -v
npm -v
```

To start Node.js REPL session simply execute 

```
node
```

## Nvm

Use another version of Node.js

```
nvm install 16.0.0
nvm use 16.0.0
```

## Npm

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
export PORT=8026
npm run start:dev
```

Open Quickstart page, go to "My apps" and use port 8026 shortcut to open your web app




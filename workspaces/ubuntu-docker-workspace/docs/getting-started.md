# Get started

## [Ctop](https://github.com/bcicen/ctop)

Top-like interface for container metrics.  

```
ctop
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-docker-workspace/img/ctop.png" alt="Ctop" width="750">
</p>

## [Lazydocker](https://github.com/jesseduffield/lazydocker) 

A simple terminal UI for both docker and docker-compose, written in Go with the gocui library.

```
lazydocker
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-docker-workspace/img/lazydocker.png" alt="Lazydockerr" width="750">
</p>

## [Sen](https://github.com/TomasTomecek/sen)

A terminal user interface for containers.

```
sen
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-docker-workspace/img/sen.png" alt="sen" width="750">
</p>

## [Dive](https://github.com/wagoodman/dive)

A tool for exploring a docker image, layer contents, and discovering ways to shrink the size of your Docker/OCI image.
    
```
docker pull postgres
dive alpine/postgres 
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ubuntu-docker-workspace/img/dive.png" alt="dive" width="750">
</p>

## Browser terminal

This workspace has browser-based terminal up and running. Open [localhost:8026](http://localhost:8026) in browser. 
Start the workspace on Rasberri Pi and use it via Tablet.  

In order to use browser-based terminal, expose port 8026

```
docker run --name space-1 -d -p 8026:8026 -v /var/run/docker.sock:/var/run/docker.sock --user=root alnoda/ubuntu-docker-workspace
```

<p align="center">
  <img src="https://github.com/bluxmit/alnoda-workspaces/blob/main/workspaces/ubuntu-workspace/img/web-based-terminal.png?raw=true" alt="dive" width="500">
</p>

## Extra

This workspace has all the features of the [**ubuntu-workspace**](../../ubuntu-workspace/docs/getting-started.md)   
 
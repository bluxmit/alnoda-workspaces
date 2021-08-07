# Codeserver-Workspace

Codeserver-Workspace - is alternative workspace to the `workspace-in-docker`. It has all the features ot the latter, except for the 
different implementation of the Visual Studio Code.  

While `workspace-in-docker` has [**Eclipse Theia IDE**](https://theia-ide.org/), Codeserver-Workspace 
includes [**Codeserver**](https://github.com/cdr/code-server) instead. 

#### Try it out

```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/codeserver-workspace
``` 

> The docs of the [**workspace-in-docker**](https://github.com/bluxmit/alnoda-workspaces/blob/main/workspaces/workspace-in-docker/README.md) 
> fully apply to the Codeserver-Workspace, with the only difference that you use image `alnoda/codeserver-workspace` instead of `alnoda/workspace-in-docker`
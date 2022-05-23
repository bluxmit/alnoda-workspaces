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

This workspace includes RStudio Server, a browser-based IDE for R.

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/r-workspace/img/RStudio.png" alt="RStudio" width="750">
</p>

Workspace has full-size browser-base terminal

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/base-workspace/img/base-workspace-terminal.gif" alt="Base-Workspace terminal" width="750">
</p> 


## R

Open terminal, and check R version 

```
R --version
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/r-workspace/img/r-version.png" alt="RStudio" width="500">
</p>

To start R shell, simply execute `R` in the terminal

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/r-workspace/img/r-shell.png" alt="RStudio" width="500">
</p>

If you want to install packages from the terminal, execute 

```
Rscript -e 'install.packages("drat", repos="https://cloud.r-project.org")'
```


## Examples

CUse terminal to clone example repository 

```
cd /home/abc 
git clone https://github.com/dmarcelinobr/r-code-examples.git
```

Open Rstudio, and try some examples, i.e. `2d-density-plot.r`. Evaluate code, agree to install dependencies 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/r-workspace/img/2d-density-plot.png" alt="RStudio" width="750">
</p>


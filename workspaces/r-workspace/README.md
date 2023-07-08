# R workspace 

Portable containerized enviroments for R projects. Workspace has VSCode IDE, RStudio and Jupyterlab.

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/r-workspace
```  

open [localhost:8020](http://localhost:8020) in browser.  

## Features

- [**R**](https://www.r-project.org/) - R programming language
- [**RStudio**](https://github.com/rstudio/rstudio) - Integrated development environment (IDE) for R
- [**JupyterLab with R kernel**](https://jupyter.org/) - Web-based interactive development environment for notebooks, code, and data. 
- [**radian**](https://github.com/randy3k/radian) - A 21 century R console. Like iPython for R
- [**Openvscode workspace features**](https://github.com/bluxmit/alnoda-workspaces/tree/main/workspaces/openvscode-workspace)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  

## R

Open terminal, and check R version 

```
R --version
```

To start R shell, simply execute `R` in the terminal

If you want to install packages from the terminal, execute 

```
Rscript -e 'install.packages("drat", repos="https://cloud.r-project.org")'
```

Open Radian shell:

```
r
```


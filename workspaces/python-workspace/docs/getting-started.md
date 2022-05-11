# Getting started

## Contents
* [Intro](#intro)
* [Code Editor](#code-editor)
* [Terminal](#terminal)
* [IPython and Notebooks](#ipython-and-notebooks)
* [Python tooling](#python-tooling)
    * [Python-report](#python-report)
    * [Pytest-html-reporter](#pytest-html-reporter)
    * [Pdoc3](#pdoc3)
    * [SnakeViz](#snakeviz)
    * [Vprof](#vprof)
    * [Flameprof](#flameprof)
    * [Pyinstrument](#pyinstrument)
    * [cProfile](#cprofile)
    * [Pylint-json2html](#pylint-json2html)
    * [Pre-commit](#pre-commit)
* [Schedule Python scripts](#schedule-python-scripts)

## Intro

This doc contains example tutorials how to use Python tooling included in Python workspace.   

To start, open Quickstart page [http://localhost:8020/](http://localhost:8020/) for quick access to all the tools
    
## Code Editor

Code editor of this workspace is [**Eclipse Theia**](https://theia-ide.org/docs/) - an open-source version of popular Visual Studio Code IDE. 
You can install any extension from [open-vsx.org](https://open-vsx.org/) that has hundreeds of extensions for VS Code compatible editors.  

<div align="center" style="font-style: italic;">
    Demo: Eclipse Theia
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/theia.png" alt="Theia" width="750">
</p>

## Terminal

Open Terminnal from the Quickstart page.

<div align="center" style="font-style: italic;">
    Demo: Browser-based terminal
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/python-terminal.gif" alt="python-terminal.gif" width="750">
</p> 


## [IPython and Notebooks](https://ipython.readthedocs.io/en/stable/)

IPython provides a rich toolkit to help you make the most of using Python interactively. One of its main components 
is a powerful interactive Python shell. IPython is very handy. For example, starting with IPython 7.0, and when using 
Python 3.6 and above, IPython offer the ability to run asynchronous code from the REPL.  

To start IPython kernel, open workspace terminal ad execute `ipython`. Below is an example of installing packages and 
evaluation of async code in IPython shell - something you cannot do in a standard python shell: 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/ipython.png" alt="ipython.png" width="900">
</p> 

**NOTE:** in order not to increase the Workspace size, by default Python Workspace can only render notebooks. 
Workspace does not have installed all the requirements to run notebooks. This is can be done easily. As soon as you 
try to run a cell in the note, you will see a pop-out winndow suggesting to install missing dependencies. You just need to accept. 

<div align="center" style="font-style: italic;">
    Demo: Install dependencies for notebooks
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/notebooks-install.png" alt="notebooks-install.png" width="900">
</p> 


## Python tooling  

### Python-report 

Python-report is a small utility that tryies to generate various reports and artefacts from your python project, such as linting 
report; run tests and make HTML report; make auto-documentation and profiling visualizations. Unit test statistics will be visualised 
with the browser-based dashboard.  

> `cd /home/examples/simple-script && python-report `

The resulting report will be produced to the folder `/home/static-server/<NAME-OF-PYTHON-PROJECT-FOLDER>/<TIMESTAMP>`.  

<div align="center" style="font-style: italic;">
    Demo: Python report
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/python-report.gif" alt="python-report.gif" width="900">
</p> 

*(In addition, all pytests statistics will be collected, and available in foldder `/home/static-server/<NAME-OF-PYTHON-PROJECT-FOLDER>`)*.  

Python-report is a simple bash script `/home/abc/utils/python-report.sh`. You can also use separately any of the toos.  

### [Pytest-html-reporter](https://github.com/prashanth-sams/pytest-html-reporter) 

Pytest-html-reporter generates a beautiful static html report based on pytest framework. These reports result in dashboard website, 
that shows all historical tests and statistics.   

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/pytest-html-report.png" alt="pytest-html-report.png" width="750">
</p> 

To execute tests, and generate report with Pytest-html-reporter, cd to the python project tests folder, 
and execute `pytest ./ --html-report=./pytest-report`. The results will be produced to the sub-folder `./pytest-report`.  

For instance, execute tests and generate report for the example python project execute 

> `cd /home/examples/simple-script && pytest ./ --html-report=/home/static-server/my-pytest-report `   

the output will be in folder `/home/static-server/my-pytest-report` that is served with a Static-file server

<div align="center" style="font-style: italic;">
    Demo: Pytest-html-reporter
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/pytest-html-report.gif" alt="pytest-html-report.gif" width="900">
</p> 

### [Pdoc3](https://github.com/pdoc3/pdoc)

Auto-generate API documentation for Python projects. Let's generate autodocumentation website for the example python project, 
with output into `` where it can be viewed with Static-file server  

> ` cd /home/examples/simple-script && pdoc --html --output-dir /home/static-server/pdoc-html ./  `

<div align="center" style="font-style: italic;">
    Demo: Pdoc3
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/pdoc3.gif" alt="pdoc3.gif" width="900">
</p> 


### [Vprof](https://github.com/nvdv/vprof)

Vprof is a Python package providing rich and interactive visualizations for various Python program characteristics 
such as running time and memory usage. 

Vprof is a browser-based profiling tool. Here is an example of profiling scripts from the example python project: 

> `cd /home/examples/simple-script && vprof -H 0.0.0.0 -p 8031 -c cpmh fib.py `    
> `cd /home/examples/simple-script && vprof -H 0.0.0.0 -p 8031 -c cpmh script.py `    

<div align="center" style="font-style: italic;">
    Demo: Vprof
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/vprof.gif" alt="vprof.gif" width="900">
</p> 


### [SnakeViz](https://jiffyclub.github.io/snakeviz/)

SnakeViz is a browser based graphical viewer for the output of Python’s cProfile module. Let's profile 
and visualize one of python modules in the example project: 

> `cd /home/examples/simple-script && python -m cProfile -o script.prof script.py `    
> `snakeviz -s -p 8030 -H 0.0.0.0 script.prof `   

You will see thae link appeared in the terminal, open it in browser 

<div align="center" style="font-style: italic;">
    Demo: SnakeViz
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/snakeviz.gif" alt="snakeviz.gif" width="900">
</p> 

### [Flameprof](https://github.com/baverman/flameprof/)

Flameprof is a Flamegraph generator for python's cProfile stats. 

Let's profile and visualize one of python modules in the example project:

> `cd /home/examples/simple-script && python -m cProfile -o script.prof script.py `   
> ` flameprof script.prof > script.svg `   

<div align="center" style="font-style: italic;">
    Demo: Flameprof
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/flameprof.png" alt="flameprof.png" width="750">
</p> 


### [Pyinstrument](https://pypi.org/project/pyinstrument/3.0.0b3/)

Pyinstrument is a Python profiler. A profiler is a tool to help you 'optimize' your code - make it faster. 
It sounds obvious, but to get the biggest speed increase you must focus on the slowest part of your program. 
Pyinstrument helps you find it!   

Profile and visualize one of python modules in the example project:

> `mkdir -p /home/static-server/profiling/basic-python-script `   
> `pyinstrument -t -r html -o /home/static-server/profiling/basic-python-script/p2  script.py `   

<div align="center" style="font-style: italic;">
    Demo: Pyinstrument
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/pyinstrument.png" alt="pyinstrument.png" width="900">
</p> 


### [cProfile](https://docs.python.org/3/library/profile.html#module-cProfile)

cProfile is recommended for most users; it's a C extension with reasonable overhead that makes it suitable 
for profiling long-running programs. Profile and visualize one of python modules in the example project:

> `cd /home/examples/simple-script && python -m cProfile script.py >> /home/static-server/cprof.tx `


### [Pylint-json2html](https://github.com/Exirel/pylint-json2html)

A pylint JSON report file to HTML: pylint is used to generate a JSON report, and this tool will transform this report into 
an HTML document: 

> `pylint script.py | pylint-json2html -f jsonextended -o script.html `   

<div align="center" style="font-style: italic;">
    Demo: Pylint-json2html demo
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/pylint.png" alt="pylint.png" width="750">
</p> 

### Pre-commit 

Git hook scripts are useful for identifying simple issues before submission to code review. We run our hooks on every commit 
to automatically point out issues in code such as missing semicolons, trailing whitespace, and debug statements. By pointing 
these issues out before code review, this allows a code reviewer to focus on the architecture of a change while not wasting 
time with trivial style nitpicks.

The example python project has a pre-commit configuration file:
 
> `cd /home/examples/simple-script && pre-commit install ` 
> `pre-commit run --all-files ` 
 
### Schedule python jobs

Workspace inncludes [Cronicle](https://github.com/jhuckaby/Cronicle) - a powerful scheduling tool, that has a browser-based UI with dashboards, 
allows to configure resource limits for jobs and much more!  

Python Workspace includes an example script that fetches today's exchange rates:   

> `cd /home/examples/exchange_rates `  
> `python fetch-rates.py `

The script will fetch today's exchange rates from and output result to the folder `/home/static-server/exchange-rates_<DATE>.json`. This 
folder is served by the Static-file server 

<div align="center" style="font-style: italic;">
    Demo: Fetch exchange rates
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/exchange-rates.gif" alt="exchange-rates.gif" width="900">
</p> 

Fetching echange rates - is a typical problems for nearly every business, that is working on the international market. You can 
schedule execution of this script to fetch exchange rates daily  

<div align="center" style="font-style: italic;">
    Demo: Schedule exchange rates
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/python-workspace/img/schedule-exchange-rates.gif" alt="exchange-rates.gif" width="900">
</p> 

**NOTE:** Scheduling jobs is especially useful when the Workspace is running on a cloud server. 
[Read here how to launch workspace in cloud](#secure-remote-workspace).
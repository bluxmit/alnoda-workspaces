<p align="center">
  <img src="../../img/Alnoda-white.svg" alt="Alnoda logo" width="150">
</p>  

# Jupyter notebook workspace 

Opinionated Jupyter notebook & Jupyter Lab installation, together with the toolset to get the most out of the Jupyter notebooks. 

Explore and analyze data, build reports, presentations and documentation. Convert notebooks to various formats. 
Serve notebooks for reporting. Create data pipelines from notebooks. Schedule executions with UI and monitoring tool. 

![Workspace collage](img/notebook-wid-collage.png)

## Why this images

1. You need a ready-to-go Jupyter environment with batteries included, such as pandas dataframes vizualisation and exploration, code autocompletion, etc. And you don't want to install all the extensions and struggle with dependencies resolution.
2. You need to schedule executions of your notebooks, whether it is on local laptop or on the server 
3. You need to make use of your notebooks - create slides, PDFs, HTML, reports, docs 
4. You want to turn notebooks into analytical reporting apps or interactive web applications 
5. You want to productionalize notebooks - create pipelines of batch jobs and schedule their executions

There are short [tutorials](https://docs.alnoda.org/notebook-workspace/) on how to use most of the mentioned features, 
with example notebooks. 

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 alnoda/notebook-workspace
```  

and open [localhost:8020](http://localhost:8020) in browser.  

## Features

**Notebooks**

- [Jupyter Notebook](https://github.com/jupyter/notebook) - Classic web-based notebook environment for interactive computing.
- [JupyterLab](https://github.com/jupyterlab/jupyterlab) - An extensible environment for interactive and reproducible computing, based on the Jupyter Notebook.
- [VS-Code notebooks extension](https://github.com/microsoft/vscode-notebook-renderers) - Jupyter Notebooks in Visual Studio Code

**Notebook execution**

- [NBClient](https://github.com/jupyter/nbclient) - Run Jupyter Notebooks in different execution contexts, including the command line. 
- [Nbterm](https://github.com/davidbrochart/nbterm) - Lets you view, edit and execute Jupyter Notebooks 
in the terminal, and produce the new notebook as a result of execution. 
- [Papermill](https://papermill.readthedocs.io/en/latest/index.html) - A tool for parameterizing, executing, and analyzing Jupyter Notebooks. 

**Convert Notebooks to other formats**

- [Jupytext](https://jupytext.readthedocs.io/en/latest/) - Can save Jupyter notebooks as python or markdown.  
- [Nbconvert](https://nbconvert.readthedocs.io/en/latest/index.html) - Tool that allows to convert an .ipynb notebook 
file into various static formats including executable scripts. 
- [nbless](https://github.com/py4ds/nbless) - Conversion of python notebooks into various commands, including .py executable scripts.  

**Notebook as reports**

- [Voila](https://github.com/voila-dashboards/voila) - Voilà turns Jupyter notebooks into standalone web applications. 
- [NBViewer](https://github.com/jupyter/nbviewer) - A simple way to view and share Jupyter Notebooks.
- [Datapane](https://github.com/datapane/datapane) -The easiest way to create data science reports from Python. 

**Interactive web applications**

- [Mercury](https://mercury-docs.readthedocs.io/en/latest/) - Mercury is a perfect tool to convert any Jupyter notebook to interactive web app. 
- [Jupyter Dash](https://github.com/plotly/jupyter-dash) - Develop Plotly Dash apps interactively from within Jupyter environments. 

**Data visualisation and exploration**

- [D-Tale](https://github.com/man-group/dtale) - is a comprehensive solution that allows to explore and analyze raw data files, 
as well as pandas dataframes. D-Tale is extremely powerful, is great toolset to visualise, explore and study the datasets. 
- [Lux](https://github.com/lux-org/lux) - Recommends a set of visualizations highlighting interesting trends and patterns in the pandas data frame.
- [Qgrid](https://github.com/quantopian/qgrid) - Jupyter notebook widget which uses SlickGrid to render pandas data frames. 
- [Data Preview](https://marketplace.visualstudio.com/items?itemName=RandomFractalsInc.vscode-data-preview) - VS-Code 
extension which provides tabular view for csv files and allows interactive exploration of data.

**Pipelines: scheduling and execution**

- [Ploomber](https://github.com/ploomber/ploomber) - The fastest way to build data pipelines with Jupyter notebooks.
- [Luigi](https://github.com/spotify/luigi) - Build complex pipelines of batch jobs. Luigi handles dependency resolution, workflow management, visualization etc. 
- [Cronicle](https://github.com/jhuckaby/Cronicle)  - Task scheduler and runner, with a web based front-end UI. It handles both scheduled, repeating and on-demand jobs, targeting any number of worker servers, with real-time stats and live log viewer.

**Documentation and slideshow**

- [Jupyter book](https://github.com/executablebooks/jupyter-book) - Create beautiful, publication-quality books and documents from computational content. 
- [MkDocs](https://squidfunk.github.io/mkdocs-material/)  - Create awesome documentation for your project with only markdown. 
- [RISE](https://github.com/damianavila/RISE) - Allows you to instantly turn your Jupyter Notebooks into a slideshow.

**Jupyter extensions**

- [Jupyterlab-lsp](https://github.com/jupyter-lsp/jupyterlab-lsp) - Coding assistance for JupyterLab (code navigation + hover suggestions + linters + autocompletion + rename. 
- [Jupyterlab-theme-toggle](https://github.com/jtpio/jupyterlab-theme-toggle) - Toggle light/dark themes in the JupyterLab Top Bar area.

**Python data and viz packages**

- [Pandas](https://pandas.pydata.org/). Fast, powerful, flexible and easy to use open source data analysis and manipulation tool.
- [Fugue SQL](https://fugue-tutorials.readthedocs.io/tutorials/fugue_sql/index.html) - SQL for Pandas.
- [Numpy](https://github.com/numpy/numpy) - Fundamental package for scientific computing with Python.
- [SciPy](https://github.com/scipy/scipy) - Software for mathematics, science, and engineering.
- [Matplotlib](https://matplotlib.org/) - Comprehensive library for creating static, animated, and interactive visualizations in Python
- [Seaborn](https://seaborn.pydata.org/examples/index.html) - Data visualization library which provides a high-level interface for drawing attractive and informative statistical graphics.
- [Plotline](https://github.com/has2k1/plotnine) - An implementation of a grammar of graphics in Python, it is based on ggplot2. 
- [Plotly](https://plotly.com/python/getting-started/#installation) - Interactive, open-source plotting library that supports over 40 unique chart types.
- [Altair](https://github.com/altair-viz/altair) - Altair is a declarative statistical visualization library for Python. Altair's API is simple, friendly and consistent.

**Python tools:**

- [IPython and Notebooks](https://ipython.readthedocs.io/en/stable/)
- [Pdoc3](https://github.com/pdoc3/pdoc)
- [Pytest-html-reporter](https://github.com/prashanth-sams/pytest-html-reporter)
- [SnakeViz](https://jiffyclub.github.io/snakeviz/)
- [Vprof](https://github.com/nvdv/vprof)
- [Pyinstrument](https://pypi.org/project/pyinstrument/3.0.0b3/)
- [Flameprof](https://github.com/baverman/flameprof/)
- [Pylint-json2html](https://github.com/Exirel/pylint-json2html)
- [Pre-commit](https://pre-commit.com/)
- [Flake8](https://flake8.pycqa.org/en/latest/)
- [Poetry](https://python-poetry.org/)
- [Black](https://github.com/psf/black)

**Dev tools:**

- [VS-Code](https://theia-ide.org/docs/) - browser-based open source version of popular Visual Studio Code IDE. It has 
VS-Code extensions and works in browser. This means it can run inside a docker container on local machine or in cloud. A lot of beautiful color themes and many common plugins are already installed to save time.  
- [Terminal](https://github.com/tsl0922/ttyd) - secure browser-based terminal.
- [FileBrowser](https://github.com/filebrowser/filebrowser)  - manage files and folders inside the workspace, and exchange data between local environment and the workspace
- [Static File Server](https://github.com/vercel/serve) - view any static html sites as easy as if you do it on your local machine. Serve static websites easily.
- [Ungit](https://github.com/FredrikNoren/ungit) - rings user friendliness to git without sacrificing the versatility of it.
- [Midnight Commander](https://midnight-commander.org/)  - Feature rich visual file manager with internal text viewer and editor. 
- [Process Monitor](https://htop.dev/)  - Monitor running process and resource utilization. 
- Quicklaunch UI with getting started tutorial

Image is built from **Ubuntu 20.4** with the additional CLI apps

- [Zsh](https://www.zsh.org/), [Oh my Zsh](https://ohmyz.sh/)
- Python 3, Pip 
- Node/nodeenv
- curl, wget, telnet, jq
- **Git:** git, git-flow, lazygit 
- **File browsers:** mc, xplr
- **Text editors:** nano, vim, mcedit
- **System monitors:** ncdu, htop, glances, vizex
- **Process Control:** supervisord
- **Job scheduler:** cron

## Docs

See our guides on 

- [**getting started with workspaces**](https://docs.alnoda.org/get-started/common-features/)
- [**working with data**](https://docs.alnoda.org/notebook-workspace/working-with-data/)
- [**data exploration**](https://docs.alnoda.org/notebook-workspace/data-exploration/)
- [**presentations**](https://docs.alnoda.org/notebook-workspace/presentations/)
- [**reports from notebooks**](https://docs.alnoda.org/notebook-workspace/reports/)
- [**productionalize notebooks**](https://docs.alnoda.org/notebook-workspace/productionalize/)
- [**pipelines**](https://docs.alnoda.org/notebook-workspace/pipelines/)
- [**interactive web app**](https://docs.alnoda.org/notebook-workspace/interactive/)
- [**documentation**](https://docs.alnoda.org/notebook-workspace/documentation/)
- [**workspace docs**](https://docs.alnoda.org/notebook-workspace/) 
- [**project docs**](https://docs.alnoda.org/)

## Demo

<div align="center" style="font-style: italic;">
    Demo: Notebook workspace
</div>

<p align="center">
  <img src="img/notebook-wid.gif" alt="notebook-wid-demo" width="750">
</p> 
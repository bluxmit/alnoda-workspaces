# Jupyter workspace

Workspace equipped with Jupyterlab and has a suite of tools for utilizing Jupyter notebooks

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/jupyter-workspace
```  

and open [localhost:8020](http://localhost:8020) in browser.  

## Features

- [JupyterLab](https://github.com/jupyterlab/jupyterlab) - Web-based interactive development environment for notebooks, code, and data. 
- [jpterm](https://github.com/davidbrochart/jpterm) - jpterm aims to be the equivalent of JupyterLab in the terminal. 
- [Euporie](https://github.com/joouha/euporie) - Euporie is a terminal based interactive computing environment for Jupyter.
- [jut](https://github.com/kracekumar/jut) - Render Jupyter notebook in the terminal 
- [nbpreview](https://github.com/paw-lu/nbpreview) - A terminal viewer for Jupyter notebooks. It’s like cat for ipynb files. 
- [nbterm](https://github.com/davidbrochart/nbterm) - Jupyter Notebooks in the terminal.
- [jupyter-python](https://github.com/python-lsp/python-lsp-server) - Python LSP Server for Jupyterlab. Support for code completion, syntax highlighting
- [NBClient](https://github.com/jupyter/nbclient) - Tool for running Jupyter Notebooks in different execution contexts, including the command line.
- [nbconvert](https://github.com/jupyter/nbconvert) - Jupyter Notebook Conversion
- [papermill](https://papermill.readthedocs.io/) - Papermill is a tool for parameterizing and executing Jupyter Notebooks.
- [Jupytext](https://github.com/mwouts/jupytext) - Jupyter Notebooks as Markdown Documents, Julia, Python or R scripts.
- [**Alnoda workspace features**](https://docs.alnoda.org/)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  

## NBClient

[NBClient](https://github.com/jupyter/nbclient) is a tool for running Jupyter Notebooks in different execution contexts, 
including the command line. NBClient makes it possible to run command  `jupyter execute` which runs Notebook cells one-by-one.  
  
For example:

```
jupyter execute my-notebook.ipynb
```

This will execute each note in the notebook. 

NBClient might handy, if you need to automate such tasks as web scrapping, data analysis or preparation, 
retraining of machine learning models.


## Nbterm

[Nbterm](https://github.com/davidbrochart/nbterm) lets you view, edit and execute Jupyter Notebooks 
in the terminal, and produce the new notebook as a result of execution.  

One of the differences between NBClient and Nbterm, is that the latter produces new notebook as a result. This 
is especially useful if you plan to use notebooks as reports.  

An example use-case would be querying datasase, computing statistics from new orders or client activity, 
and providing read-only executed notebook via NBviewer. Such notebook will contain both code, SQL as well as 
results of execution - statistics, chartss and plots.  

For example:

```
nbterm --run notebook.ipynb --save-path /home/project/notebook-1.ipynb
```

Because flag `--save-path` was defined, executed notebook has been saved.

## Papermill

[Papermill](https://papermill.readthedocs.io/en/latest/index.html) is a tool for parameterizing, executing, and analyzing Jupyter Notebooks.  

Papermill solves the problem of parameterizing notebooks in a simple and efficient way. Jupyter notebooks allow users to tag cells. 
Papermill lets you to tag a cell, which contains parameters with parameters tag.   

To parameterize a notebook, designate a cell with the tag parameters.  

As an example, open Jupyter notebook from the Quickstart page, and create a new note.  

First thing to do - is to enable tags. Click `View -> Cell Toolbar -> Tags`. This will enable the tags UI.

Open terminal and execute with different parameters, for example:

```
papermill mynotebook.ipynb mynotebook-1.ipynb -p PARAM1 "My name" -p PARAM2 "Slim Shady"
```

### Nbconvert

[Nbconvert](https://nbconvert.readthedocs.io/en/latest/index.html) tool allows you to convert an .ipynb notebook 
file into various static formats including executable scripts.  

For example:

```
jupyter nbconvert --to script mynotebook.ipynb --output /home/project/newfile
```

Now you can execute this newly-generated python script 

```
python /home/project/newfile.py
```

Nbconvert can convert to other formats too, such as HTML, PDF, LaTeX. Check tutorial about reports.


### nbless

The [nbless](https://github.com/py4ds/nbless) Python package includes `nbconv` shell command, which makes conversion 
of python notebooks into various commands, including .py executable scripts.  

To try it with the example notebook, execute in terminal

```
nbconv mynotebook.ipynb --exporter python --out_file /home/project/mynotebook.py
```

You will see that file 'mynotebook.py' has appeared in the '/home/project' folder.


### Jupytext

[Jupytext](https://jupytext.readthedocs.io/en/latest/) can save Jupyter notebooks as python or markdown:

```
jupytext --to py mynotebook.ipynb  --output /home/project/myscript.py
```

# Python workspace 

Portable isolated containerized development environment for Python projects.  

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/python-workspace
```  

open [localhost:8020](http://localhost:8020) in browser.  

## Features

- [IPython](https://ipython.readthedocs.io/en/stable/)
- [Poetry](https://python-poetry.org/)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  

## Pyenv

[pyenv](https://github.com/pyenv/pyenv) is used to isolate Python versions. For example, you may want to test your code against 
Python 2.7, 3.6, 3.7 and 3.8, so you'll need a way to switch between them. 

List python versions

```
pyenv install --list
```

Install additional python versions

```
pyenv install 3.10.4
pyenv install  3.6.0
pyenv install 3.10.7
```

Check installed python versions

```
pyenv versions
```

Change global python version 

```
pyenv global 3.10.4
```

Check python version

```
python --version
```

Create folder with local python environment, check Python version

```
mkdir test-pyenv
cd test-pyenv
pyenv local 3.6.0
python --version
```

If you want to schedule script (with Cronicle) that uses pyenv, add `eval "$(pyenv init -)"` before the script. 
For example `eval "$(pyenv init -)"; python /home/project/scripts/script.py`

## Poetry

Create our project

```
poetry new poetry-demo
cd poetry-demo
```

Specify dependencies in pyproject.toml.   

By default, poetry creates a virtual environment. There are several ways to run commands within this virtual environment. 
To run your script simply use poetry run

```
poetry run python your_script.py
```

The easiest way to activate the virtual environment is to create a new shell with poetry shell 

```
poetry shell 
```

If you want to use another python version (installed with pyenv):

```
poetry env use python3.10.4
```
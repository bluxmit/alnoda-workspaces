# Basic python script

Boilerplate for the most simple python scripts

```sh
mv /home/examples/simple-script /home/project
```

### Pre-commit 

```
cd /home/examples/simple-script && pre-commit install 
git add .
git commit -m "initial"
```


### [Flake8](https://flake8.pycqa.org/en/latest/)

Tool For Style Guide Enforcement. Test all files in folder and subfolders

```
flake8 ./
```

### [Pyinstrument](https://pypi.org/project/pyinstrument/3.0.0b3/)

Pyinstrument is a Python profiler. A profiler is a tool to help you 'optimize' your code - make it faster. 
It sounds obvious, but to get the biggest speed increase you must focus on the slowest part of your program. 
Pyinstrument helps you find it!

```sh
mkdir -p /home/static-server/profiling/basic-python-script
pyinstrument -t -r html -o /home/static-server/profiling/basic-python-script/p2  script.py
```

### [pylint](https://pypi.org/project/pylint/)

- lint one python file
```
pylint script.py | pylint-json2html -f jsonextended -o script.html 
```

### [cProfile](https://docs.python.org/3/library/profile.html#module-cProfile)

```
cd /home/examples/simple-script && python -m cProfile script.py 
```

### [Flameprof](https://github.com/baverman/flameprof/)

- Create flamechart for profiling one python module

```
cd /home/examples/simple-script && python -m cProfile -o script.prof script.py 
flameprof script.prof > script.svg
```


## Profiling services

### [Snakeviz](https://jiffyclub.github.io/snakeviz/)

- Profile one python module and create vizualisation

```
cd /home/examples/simple-script && python -m cProfile -o script.prof script.py 
snakeviz -s -p 8030 -H 0.0.0.0 script.prof
```

And click on the link that appears in the terminal...


### [Vprof](https://github.com/nvdv/vprof)

Python profiling visualisation sever. Profile and visualise module script.py

```
cd /home/examples/simple-script && vprof -H 0.0.0.0 -p 8031 -c cm script.py
```

### Check out
- https://pythonawesome.com/
- https://github.com/mitmproxy/pdoc
- https://github.com/P403n1x87/austin-tui
- [PySpy](https://github.com/benfred/py-spy)

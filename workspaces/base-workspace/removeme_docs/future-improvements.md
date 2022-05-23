# Potential Future improvements

### [Glances](https://github.com/nicolargo/glances)

Glances is a cross-platform monitoring tool which aims to present a large amount of monitoring information through a curses or Web based interface. The information dynamically adapts depending on the size of the user interface.   

**NOTE:** Great tool, lots of additional metrics. But adds more CPU overhead - around 2% compared to 0.7% of HTOP   

- Install

```
pip install bottle 
pip install glances
```

- Launch 

```
glances -p 8030 -w
```
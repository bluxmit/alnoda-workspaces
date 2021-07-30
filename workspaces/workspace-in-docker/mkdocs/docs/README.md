**This is a starting point to create docs for this workspace!**

In order to change this page, simply modify the file `/home/docs/docs/README.md`. Changes will be applied automatically.

In order to add a new doc file, it is enough to create a file in the folder `/home/docs/docs` and add respective entry 
to the configuratiion file `/home/docs/mkdcs.yaml`.   

For example, [enter the terminal in the workspace](get-started.md#workspace-terminal), 
and create new documentation file with some text at your will, and save changes

> `nano /home/docs/docs/new.md` 

edit file `mkdcs.yaml`  

> `nano /home/docs/mkdcs.yaml`  

Add record about the new file to **nav**, and save changes

```yaml
nav:
  - Home: pages/home/home.md
  - About: README.md
  - Get started: get-started.md
  - New: new.md
```
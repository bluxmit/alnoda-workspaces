# Ubuntu-Browsh

Ubuntu-Browsh - is [Ubuntu-Workspace](https://github.com/bluxmit/alnoda-workspaces/blob/main/workspaces/ubuntu-workspace) with a terminal 
text-based browser [Browsh](https://www.brow.sh/) installed.  

Ubuntu-Browsh has was created to tackle a very specific use-case - ability to view WEB UIs of the internal applications running in the internal 
network, that does not have ingress for public internet connections. In other words, if you are allowed to SSH to one servers inside the private 
network, but cannot access WEB UIs of the applications inside this network. One of the reasons might be that these WEB UIs don't have restriction/auth 
mechanism built in. Or the company policy forbids opening any accesses from the specific network to the internet access.  

One of the particular use-cases this workspace was used for - is to view EMR WEB interfaces (Spark History server UI, YARN UI, Livy UI), 
and check the Spark logs out. There here are other ways to do this, i.e. setting up SSH tunneling, installing browser plugins, creating 
secure gateways with VPN. This way is jus the simplest, and does not require modification of infrastructure or local environment.  

## Use inrivate network

SSH to one of the servers in the private network, and execute 

```
docker run --name browsh-workspace -d alnoda/ubuntu-browsh
```

and ssh into the workspace 

```
docker exec -it browsh-workspace /bin/zsh
```

## Other cases 

```
docker run --name browsh-workspace -d -p 8026:8026 alnoda/ubuntu-browsh
```

Open your browser on http://localhost:8026 and open any website with Browsh

> `browsh --startup-url google.com`

## Tips

Sometimes if you quit Browsh, and try to launch it again later, there might be an error saying that headless Firefox is already running. 
Execute `ps aux` find pid of firefox process and kill it, i.e. `kill 988` 




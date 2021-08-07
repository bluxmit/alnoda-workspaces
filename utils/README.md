# Utilities

## Running workspace on server in cloud

There are many benefits of using workspace in cloud, some of them:

- you can use workspace on any device with internet access, even on tablet
- it is great for collaboration (anyone can work together with you)
- you have access to more poverful machine
- you can use workspace for long-running or periodic jobs

There are 2 security considerations to be taken into accont, using workspace in cloud:

1. encrypted https connection 
2. authentication

To enable https and auth for workspace, one can add reverse proxy to the workspace deployment. 
The utility `remote.py` generates all what's needed to run workspace on cloud server behind reverse proxy. 
This utility generates certificates, traefik config and docker-compose file  

```
python remote.py --workspace="base-workspace" --port="8020" --host="68.183.69.198" --user="user1" --password="pass1"
```

**IMPORTANT: the best is to execute this python script inside worrkspace in docker, whick runs on local laptop**

The following 4 arguments must be provided:
- --workspace - name of the workspace (all lowercase)
- --port - port ofor the workspace UI. Workspace will also take N consequent ports after this one. base-docker for example, 
    uses 10 ports
- --host - IP or hostname of the server where workspace will be deployed
- --user - any username
- --password - any password

After command is executed, the new folder `remote` is created in the same directory. Copy this folder to the remote server.  

*Hint: in order to copy folder to remote, you start base workspace on remote with local volume mounted `docker run --name space-temp -v /home/tmp:/tmp -p 8020-8030:8020-8030 -e WRK_HOST="<ip-of-your-remote-server>" alnoda/base-workspace` copy and remove this workspace right after that.*

On the remote server ssh to this folder, and execute

```
docker-compose up -d
```

The workspace is running, and it is secured with https and user/password. Notice, that self-sined certificate is used, and browser will 
deisplay a warning when you try to assess the workspace UI on `https://<ip-of-your-remote-server>:8020`. Agree to the warning and proceed.


## Serve Static Website

Web application should be deployed with domain name and over https. To have this we suggest to use docker-compose file.  

### Example: generate and serve docs

Open terminal the workspace, which has UI, and build docs
 
> `cd /home/docs`  
> `mkdocs build -d /home/static-server/doc`  

You can check that static website is served by the static web server.  

Ssh to the server where the workspace is running, and commit workspace to a new image. Assuming, workspace name `remote_workspace_1`

> `docker commit remote_workspace_1 docs:0.1`  

Now we will run container from image docs:0.1, and add traefik reverse proxy with https. But before doing it, you need to buy domain name, 
and set A record for your new domain to point to the IP of the server, where the docs are running 





```
version: "3.3"
services:
  traefik:
    image: "traefik:v2.4"
    container_name: "traefik"
    command:
      - "--providers.docker=true"
      - "--providers.docker.exposedbydefault=false"
      - "--entrypoints.web.address=:80"
      - "--entrypoints.websecure.address=:443"
      - "--certificatesresolvers.myresolver.acme.tlschallenge=true"
      - "--certificatesresolvers.myresolver.acme.email=blackmaster@gmail.com"
      - "--certificatesresolvers.myresolver.acme.storage=/letsencrypt/acme.json"
    ports:
      - "443:443"
      - "80:80"
    volumes:
      - "./letsencrypt:/letsencrypt"
      - "/var/run/docker.sock:/var/run/docker.sock:ro"

  workspace:
    image: "docs:0.1"
    container_name: "workspace"
    labels:
      - "traefik.enable=true"
      - "traefik.http.middlewares.httprepl.redirectregex.regex=^http://(.*)"
      - "traefik.http.middlewares.httprepl.redirectregex.replacement=https://$${1}"

      - "traefik.http.middlewares.add-context.redirectregex.regex=^https:\\/\\/([^\\/]+)\\/?$$"
      - "traefik.http.middlewares.add-context.redirectregex.replacement=https://$$1/doc/pages/home/home/"

      - "traefik.http.services.STATICFS_URLhttp.loadbalancer.server.port=8022"
      - "traefik.http.routers.STATICFS_URLhttp.service=STATICFS_URL"
      - "traefik.http.routers.STATICFS_URLhttp.rule=PathPrefix(`/`)"
      - "traefik.http.routers.STATICFS_URLhttp.entrypoints=web"
      - "traefik.http.routers.STATICFS_URLhttp.middlewares=httprepl"

      - "traefik.http.services.STATICFS_URL.loadbalancer.server.port=8022"
      - "traefik.http.routers.STATICFS_URL.service=STATICFS_URL"
      - "traefik.http.routers.STATICFS_URL.rule=Host(`elnoda.org`)"
      - "traefik.http.routers.STATICFS_URL.entrypoints=websecure"
      - "traefik.http.routers.STATICFS_URL.middlewares=basic-auth"
      - "traefik.http.routers.STATICFS_URL.tls=true"
      - "traefik.http.routers.STATICFS_URL.tls.certresolver=myresolver"
      - "traefik.http.routers.STATICFS_URL.middlewares=add-context"
```





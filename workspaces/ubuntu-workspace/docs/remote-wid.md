# Ubuntu-workspace on remote server

This is the docker-compose that can be used to spin-up Ubuntu-workspace on the remote server together with the 
reverse proxy, that adds authentication.  

```
version: "3.3"
services:
  traefik:
    image: "traefik:v2.4"
    container_name: "traefik"
    command:
      - "--providers.docker"
      - "--entrypoints.terminal.address=:8026"
    ports:
      - 8026:8026
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock:ro"
  workspace:
    image: alnoda/ubuntu-workspace
    labels:
      # To create user:password pair, execute in any workspace echo $(htpasswd -nB <userName>) | sed -e s/\\$/\\$\\$/g
      - "traefik.http.middlewares.basic-auth.basicauth.users=admin:$$2y$$05$$eub6CV.CwUYCCQjNBvSf5uZnzdRmVwGZ/ncxecb9O7WxCR8aLuM3K"
      - "traefik.enable=true"
      # terminal
      - "traefik.http.services.terminal.loadbalancer.server.port=8026"
      - "traefik.http.routers.terminal.service=terminal"
      - "traefik.http.routers.terminal.rule=PathPrefix(`/`)"
      - "traefik.http.routers.terminal.entrypoints=terminal"
      - "traefik.http.routers.terminal.middlewares=basic-auth"
```

This configuration launches workspace with the default authentication user:pass is **admin:admin**. 
You might want to generate new credentials.  

The password for the traefik basic auth must be encrypted with the **htpasswd**. For connvenience, 
it is installed in every workspace-in-docker, and the easiest way is to generate the password 
is to launch workspace locally first, use its terminal to create a password, and then start 
workspace on remote server.  

To encrypt password open terminal of the local workspace and execute 

> ```echo $(htpasswd -nB <userName>) | sed -e s/\\$/\\$\\$/g```  

substitute `<userName>` with the new user name, and prowide password on prompt. After this htpasswd will output encrypted password.

Don't forget to change this line in the docker-compose file with the new user:encpypted_pass

```
- "traefik.http.middlewares.basic-auth.basicauth.users=admin:$$2y$$05$$eub6CV.CwUYCCQjNBvSf5uZnzdRmVwGZ/ncxecb9O7WxCR8aLuM3K"
```

Create file ```remote-workspace-auth.yaml``` on the remote server, paste yaml from above (preferrably with new auth) 
and start workspace 

```
docker-compose -f remote-workspace-auth.yaml up -d 
```

**NOTE:** this set up adds authentication, but it is not secure, password and communication are unencrypted. Consider using 
workspace utility that generates configuration for more secure workspace deployment to the cloud server.
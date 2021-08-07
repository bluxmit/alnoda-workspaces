"""
Utility to generate docker-compose.yaml file to launch 
static file server using built-in static fileserver tool

python staticserver.py --image="docs:0.1" --domain="elnoda.org" --email="blackmaster@gmail.com" --homepage="doc/pages/home/home/"
"""
import os
import yaml
import shutil
import argparse
import textwrap
import subprocess


def get_workspace_labels(domain, homepage):
    """ Create list of Traefik labels for the Workspace service
    """
    labels = [
        "traefik.enable=true",
        "traefik.http.middlewares.httprepl.redirectregex.regex=^http://(.*)",
        "traefik.http.middlewares.httprepl.redirectregex.replacement=https://$${1}",
        "traefik.http.services.STATICFS_URLhttp.loadbalancer.server.port=8022",
        
        "traefik.http.routers.STATICFS_URLhttp.service=STATICFS_URL",
        "traefik.http.routers.STATICFS_URLhttp.rule=PathPrefix(`/`)",
        "traefik.http.routers.STATICFS_URLhttp.entrypoints=web",
        "traefik.http.routers.STATICFS_URLhttp.middlewares=httprepl",
        
        "traefik.http.services.STATICFS_URL.loadbalancer.server.port=8022",
        "traefik.http.routers.STATICFS_URL.service=STATICFS_URL",
        "traefik.http.routers.STATICFS_URL.entrypoints=websecure",
        "traefik.http.routers.STATICFS_URL.middlewares=basic-auth",
        "traefik.http.routers.STATICFS_URL.tls=true",
        "traefik.http.routers.STATICFS_URL.tls.certresolver=myresolver",
        "traefik.http.routers.STATICFS_URL.middlewares=add-context"
        ]
    varlab = [
        f"traefik.http.routers.STATICFS_URL.rule=Host(`{domain}`)",
        f"traefik.http.middlewares.add-context.redirectregex.replacement=https://$$1/{homepage}",
        "traefik.http.middlewares.add-context.redirectregex.regex=^https:\\/\\/([^\\/]+)\\/?$$"
    ]
    labels.extend(varlab)
    return labels


def get_compose_dict(image, domain, homepage, email):
    """ Create dict of values for docker-compose. This dict is 
    to be transformed into docker-compose.yaml
    """
    traefik_command = [
        "--providers.docker=true",
        "--providers.docker.exposedbydefault=false",
        "--entrypoints.web.address=:80",
        "--entrypoints.websecure.address=:443",
        "--certificatesresolvers.myresolver.acme.tlschallenge=true",
        f"--certificatesresolvers.myresolver.acme.email={email}",
        "--certificatesresolvers.myresolver.acme.storage=/letsencrypt/acme.json"
        ]
    # Create dict with Traefik values
    y = {}
    y["version"] = "3.3"
    y["services"] = {}
    y["services"]["traefik"] = {}
    y["services"]["traefik"]["image"] = "traefik:v2.4" 
    #y["services"]["traefik"]["container_name"] = "trafik_container"
    y["services"]["traefik"]["command"] = traefik_command
    y["services"]["traefik"]["ports"] = [
        "443:443",
        "80:80"
    ]
    y["services"]["traefik"]["volumes"] = [
        "./letsencrypt:/letsencrypt",
        "/var/run/docker.sock:/var/run/docker.sock:ro"
    ]
    y["services"]["workspace"] = {}
    y["services"]["workspace"]["image"] = f"{image}"
    y["services"]["workspace"]["labels"] = get_workspace_labels(domain, homepage)
    return y


def main(cmd_args):
    """ Create YAML file for deployment of static website using 
    static web server
    """
    image = cmd_args.image
    domain = cmd_args.domain
    homepage = cmd_args.homepage
    email = cmd_args.email
    try: 
        os.remove("./docker-compose.yaml")
    except: 
        pass
    comp_dict = get_compose_dict(image, domain, homepage, email)
    with open("./docker-compose.yaml", "a") as y:
        y.write(yaml.dump(comp_dict, default_style='"'))
    return
    

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--image")
    parser.add_argument("--domain")
    parser.add_argument("--email")
    parser.add_argument("--homepage")
    cmd_args = parser.parse_args()
    main(cmd_args)
    
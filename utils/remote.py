"""
Mini-utility to generate docker-compose.yaml file to launch 
workspace on remote server with auth and https (self-signed)

python remote.py --workspace="base-workspace" --port="8020" --host="68.183.69.198" --user="user1" --password="pass1"
"""
import os
import yaml
import shutil
import argparse
import textwrap
import subprocess

# How much tool port is away from the start_port
port_increments = {
    "DOCS_URL": 0,
    "FILEBROWSER_URL": 1,
    "STATICFS_URL": 2,
    "CRONICLE_URL": 3,
    "UNGIT_URL": 4,
    "IDE_URL": 5,
    "TERMINAL_URL": 6,
    "MC_URL": 7,
    "HTOP_URL": 8,
    "ANSIBLE_ARA": 9
    }

workspace_meta = {
    "ubuntu-workspace": {
        "port-range": 10,
        "entrypoints": []
    },
    "base-workspace": {
        "port-range": 10,
        "entrypoints": ["DOCS_URL", "FILEBROWSER_URL", "STATICFS_URL", "CRONICLE_URL", "UNGIT_URL", "TERMINAL_URL", "MC_URL", "HTOP_URL"]
    },
    "workspace-in-docker": {
        "port-range": 15,
        "entrypoints": ["DOCS_URL", "FILEBROWSER_URL", "STATICFS_URL", "CRONICLE_URL", "UNGIT_URL", "IDE_URL", "TERMINAL_URL", "MC_URL", "HTOP_URL"]
    },
    "codeserver-workspace": {
        "port-range": 15,
        "entrypoints": ["DOCS_URL", "FILEBROWSER_URL", "STATICFS_URL", "CRONICLE_URL", "UNGIT_URL", "IDE_URL", "TERMINAL_URL", "MC_URL", "HTOP_URL"]
    },
    "python-workspace": {
        "port-range": 15,
        "entrypoints": ["DOCS_URL", "FILEBROWSER_URL", "STATICFS_URL", "CRONICLE_URL", "UNGIT_URL", "IDE_URL", "TERMINAL_URL", "MC_URL", "HTOP_URL"]
    },
    "mkdocs-magicspace": {
        "port-range": 15,
        "entrypoints": ["DOCS_URL", "FILEBROWSER_URL", "STATICFS_URL", "CRONICLE_URL", "UNGIT_URL", "IDE_URL", "TERMINAL_URL", "MC_URL", "HTOP_URL"]
    },
    "ansible-terraform-workspace": {
        "port-range": 15,
        "entrypoints": ["DOCS_URL", "FILEBROWSER_URL", "STATICFS_URL", "CRONICLE_URL", "UNGIT_URL", "IDE_URL", "TERMINAL_URL", "MC_URL", "HTOP_URL", "ANSIBLE_ARA"]
    }
}


def gen_certs():
    """ Generate self-signed TLS certtificate
    """
    os.mkdir("./remote/certs")
    cmd = 'cd ./remote/certs && openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=workspace.com" -keyout cert.key  -out cert.crt'
    subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read()
    return


def traefik_config():
    conconf = """
    tls:
      certificates:
        - certFile: /tools/certs/cert.crt
          keyFile: /tools/certs/cert.key
    """
    with open("./remote/config.yml", "a") as f:
        f.write(textwrap.dedent(conconf))
    return
    

def calc_entypoints(workspace_name, start_port):
    """ identify which of the port ranges are taken by the internal 
    applications, and which are free. Return list of all entrypoints
    """
    workspace_entrypoints = workspace_meta[workspace_name]["entrypoints"]
    workspace_port_range = workspace_meta[workspace_name]["port-range"]
    end_port = start_port + workspace_port_range
    internal_end_port = 8020 + workspace_port_range
    # Dict of entrypoints of entrypoint name and port
    ep = {entrypoint:port+start_port for entrypoint,port in port_increments.items() if entrypoint in workspace_entrypoints}
    free_ports_start = 8020 + len(ep) + 1
    free_range = list(range(free_ports_start, 8020 + workspace_port_range + 1))
    free_ep = {"PORT_"+str(port):port for port in free_range}
    ep.update(free_ep)
    port_mapping = f"{start_port}-{end_port}:{8020}-{internal_end_port}"
    return ep, port_mapping



def get_workspace_labels(ep, auth_mid_name="basic-auth"):
    """ Create list of Traefik labels for the Workspace service
    """
    labels = [
        "traefik.enable=true",
        "traefik.http.middlewares.httprepl.redirectregex.regex=^http://(.*)",
        "traefik.http.middlewares.httprepl.redirectregex.replacement=https://$${1}"
        ]
    for e,p in ep.items():
        eplabs = [
            f"traefik.http.services.{e}http.loadbalancer.server.port={p}",
            f"traefik.http.routers.{e}http.service={e}",
            f"traefik.http.routers.{e}http.rule=PathPrefix(`/`)",
            f"traefik.http.routers.{e}http.entrypoints={e}",
            f"traefik.http.routers.{e}http.middlewares=httprepl",

            f"traefik.http.services.{e}.loadbalancer.server.port={p}",
            f"traefik.http.routers.{e}.service={e}",
            f"traefik.http.routers.{e}.rule=PathPrefix(`/`)",
            f"traefik.http.routers.{e}.entrypoints={e}",
            f"traefik.http.routers.{e}.middlewares={auth_mid_name}",
            f"traefik.http.routers.{e}.tls=true"
        ]
        labels.extend(eplabs)
    return labels


def make_authlabels(user, password, auth_mid_name="basic-auth"):
    """ Create Traefik label for authentication
    """
    auth_type = "basicauth"
    cmd = f"echo $(echo '{password}' | htpasswd -nB -i {user}) | sed -e s/\\\$/\\\$\\\$/g"
    result = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read() 
    auth = result.decode("utf-8").replace("\n", "")
    authlabel = f"traefik.http.middlewares.{auth_mid_name}.{auth_type}.users={auth}"
    authlabels = [authlabel]
    return authlabels
    

def get_compose_dict(workspace_name, host_ip, start_port, user, password, custom_image=None):
    """ Create dict of values for docker-compose. This dict is 
    to be transformed into docker-compose.yaml
    """
    # Dict of entrypoints of entrypoint name and port
    ep, port_mapping = calc_entypoints(workspace_name, start_port)
    traefik_command = [f"--entrypoints.{entrypoint}.address=:{port}" for entrypoint,port in ep.items()]
    traefik_command += [
        "--providers.docker",
        "--providers.file.directory=/etc/traefik/dynamic_conf"
        ]
    # Create dict with Traefik values
    y = {}
    y["version"] = "3.3"
    y["services"] = {}
    y["services"]["traefik"] = {}
    y["services"]["traefik"]["image"] = "traefik:v2.4" 
    y["services"]["traefik"]["container_name"] = "container_name"
    y["services"]["traefik"]["command"] = traefik_command
    y["services"]["traefik"]["ports"] = [port_mapping]
    y["services"]["traefik"]["volumes"] = [
        "/var/run/docker.sock:/var/run/docker.sock:ro", 
        "./certs:/tools/certs",
        "./config.yml:/etc/traefik/dynamic_conf/conf.yml:ro"
        ]
    # Add Workspace values to the dict
    full_image = f"alnoda/{workspace_name}"
    if custom_image is not None:
        full_image = custom_image
    y["services"]["workspace"] = {}
    y["services"]["workspace"]["image"] = full_image
    y["services"]["workspace"]["environment"] = {
        "WRK_HOST": host_ip, 
        "ENTRY_PORT": start_port,
        "WRK_PROTO": "https",
        "ARA_API_SERVER": f"http://{host_ip}:{start_port + port_increments['ANSIBLE_ARA']}",
        "ARA_API_CLIENT": "https",
        "ARA_CORS_ORIGIN_WHITELIST": f"['https://{host_ip}', 'http://{host_ip}']",
        "ARA_ALLOWED_HOSTS": f"['127.0.0.', 'localhost', '::1', '{host_ip}']",
        "ARA_EXTERNAL_AUTH": "True"
        }
    y["services"]["workspace"]["labels"] = get_workspace_labels(ep)
    # Add auth
    authlabels = make_authlabels(user, password)
    y["services"]["workspace"]["labels"].extend(authlabels)
    return y
    

def main(cmd_args):
    """ Create folder with everything needed to 
    spin up workspace with auth and TLS on remote server
    """
    workspace_name = cmd_args.workspace
    host_ip = cmd_args.host
    start_port = int(cmd_args.port)
    user = cmd_args.user
    password = cmd_args.password
    custom_image = cmd_args.image
    try: 
        shutil.rmtree("./remote")
    except: 
        pass
    os.mkdir("./remote")
    # Generate certificate
    gen_certs()
    # Create Traefik config
    traefik_config()
    # Create docker-compose file
    comp_dict = get_compose_dict(workspace_name, host_ip, start_port, user, password, custom_image)
    with open("./remote/docker-compose.yaml", "a") as y:
        y.write(yaml.dump(comp_dict, default_style='"'))
    return


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--workspace", default="workspace-in-docker")
    parser.add_argument("--port", default=8020)
    parser.add_argument("--host")
    parser.add_argument("--user")
    parser.add_argument("--password")
    parser.add_argument("--image", default=None)
    cmd_args = parser.parse_args()
    main(cmd_args)

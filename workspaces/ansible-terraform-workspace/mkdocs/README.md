<style>
/* These styles apply only to this page! */
  .md-content__button {
    display: none;
    }
  .md-sidebar--secondary{
    display: none !important;
  }
  .md-typeset h1 {
      line-height: 0;
      margin: 0;
      margin-left: -9999px;
  }
  .quickstart-wrapper {
    min-width: 300px;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    padding-left: -50px;
    column-gap: 50px;
    row-gap: 50px;
  }
  .quickstart-wrapper > div {
    flex: 300px;
    max-width: 300px;
  }
  .tool-img{
    box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 5px;
    border-radius: 5px;
    min-width: 300px;
    max-width: 300px;
    max-height: 170px;
    min-height: 170px;
  }
  .tool-caption{
    font-family:  Roboto, Helvetica, sans-serif;
    text-align: center;
    margin-top: 10px;
    font-size:  1.2rem;
    font-weight: bold;

    /* font-size: 1.25em;
    font-weight: 400; */
    letter-spacing: -.02em;
    line-height: 1.5;
  }
  .tool-description{
    font-family:  Helvetica, sans-serif;
    text-align: center;
    margin-top: 10px;
    font-size:  0.7rem;
    font-style: oblique;
    /* font-weight: bold; */
  }
</style>


{% 
    set tools = [
        {
            "env": "IDE_URL",
            "name": "IDE",
            "image": "assets/home/IDE.jpg",
            "description": "Browser-based version of Visual Studio Code. Develop in any language, install hundreeds of extensions"
        },
        {
            "env": "TERMINAL_URL",
            "name": "Terminal",
            "image": "assets/home/Terminal.png",
            "description": "Full-fledged browser-based terminal with Z-shell"
        },
        {
            "env": "FILEBROWSER_URL",
            "name": "File Browser",
            "image": "assets/home/Filebrowser.png",
            "description": "Browse, upload and download files and folders to and from the Workspace"
        },
        {
            "env": "ANSIBLE_ARA",
            "name": "Ansible Ara",
            "image": "assets/home/Ara.png",
            "description": "Monitor for all Ansible plays"
        },
        {
            "env": "TERRAFORM_ROVER",
            "name": "Terraform Rover",
            "image": "assets/home/Terraform-Rover.png",
            "description": "Not started! Start manually with your Terraform project dir, i.e.  <b>cd /home/examples/terraform-scaleway/; terraform init; rover --workingDir /home/examples/terraform-scaleway/</b>"
        },
        {
            "env": "BLAST_RADIUS",
            "name": "Blast Radius",
            "image": "assets/home/Blast-radius.png",
            "description": "Not started! Start manually with your Terraform project dir, i.e.  <b>cd /home/examples/terraform-scaleway; terraform init; blast-radius --serve --port 8030</b>"
        },
        {
            "env": "CRONICLE_URL",
            "name": "Cronicle",
            "image": "assets/home/Cronicle.jpg",
            "description": "Schedule jobs, manage schedules, observe and monitor executions (user/pass - admin/admin)"
        },
        {
            "env": "UNGIT_URL",
            "name": "Ungit",
            "image": "assets/home/Ungit.jpg",
            "description": "Manage Git repositories and work flow using beautiful UI"
        },
        {
            "env": "STATICFS_URL",
            "name": "Static File Server",
            "image": "assets/home/Static-server.png",
            "description": "Serve any static websites like a breeze"
        },
        {
            "env": "MC_URL",
            "name": "M.Commander",
            "image": "assets/home/MC.jpg",
            "description": "Feature rich visual file manager with internal text viewer and editor" 
        },
        {
            "env": "HTOP_URL",
            "name": "Process monitor",
            "image": "assets/home/Htop.jpg",
            "description": "Monitor running process and resource utilization"
        }
        ] 
%}


<div class="quickstart-wrapper">
  {% for tool in tools %}
    {% set tool_url = get_tool_url(tool.env) %}
    <div>
        <a href="{{ tool_url }}" target="_blank" rel="noopener noreferrer">
            <img src="{{ tool.image }}" class="tool-img"/>
        </a>
        <a href="{{ tool_url }}">
            <div class="tool-caption">{{ tool.name }}</div>
        </a>
        <div class="tool-description">{{ tool.description }}</div>
    </div>
  {% endfor %}
</div>






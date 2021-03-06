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
            "env": "JUPYTER_NOTEBOOK_URL",
            "name": "Jupyter Notebooks",
            "image": "assets/home/Jupyter.png",
            "description": "Classic notebook experience. Great for data exploration, analysis and visualisation."
        },
        {
            "env": "JUPYTER_LAB_URL",
            "name": "Jupyter Lab",
            "image": "assets/home/Jupyterlab.png",
            "description": "Notebook development environment. Great for complex notebook projects"
        },
        {
            "env": "DTALE_URL",
            "name": "D-Tale",
            "image": "assets/home/dtale.png",
            "description": "Comprehensive visual exploration, analysis and discovery from dataset files."
        },
        {
            "env": "LUIGI_URL",
            "name": "Luigi",
            "image": "assets/home/luigi.png",
            "description": "Luigi helps you build complex pipelines of batch jobs in Python"
        }
        ] 
%}


<div class="quickstart-wrapper">
  {% for tool in tools %}
    {% set tool_url = get_tool_url(tool.env) %}
    <div>
        {% if tool.subpath is defined %}
            <a href="{{ tool_url }}/{{ tool.subpath }}" target="_blank" rel="noopener noreferrer">
        {% else %}
            <a href="{{ tool_url }}" target="_blank" rel="noopener noreferrer">
        {% endif %}
            <img src="{{ tool.image }}" class="tool-img"/>
        </a>
        <a href="{{ tool_url }}">
            <div class="tool-caption">{{ tool.name }}</div>
        </a>
        <div class="tool-description">{{ tool.description }}</div>
    </div>
  {% endfor %}
</div>






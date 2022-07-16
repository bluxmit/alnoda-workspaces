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
            "env": "PORT_8038",
            "name": "Port 8038",
            "image": "port-8038.png",
            "description": "My app running on port 8038"
        },
        {
            "env": "PORT_8039",
            "name": "Port 8039",
            "image": "port-8039.png",
            "description": "My app running on port 8039"
        },
        {
            "env": "PORT_8040",
            "name": "Port 8040",
            "image": "port-8040.png",
            "description": "My app running on port 8040"
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






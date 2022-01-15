ARG docker_registry=docker.io/alnoda
ARG image_tag=18.04-0.11

FROM ${docker_registry}/workspace-in-docker:${image_tag}

USER root

# Change Theia color theme for this magic workspace to stand out
COPY settings.json /home/abc/.theia/settings.json 
# More dependencies for mkdocs and markdown
COPY mkdocs-requirements.txt /home/abc/installed-python-packages

# Customize mkdocs
COPY ./mkdocs/IDE.jpg /home/docs/docs/pages/home/home/
COPY ./mkdocs/showcase.md /home/docs/docs/showcase.md
COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml
COPY ./mkdocs/home.md /home/docs/docs/pages/home
COPY ./mkdocs/helpers.py /home/docs/macros 
COPY ./mkdocs/Magicspace-web.png /home/docs/docs/pages/home/home/
COPY ./examples/ /home/examples/

RUN apt-get -y update \
	&& echo "-------------------------------------------- weasyprint" \
	&& apt-get install -y build-essential python3-dev python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info \
    && echo "-------------------------------------------- mkdocs plugins" \
    && pip install -r /home/abc/installed-python-packages/mkdocs-requirements.txt \
    && echo "------------------------------------------------------ utils" \
    && rm -rf /home/abc/utils || true \
    && git clone https://github.com/bluxmit/alnoda-workspaces /tmp/alnoda-workspaces \
    && mv /tmp/alnoda-workspaces/utils /home/abc/ \
    && rm -rf /tmp/alnoda-workspaces \  
    && echo "------------------------------------------------------ user" \  
    && chown -R abc /home/examples \
    && chown -R abc /home/abc/utils \
    && chown -R abc /home/abc/installed-python-packages 

USER abc

# Custom docs for this workspace
COPY mkdocs /home/docs
COPY README.md /home/docs/docs/get-started.md
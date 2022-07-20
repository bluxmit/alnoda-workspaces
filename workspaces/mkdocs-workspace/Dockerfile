ARG docker_registry=docker.io/alnoda
ARG image_tag=3.0

FROM ${docker_registry}/ide-workspace:${image_tag}

USER root

# Change Theia color theme for this magic workspace to stand out
COPY settings.json /home/abc/.theia/settings.json 
# More dependencies for mkdocs and markdown
COPY mkdocs-requirements.txt /home/abc/installed-python-packages

COPY ./examples/ /home/examples/

# Customize mkdocs
COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml
COPY ./mkdocs/README.md /home/docs/docs/
COPY ./mkdocs/about.md /home/docs/docs/
COPY ./mkdocs/IDE.jpg /home/docs/docs/assets/home/
COPY ./mkdocs/Magicspace-web.png /home/docs/docs/assets/home/
COPY ./mkdocs/helpers.py /home/docs/macros 
COPY ./mkdocs/alnoda-dark.svg /home/docs/docs/assets/
COPY ./mkdocs/alnoda-white.svg /home/docs/docs/assets/
COPY ./mkdocs/about.md /home/docs/docs/about.md

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
    && chown -R abc /home/abc/installed-python-packages \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

USER abc

# Custom docs for this workspace
COPY mkdocs /home/docs
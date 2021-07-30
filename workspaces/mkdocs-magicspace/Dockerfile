ARG docker_registry=docker.io/alnoda
ARG image_tag=18.04-03

FROM ${docker_registry}/workspace-in-docker:${image_tag}

USER root

# Change Theia color theme for this magic workspace to stand out
COPY settings.json /home/abc/.theia/settings.json 
# More dependencies for mkdocs and markdown
COPY mkdocs-requirements.txt /home/abc/installed-python-packages

RUN apt-get -y update \
	&& echo "-------------------------------------------- weasyprint" \
	&& apt-get install -y build-essential python3-dev python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info \
    && echo "-------------------------------------------- mkdocs plugins" \
    && pip install -r /home/abc/installed-python-packages/mkdocs-requirements.txt    

USER abc

# Custom docs for this workspace
COPY mkdocs /home/docs
COPY README.md /home/docs/docs/get-started.md
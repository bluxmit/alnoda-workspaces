ARG docker_registry=docker.io/alnoda
ARG image_tag=3.0

FROM ${docker_registry}/theia-workspace:${image_tag}
USER root

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml 
COPY ./mkdocs/python-circle.svg /home/docs/docs/assets/
COPY ./mkdocs/python-circle-white.svg /home/docs/docs/assets/
COPY ./mkdocs/extra.css /home/docs/docs/stylesheets/
COPY ./mkdocs/about.md /home/docs/docs/about.md

COPY settings.json /home/abc/.theia/settings.json

COPY python-requirements.txt /home/abc/installed-python-packages

RUN echo "------------------------------------------------------ Packages, Pipx " \
    \ pip install -r /home/abc/installed-python-packages/python-requirements.txt \
    \ python3 -m pip install --user pipx \
    && echo "------------------------------------------------------ user" \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

USER abc







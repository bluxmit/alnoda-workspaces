ARG docker_registry=docker.io/alnoda
ARG image_tag=18.04-0.9

FROM ${docker_registry}/workspace-in-docker:${image_tag}

USER root

COPY python-requirements.txt /home/abc/installed-python-packages
COPY ./examples/ /home/examples/
COPY ./pylintrc /home/abc/

RUN pip install -r /home/abc/installed-python-packages/python-requirements.txt \
    && echo "------------------------------------------------------ graphviz" \
    && apt-get update \
    && apt-get install -y graphviz \
    && apt-get install -y python-pydot python-pydot-ng \
    && echo "------------------------------------------------------ user" \
    && chown -R abc /home/abc/installed-python-packages \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

USER abc
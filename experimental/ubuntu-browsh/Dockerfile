ARG docker_registry=docker.io/alnoda
ARG image_tag=18.04-0.7

FROM ${docker_registry}/ubuntu-workspace:${image_tag}

USER root

RUN apt-get -y update \
    && apt-get install -y firefox \
    && cd /tmp && wget https://github.com/browsh-org/browsh/releases/download/v1.6.4/browsh_1.6.4_linux_amd64.deb \
    && cd /tmp && apt install -y ./browsh_1.6.4_linux_amd64.deb \
    && rm /tmp/browsh_1.6.4_linux_amd64.deb

USER abc
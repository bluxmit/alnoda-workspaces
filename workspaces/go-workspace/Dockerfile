ARG docker_registry=docker.io/alnoda
ARG image_tag=2.0
ARG ruby_global_version=3.1.2

FROM ${docker_registry}/codeserver-workspace:${image_tag}
USER root

COPY docs/getting-started.md /home/docs/docs/getting-started.md

RUN apt-get -y update \
    && echo "------------------------------------------------------ go " \
    && cd /tmp && curl -LO https://go.dev/dl/go1.18.2.linux-amd64.tar.gz \
    && tar -xvf go1.18.2.linux-amd64.tar.gz -C /usr/local \
    && rm /tmp/go1.18.2.linux-amd64.tar.gz \
    && echo "------------------------------------------------------ user" \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

ENV PATH="$PATH:/usr/local/go/bin"
ENV PATH="$PATH:/root/go/bin"
ENV PATH="$PATH:/home/abc/go/bin"

USER abc






ARG docker_registry=docker.io/alnoda
ARG image_tag=18.04-0.6

## Images used:
ARG BUILD_IMAGE=node:12.18.3
ARG DEPLOY_IMAGE=${docker_registry}/base-workspace:${image_tag}


################################################################################ BUILD 

ARG version=latest
FROM ${BUILD_IMAGE} 

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils \
    && apt-get install -y git \
    && mkdir /opt/theia

ARG version=latest
WORKDIR /opt/theia
ADD $version.package.json ./package.json
ARG GITHUB_TOKEN
RUN yarn --pure-lockfile && \
    NODE_OPTIONS="--max_old_space_size=4096" yarn theia build && \
    yarn theia download:plugins && \
    yarn --production && \
    yarn autoclean --init && \
    echo *.ts >> .yarnclean && \
    echo *.ts.map >> .yarnclean && \
    echo *.spec.* >> .yarnclean && \
    yarn autoclean --force && \
    yarn cache clean


################################################################################ IMAGE

FROM ${DEPLOY_IMAGE} 

USER root

RUN mkdir -p -m 777 /opt/theia \
    && cd /opt/theia && nodeenv --node=12.18.3 env && . env/bin/activate \
    && mkdir -p -m 777 /home/project \
    && apt-get install -y libsecret-1-dev \
    && rm -rf /home/docs

COPY --from=0 /opt/theia /opt/theia
COPY settings.json /home/abc/.theia/settings.json
COPY supervisord-theia.conf /etc/supervisord/

COPY mkdocs /home/docs
COPY README.md /home/docs/docs/get-started.md

ENV SHELL=/bin/bash \
    THEIA_DEFAULT_PLUGINS=local-dir:/opt/theia/plugins \ 
    USE_LOCAL_GIT=true \
    HOME=/home/abc \
    PATH="/home/abc/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
    NVM_DIR=/home/abc/.nvm

RUN chown -R abc /opt/theia \
    && mkdir -p /var/log/theia && chown -R abc /var/log/theia \
    && chown -R abc /home/docs \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

USER abc
ARG BUILD_IMAGE=node:16.17.0
ARG MAIN_IMAGE=alnoda/base-devspace:4.0
################################################################################ BUILD THEIA
FROM ${BUILD_IMAGE} 
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils \
    && apt-get install -y git \
    && apt-get install -y libsecret-1-dev \
    && mkdir /opt/theia
WORKDIR /opt/theia
ADD theia_package.json ./package.json
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
################################################################################ WORKSPACE IMAGE
FROM ${MAIN_IMAGE} 

# Theia prep: create folder, node env and install deps
ENV THEIA_DIR="/home/abc/apps/theia"
RUN mkdir "$THEIA_DIR" \
    && cd $THEIA_DIR && nodeenv --node=16.17.0 env && . env/bin/activate \
    && sudo apt-get install -y libsecret-1-dev 
# Copy built Theia from the build image
COPY --from=0 --chown=abc:abc /opt/theia $THEIA_DIR
# Copy Theia settings
COPY --chown=abc:abc theia_settings.json /home/abc/.theia/settings.json
# Set env vars that Theia will use
ENV SHELL=/bin/bash \
    THEIA_DEFAULT_PLUGINS=local-dir:${THEIA_DIR}/plugins \ 
    USE_LOCAL_GIT=true \
    NVM_DIR=/home/abc/.nvm 

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
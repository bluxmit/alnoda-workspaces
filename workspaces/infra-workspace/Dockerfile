ARG docker_registry=docker.io/alnoda
ARG image_tag=18.04-0.7

## Images used:
ARG BUILD_IMAGE=node:12.18.3
ARG DEPLOY_IMAGE=${docker_registry}/workspace-in-docker:${image_tag}

################################################################################ BUILD THEIA (with specific plugins)

ARG THEIA_VERSION=1.15.0
#ARG THEIA_VERSION=latest
#ARG THEIA_VERSION=next
FROM ${BUILD_IMAGE} 

ARG THEIA_VERSION

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils \
    && apt-get install -y git \
    && apt-get install -y libsecret-1-dev \
    && mkdir /opt/theia

WORKDIR /opt/theia
ADD ${THEIA_VERSION}.package.json ./package.json
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

FROM ${DEPLOY_IMAGE} 
USER root

COPY infra-requirements.txt /home/abc/installed-python-packages

# Delete previous Theia & set up new 
RUN rm -rf /opt/theia \
    && mkdir -p -m 777 /opt/theia \
    && cd /opt/theia && nodeenv --node=12.18.3 env && . env/bin/activate \
    && pip install -r /home/abc/installed-python-packages/infra-requirements.txt \
    && python3 -m pip install "ara[server]"

COPY --from=0 /opt/theia /opt/theia
COPY settings.json /home/abc/.theia/settings.json

# Ara 
COPY ara-settings.yaml /home/abc/.ara/server/settings.yaml
ENV ANSIBLE_CALLBACK_PLUGINS="$(python3 -m ara.setup.callback_plugins)" ARA_API_CLIENT="http" ARA_API_SERVER="http://0.0.0.0:8029" ARA_TIME_ZONE="UTC"

RUN echo "------------------------------------------------------ ara" \
    && echo "UTC" > /etc/timezone \
    && mkdir -p /home/abc/.ara/server \
    && ara-manage makemigrations  \
    && ara-manage migrate \
    && echo "------------------------------------------------------ terraform" \
    && cd /tmp && wget https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip \
    && unzip terraform_0.14.6_linux_amd64.zip -d /usr/local/bin \
    && echo "------------------------------------------------------ blast-radius" \
    && apt-get install -y graphviz \
    && echo "------------------------------------------------------ terraform-docs" \
    && cd /tmp && curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v0.15.0/terraform-docs-v0.15.0-linux-amd64.tar.gz \
    && tar -xzf terraform-docs.tar.gz \
    && chmod +x terraform-docs \
    && mv /tmp/terraform-docs /usr/bin/terraform-docs \
    && rm /tmp/terraform-docs.tar.gz \
    && echo "------------------------------------------------------ tflint" \
    && curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash \
    && cd /tmp && curl -Lo /tmp/tfsec https://github.com/aquasecurity/tfsec/releases/download/v0.58.4/tfsec-linux-arm64
    && chmod +x /tmp/tfsec \
    && mv /tmp/tfsec /usr/bin/tfsec \
    && echo "------------------------------------------------------ terrascan" \
    && cd /tmp && curl -Lo ./terrascan.tar.gz https://github.com/accurics/terrascan/releases/download/v1.9.0/terrascan_1.9.0_Linux_x86_64.tar.gz \
    && tar -xf terrascan.tar.gz terrascan && rm terrascan.tar.gz \
    && install terrascan /usr/local/bin && rm terrascan \
    && echo "------------------------------------------------------ mkdocs" \
    
    && echo "------------------------------------------------------ user" \
    && chown -R abc /home/abc/.ara/server \
    && chown -R abc /opt/theia \
    && mkdir -p /var/log/theia && chown -R abc /var/log/theia \
    && chown -R abc /var/log/ara/ \
    && chown -R abc /home/docs \
    && chown -R abc /home/abc/utils \
    && chown -R abc /home/abc/installed-python-packages \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 


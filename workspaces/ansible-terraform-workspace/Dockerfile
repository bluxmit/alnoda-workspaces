ARG docker_registry=docker.io/alnoda
ARG image_tag=18.04-0.11

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
COPY ./examples/ /home/examples/

# Delete previous Theia & set up new 
RUN rm -rf /opt/theia \
    && mkdir -p -m 777 /opt/theia \
    && cd /opt/theia && nodeenv --node=12.18.3 env && . env/bin/activate \
    && pip install -r /home/abc/installed-python-packages/infra-requirements.txt \
    && python3 -m pip install "ara[server]"

COPY --from=0 /opt/theia /opt/theia
COPY settings.json /home/abc/.theia/settings.json
COPY supervisord-infra.conf /etc/supervisord/

# Ara 
COPY ara-settings.yaml /home/abc/.ara/server/settings.yaml
ENV ANSIBLE_CALLBACK_PLUGINS="/usr/local/lib/python3.9/dist-packages/ara/plugins/callback" ARA_API_CLIENT="http" ARA_API_SERVER="http://0.0.0.0:8029" ARA_TIME_ZONE="UTC"

# Customize mkdocs
COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml
COPY ./mkdocs/home.md /home/docs/docs/pages/home
COPY ./mkdocs/Ara.png /home/docs/docs/pages/home/home/
COPY ./mkdocs/Blast-radius.png /home/docs/docs/pages/home/home/
COPY ./mkdocs/Terraform-Rover.png /home/docs/docs/pages/home/home/
COPY ./mkdocs/helpers.py /home/docs/macros 
COPY README.md /home/docs/docs/docs.md

RUN apt-get -y update \
    && echo "------------------------------------------------------ ansible ara" \
    && echo "UTC" > /etc/timezone \
    && mkdir -p /home/abc/.ara/server \
    && ara-manage makemigrations  \
    && ara-manage migrate \
    && echo "------------------------------------------------------ ansible-lint" \
    && pip3 install "ansible-lint[yamllint]" \
    && echo "------------------------------------------------------ terraform" \
    && cd /tmp && wget https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip \
    && unzip terraform_0.14.6_linux_amd64.zip -d /usr/local/bin \
    && rm /tmp/terraform_0.14.6_linux_amd64.zip \
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
    && cd /tmp && curl -Lo /tmp/tfsec https://github.com/aquasecurity/tfsec/releases/download/v0.58.4/tfsec-linux-arm64 \
    && chmod +x /tmp/tfsec \
    && mv /tmp/tfsec /usr/bin/tfsec \
    && echo "------------------------------------------------------ terrascan" \
    && cd /tmp && curl -Lo ./terrascan.tar.gz https://github.com/accurics/terrascan/releases/download/v1.9.0/terrascan_1.9.0_Linux_x86_64.tar.gz \
    && tar -xf terrascan.tar.gz terrascan && rm terrascan.tar.gz \
    && install terrascan /usr/local/bin && rm terrascan \
    && echo "------------------------------------------------------ terraform-visual" \
    && cd /tmp && curl -sL https://deb.nodesource.com/setup_12.x > tflintsetup.sh \
    && bash /tmp/tflintsetup.sh && rm /tmp/tflintsetup.sh \
    && apt-get update \
    && apt-get install -y nodejs \
    && apt-get install -y yarn \
    && npm install -g @terraform-visual/cli \
    && echo "------------------------------------------------------ terraform inframap" \
    && cd /tmp && curl -Lo ./terraform-inframap.tar.gz https://github.com/cycloidio/inframap/releases/download/v0.6.7/inframap-linux-amd64.tar.gz \
    && tar -xzf terraform-inframap.tar.gz && rm terraform-inframap.tar.gz \
    && chmod +x inframap-linux-amd64 \
    && mv inframap-linux-amd64 /usr/bin/inframap \
    && echo "------------------------------------------------------ terraform rover" \
    && cd /tmp && curl -Lo ./terraform-rover.zip https://github.com/im2nguyen/rover/releases/download/v0.1.6/rover_0.1.6_linux_amd64.zip \
    && unzip /tmp/terraform-rover.zip -d /tmp/rover && rm terraform-rover.zip  \
    && mv /tmp/rover/rover_v0.1.6 /tmp/rover/rover \
    && chmod +x /tmp/rover/rover \
    && mv /tmp/rover/rover /usr/bin/rover \
    && rm -rf /tmp/rover \
    && echo "------------------------------------------------------ utils" \
    && rm -rf /home/abc/utils || true \
    && git clone https://github.com/bluxmit/alnoda-workspaces /tmp/alnoda-workspaces \
    && mv /tmp/alnoda-workspaces/utils /home/abc/ \
    && rm -rf /tmp/alnoda-workspaces \
    && echo "alias ansible-report='/home/abc/utils/ansible-report.sh'" >> /home/abc/.zshrc \
    && chmod +x /home/abc/utils/ansible-report.sh && chown abc /home/abc/utils/ansible-report.sh \
    && echo "alias terraform-report='/home/abc/utils/terraform-report.sh'" >> /home/abc/.zshrc \
    && chmod +x /home/abc/utils/terraform-report.sh && chown abc /home/abc/utils/terraform-report.sh \
    && echo "------------------------------------------------------ user" \
    && chown -R abc /home/abc/.ara/server \
    && chown -R abc /opt/theia \
    && mkdir -p /var/log/theia && chown -R abc /var/log/theia \
    && mkdir -p /var/log/ara/ && chown -R abc /var/log/ara/ \
    && chown -R abc /home/docs \
    && chown -R abc /home/abc/utils \
    && chown -R abc /home/abc/installed-python-packages \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

ENV TERRAFORM_ROVER="http://localhost:9000"

USER abc



ARG BUILD_IMAGE=node:16.17.0
ARG MAIN_IMAGE=alnoda/extended-workspace:4.0
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

# Actions for which root escalation is reuired
USER root
# Fix issue with timezone for Ara
RUN echo "UTC" > /etc/timezone
# Install Terraform into /usr/local/bin (Rover requirement)
RUN echo "------------------------------------------------------ terraform" \
    && cd /tmp && wget https://releases.hashicorp.com/terraform/1.2.8/terraform_1.2.8_linux_amd64.zip \
    && unzip terraform_1.2.8_linux_amd64.zip  -d /usr/local/bin \
    && rm /tmp/terraform_1.2.8_linux_amd64.zip 
USER abc

# Replace Theia with the new build, which includes additional pre-installed extensions
# To do this, the existing Theia folder will be deleted, and new copied from the build stage
ENV THEIA_DIR="/home/abc/apps/theia"
RUN rm -rf $THEIA_DIR \
    && mkdir "$THEIA_DIR" \
    && cd $THEIA_DIR && nodeenv --node=16.17.0 env && . env/bin/activate \
# Copy built Theia from the build image
COPY --from=0 --chown=abc:abc /opt/theia $THEIA_DIR
# Copy new Theia settings to set another theme for the code editor
COPY --chown=abc:abc theia_settings.json /home/abc/.theia/settings.json

# Ansible apps & tools
RUN sudo apt-get update \
    && echo "------------------------------------------------------ ansible" \
    && pip install ansible==6.3.0 \
    && pip install cffi==1.15.1 \
    && echo "------------------------------------------------------ ansible-ara" \
    && pip install ara==1.5.8 \
    && pip install "ara[server]" \
    && mkdir -p /home/abc/.ara/server \
    && ara-manage makemigrations \
    && ara-manage migrate \
    && echo "------------------------------------------------------ ansible-lint" \
    && pipx install "ansible-lint[yamllint]" \
    && echo "------------------------------------------------------ ansible-doctor" \
    && pipx install ansible-doctor==1.4.3 \
    && echo "------------------------------------------------------ ansible-playbook-grapher" \
    && pipx install ansible-playbook-grapher==1.2.0 \
    && echo "------------------------------------------------------ ansible-inventory-grapher" \
    && pipx install ansible-inventory-grapher==2.5.0 \
    && echo "------------------------------------------------------ ansible-cmdb" \
    && pipx install ansible-cmdb==1.31

# Ansible Ara setup
COPY --chown=abc:abc ara-settings.yaml /home/abc/.ara/server/settings.yaml
ENV ANSIBLE_CALLBACK_PLUGINS="/home/abc/.local/lib/python3.8/site-packages/ara/plugins/callback" \
    ARA_API_CLIENT="http" \
    ARA_API_SERVER="http://0.0.0.0:8032" \
    ARA_TIME_ZONE="UTC"

# Terraform apps & tools 
RUN echo "------------------------------------------------------ blast-radius" \
    && sudo apt-get install -y graphviz \
    && pipx install blastradius==0.1.23 \
    && echo "------------------------------------------------------ terraform-docs" \
    && cd /tmp && curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v0.15.0/terraform-docs-v0.15.0-linux-amd64.tar.gz \
    && tar -xzf terraform-docs.tar.gz \
    && chmod +x terraform-docs \
    && mv /tmp/terraform-docs /home/abc/.local/bin/terraform-docs \
    && rm /tmp/terraform-docs.tar.gz \
    && echo "------------------------------------------------------ tflint" \
    && cd /tmp && wget https://github.com/terraform-linters/tflint/releases/download/v0.39.3/tflint_linux_amd64.zip \
    && unzip /tmp/tflint_linux_amd64.zip -d /home/abc/.local/bin \
    && echo "------------------------------------------------------ tfsec" \
    && cd /tmp && curl -Lo /tmp/tfsec https://github.com/aquasecurity/tfsec/releases/download/v1.27.5/tfsec-checkgen-linux-amd64 \
    && chmod +x /tmp/tfsec \
    && mv /tmp/tfsec /home/abc/.local/bin/tfsec \
    && echo "------------------------------------------------------ terrascan" \
    && cd /tmp && curl -Lo ./terrascan.tar.gz https://github.com/tenable/terrascan/releases/download/v1.15.2/terrascan_1.15.2_Linux_x86_64.tar.gz \
    && tar -xf terrascan.tar.gz terrascan && rm terrascan.tar.gz \
    && install terrascan /home/abc/.local/bin && rm /tmp/terrascan \
    && echo "------------------------------------------------------ terraform inframap" \
    && cd /tmp && curl -Lo ./terraform-inframap.tar.gz https://github.com/cycloidio/inframap/releases/download/v0.6.7/inframap-linux-amd64.tar.gz \
    && tar -xzf terraform-inframap.tar.gz && rm terraform-inframap.tar.gz \
    && chmod +x inframap-linux-amd64 \
    && mv inframap-linux-amd64 /home/abc/.local/bin/inframap \
    && echo "------------------------------------------------------ terraform rover" \
    && cd /tmp && curl -Lo ./terraform-rover.zip https://github.com/im2nguyen/rover/releases/download/v0.3.3/rover_0.3.3_linux_amd64.zip \
    && unzip /tmp/terraform-rover.zip -d /tmp/rover && rm /tmp/terraform-rover.zip  \
    && mv /tmp/rover/rover_v0.3.3 /tmp/rover/rover \
    && chmod +x /tmp/rover/rover \
    && mv /tmp/rover/rover /home/abc/.local/bin/rover \
    && rm -rf /tmp/rover

# # Rover configuration
# ENV TERRAFORM_ROVER="http://localhost:9000" 

# Copy Ansible & Terraform report scripts
COPY --chown=abc:abc extra/ansible-report.sh /home/abc/.local/bin/
COPY --chown=abc:abc extra/terraform-report.sh /home/abc/.local/bin/

# Copy Ansible & Terraform examples
COPY --chown=abc:abc ./examples/ /home/examples/

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
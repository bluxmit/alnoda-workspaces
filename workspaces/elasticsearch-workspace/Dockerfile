
ARG docker_registry=docker.io/alnoda
ARG image_tag=2.2

FROM ${docker_registry}/ide-workspace:${image_tag}
USER root

COPY settings.json /home/abc/.theia/settings.json

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml 

RUN apt-get -y update \
    # && echo "------------------------------------------------------ utils" \
    # && rm -rf /home/abc/utils || true \
    # && git clone https://github.com/bluxmit/alnoda-workspaces /tmp/alnoda-workspaces \
    # && mv /tmp/alnoda-workspaces/utils /home/abc/ \
    # && rm -rf /tmp/alnoda-workspaces \
    && echo "------------------------------------------------------ nodejs-17" \
    && curl -fsSL https://deb.nodesource.com/setup_17.x | bash - \
    && apt-get install -y nodejs \
    && echo "------------------------------------------------------ esbulk" \
    && cd /tmp && wget https://github.com/miku/esbulk/releases/download/v0.7.5/esbulk_0.7.5_amd64.deb \
    && apt install /tmp/esbulk_0.7.5_amd64.deb \
    && rm /tmp/esbulk_0.7.5_amd64.deb \
    && echo "------------------------------------------------------ elasticsearch-dump" \
    && npm install -g elasticdump@6.79.3 \
    && echo "------------------------------------------------------ vulkanizer" \
    && cd /tmp && wget https://github.com/github/vulcanizer/releases/download/v0.8.0/vulcanizer_0.8.0_Linux_i386.tar.gz \
    && tar -xzf /tmp/vulcanizer_0.8.0_Linux_i386.tar.gz \
    && chmod +x /tmp/vulcanizer \
    && mv /tmp/vulcanizer /usr/bin/vulcanizer \
    && rm /tmp/vulcanizer_0.8.0_Linux_i386.tar.gz \
    && echo "------------------------------------------------------ user" \
    && chown -R abc /home/docs \
    && chown -R abc /home/abc/utils \
    && chown -R abc /home/abc/installed-python-packages \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 
    
USER abc




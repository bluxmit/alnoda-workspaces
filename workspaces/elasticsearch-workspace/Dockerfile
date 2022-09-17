FROM alnoda/extended-workspace:4.0

# Install Node and elasticdump as root
USER root
RUN echo "------------------------------------------------------ nodejs-18" \
    && curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash - \
    && sudo apt-get install -y nodejs \
    && npm install -g npm@8.7.0 \
    && echo "------------------------------------------------------ elasticsearch-dump" \
    && npm install elasticdump@6.88.0 -g 
# Switch back to abc user and continue
USER abc

RUN sudo apt-get -y update \
    && echo "------------------------------------------------------ esbulk" \
    && cd /tmp && wget https://github.com/miku/esbulk/releases/download/v0.7.5/esbulk_0.7.5_amd64.deb \
    && sudo apt-get install /tmp/esbulk_0.7.5_amd64.deb \
    && rm /tmp/esbulk_0.7.5_amd64.deb \
    && echo "------------------------------------------------------ vulkanizer" \
    && cd /tmp && wget https://github.com/github/vulcanizer/releases/download/v0.8.0/vulcanizer_0.8.0_Linux_i386.tar.gz \
    && tar -xzf /tmp/vulcanizer_0.8.0_Linux_i386.tar.gz \
    && chmod +x /tmp/vulcanizer \
    && mv /tmp/vulcanizer /home/abc/.local/bin/vulcanizer \
    && rm /tmp/vulcanizer_0.8.0_Linux_i386.tar.gz 
    
# Change default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
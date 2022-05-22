
ARG docker_registry=docker.io/alnoda
ARG image_tag=2.1

FROM ${docker_registry}/codeserver-workspace:${image_tag}
USER root

COPY docs/getting-started.md /home/docs/docs/getting-started.md

RUN apt-get -y update \
    && echo "------------------------------------------------------ system nodejs-18" \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - \
    && apt-get install -y nodejs \
    && npm install --global yarn \
    && echo "------------------------------------------------------ nvm (root)" \
    && wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> /root/.zshrc \
    && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> /root/.zshrc \
    && echo "------------------------------------------------------ user" \
    && find /home -type d | xargs -I{} chown -R abc {} 
    
USER abc

RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> /home/abc/.zshrc \
    && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> /home/abc/.zshrc


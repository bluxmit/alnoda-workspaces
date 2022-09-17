FROM alnoda/codeserver-workspace:4.0

USER root
RUN sudo apt-get -y update \
    && echo "------------------------------------------------------ system nodejs-18" \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && sudo apt-get install -y nodejs \
    && npm install --global yarn \
    && echo "------------------------------------------------------ user" \
    && chown abc /usr/lib/node_modules \
    && find /usr/lib/node_modules -type f | xargs -I{} chown abc {} 
USER abc

RUN echo "------------------------------------------------------ nvm" \
    && wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> /home/abc/.zshrc \
    && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> /home/abc/.zshrc

# Create node environment & install Static file server 
ENV STATIC_FILESERVER_DIR="/home/abc/apps/static-file-server"
RUN echo "------------------------------------------------------ Static file server" \
    && mkdir /home/static-server \
	&& mkdir -p $STATIC_FILESERVER_DIR \
	&& cd $STATIC_FILESERVER_DIR && nodeenv --node=16.17.0 --npm=6.0.0 env \
	&& cd $STATIC_FILESERVER_DIR && . env/bin/activate &&  npm install -g serve@14.0.1 

# Install additional codeserver extensions 
RUN echo "------------------------------------------------------ extensions" \
    && code-server --install-extension  bradlc.vscode-tailwindcss \
    && code-server --install-extension  anseki.vscode-color \
    && code-server --install-extension  christian-kohler.npm-intellisense \
    && code-server --install-extension  xabikos.JavaScriptSnippets \
    && code-server --install-extension  kumar-harsh.graphql-for-vscode

# Change default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
FROM alnoda/codeserver-workspace:4.0

RUN echo "------------------------------------------------------ nvm" \
    && wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> /home/abc/.zshrc \
    && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> /home/abc/.zshrc 

ENV NVM_DIR="/home/abc/.nvm" \
    NODE_VERSION="18.9.0"

RUN echo "------------------------------------------------------ node, npm" \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# Install additional codeserver extensions 
RUN echo "------------------------------------------------------ extensions" \
    && code-server --install-extension  bradlc.vscode-tailwindcss \
    && code-server --install-extension  anseki.vscode-color \
    && code-server --install-extension  christian-kohler.npm-intellisense \
    && code-server --install-extension  xabikos.JavaScriptSnippets \
    && code-server --install-extension  dbaeumer.vscode-eslint \
    && code-server --install-extension  kumar-harsh.graphql-for-vscode

# Change default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
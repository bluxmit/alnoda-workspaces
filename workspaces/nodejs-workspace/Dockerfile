FROM alnoda/codeserver-workspace:5.0

RUN wrk install nvm==0.39.1

ENV NVM_DIR="/home/abc/.nvm" \
    NODE_VERSION="18.9.0"

RUN echo "------------------------------------------------------ node, npm" \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# Install additional Nodejs-specific codeserver extensions 
RUN echo "------------------------------------------------------ extensions" \
    && code-server --install-extension  bradlc.vscode-tailwindcss \
    && code-server --install-extension  anseki.vscode-color \
    && code-server --install-extension  christian-kohler.npm-intellisense \
    && code-server --install-extension  xabikos.JavaScriptSnippets \
    && code-server --install-extension  dbaeumer.vscode-eslint \
    && code-server --install-extension  kumar-harsh.graphql-for-vscode

# Change default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
FROM alnoda/base-devspace:4.0

# Set environmental variables for Code-server
ARG CODESERVER_VERSION="4.7.0"

USER root
RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf
USER abc

# Install Code-server 
RUN echo "------------------------------------------------------ code-server" \
	&& cd \tmp \
    && curl -fOL https://github.com/coder/code-server/releases/download/v$CODESERVER_VERSION/code-server_${CODESERVER_VERSION}_amd64.deb \
    && sudo dpkg -i code-server_${CODESERVER_VERSION}_amd64.deb \
    && rm /tmp/code-server_${CODESERVER_VERSION}_amd64.deb 

# Install codeserver extensions 
RUN echo "------------------------------------------------------ common extensions" \
    && code-server --install-extension  mhutchie.git-graph \
    && code-server --install-extension  redhat.vscode-yaml \
    && code-server --install-extension  mechatroner.rainbow-csv \
    && code-server --install-extension  formulahendry.auto-close-tag \
    && code-server --install-extension  formulahendry.auto-rename-tag \
    && code-server --install-extension  anteprimorac.html-end-tag-labels \
    && code-server --install-extension  abusaidm.html-snippets \
    && code-server --install-extension  sndst00m.vscode-native-svg-preview \
    && code-server --install-extension  pranaygp.vscode-css-peek \
    && code-server --install-extension  anseki.vscode-color \
    && echo "------------------------------------------------------ themes" \
    && code-server --install-extension  armandphilippot.coldark \
    && code-server --install-extension  RobbOwen.synthwave-vscode \
    && code-server --install-extension  nadim-vscode.infinity-dark-theme \
    && code-server --install-extension  emroussel.atomize-atom-one-dark-theme \
    && code-server --install-extension  teabyii.ayu \
    && code-server --install-extension  wesbos.theme-cobalt2 \
    && code-server --install-extension  github.github-vscode-theme \
    && code-server --install-extension  armandphilippot.coldark \
    && code-server --install-extension  radiolevity.search-lights 
    && code-server --install-extension  vladeeg.vscode-theme-vlight \
    && code-server --install-extension  akamud.vscode-theme-onelight \
    && code-server --install-extension  akamud.vscode-theme-onedark \
    && code-server --install-extension  rubjo.ultimate-dark-neo \
    && code-server --install-extension  sainnhe.edge \
    && code-server --install-extension  lakshitsomani.best-themes-redefined \
    && code-server --install-extension  usernamehw.prism \
    && echo "------------------------------------------------------ icons" \
    && code-server --install-extension  emroussel.atom-icons \
    && code-server --install-extension  laurenttreguier.vscode-simple-icons 

# Set default codeserver terminal
ENV SHELL=/bin/zsh

# Set default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
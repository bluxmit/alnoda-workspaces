FROM alnoda/codeserver-workspace:5.0

RUN wrk install pyenv
RUN wrk install poetry

# Install additional codeserver extensions for Python
RUN echo "------------------------------------------------------ extensions" \
    && code-server --install-extension  ms-python.python \
    && code-server --install-extension  samuelcolvin.jinjahtml 

# Change default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace

FROM alnoda/codeserver-workspace:5.0

RUN wrk install cronicle==0.9.10 admin
RUN wrk install elasticdump
RUN wrk install esbulk
RUN wrk install vulcanizer

# Install codeserver extension
RUN code-server --install-extension  ria.elastic
# Change default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Configure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
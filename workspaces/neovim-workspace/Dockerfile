FROM alnoda/alnoda-workspace:1.1

RUN wrk install neovim-ide==0.8.0

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
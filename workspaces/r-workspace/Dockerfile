FROM alnoda/openvscode-workspace:1.0

RUN wrk install r
RUN wrk install rstudio
RUN wrk install jupyterlab
RUN wrk install jupyterlab-r
RUN wrk install radian

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
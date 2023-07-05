FROM alnoda/openvscode-workspace:1.0

RUN wrk install rust

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
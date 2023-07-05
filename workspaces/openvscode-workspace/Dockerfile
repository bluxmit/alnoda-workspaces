FROM alnoda/alnoda-workspace:1.1

RUN wrk install openvscode==1.76.2

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
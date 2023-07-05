FROM alnoda/alnoda-workspace:1.1

RUN wrk install spacevim==v2.1.0

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace

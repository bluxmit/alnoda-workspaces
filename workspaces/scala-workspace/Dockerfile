FROM alnoda/java-workspace:5.0-17

RUN wrk install scala==2.12.15

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace

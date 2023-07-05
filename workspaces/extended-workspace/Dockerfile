FROM alnoda/alnoda-workspace:1.1

RUN wrk install bluxmit==1
RUN wrk install dcp==2
RUN wrk install cronicle==0.9.10 admin

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
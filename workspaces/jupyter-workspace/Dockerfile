FROM alnoda/alnoda-workspace:1.1

RUN wrk install jupyterlab==4.0.0
RUN wrk install jupyter-python==1
RUN wrk install nbclient==0.8.0
RUN wrk install euporie==2.0.0
RUN wrk install jut==0.0.24
RUN wrk install nbpreview==0.9.1
RUN wrk install nbterm==0.0.13
RUN wrk install papermill==2.4.0
RUN wrk install jupytext==1.14.7

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
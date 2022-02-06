ARG docker_registry=docker.io/alnoda
ARG image_tag=0.1

FROM ${docker_registry}/postgres-workspace:${image_tag}

USER root

RUN echo "------------------------------------------------------ yugabyte 2.11" \
    && cd /tmp/ && wget https://downloads.yugabyte.com/releases/2.11.0.0/yugabyte-2.11.0.0-b7-linux-x86_64.tar.gz \
    && tar xvfz /tmp/yugabyte-2.11.0.0-b7-linux-x86_64.tar.gz \
    && mv /tmp/yugabyte-2.11.0.0/ /opt/yugabyte \
    && /opt/yugabyte/bin/post_install.sh \
    && echo "------------------------------------------------------ tpcc" \
    && cd /tmp && wget https://github.com/yugabyte/tpcc/releases/download/2.0/tpcc.tar.gz \
    && tar -zxvf /tmp/tpcc.tar.gz \
    && chmod +x /tmp/tpcc/tpccbenchmark \
    && mv /tmp/tpcc /opt/tpcc \
    && echo "------------------------------------------------------ Yugabyte workload generator" \
    && mkdir /opt/yugabyte-workload-gen \
    && cd /opt/yugabyte-workload-gen && wget https://github.com/yugabyte/yb-sample-apps/releases/download/1.3.9/yb-sample-apps.jar \
    && echo "------------------------------------------------------ user" \
    && chown -R abc /opt/yugabyte \
    && chown -R abc /opt/tpcc \
    && chown -R abc /opt/yugabyte-workload-gen

ENV PATH="/opt/yugabyte/bin:/opt/yugabyte/postgres/bin:${PATH}"

USER abc

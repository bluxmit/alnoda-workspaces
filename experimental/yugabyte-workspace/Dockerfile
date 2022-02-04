ARG docker_registry=docker.io/alnoda
ARG image_tag=0.1

FROM ${docker_registry}/postgres-workspace:${image_tag}

USER root

RUN echo "------------------------------------------------------ yugabyte 2.11" \
    && cd /tmp/ && wget https://downloads.yugabyte.com/releases/2.11.0.0/yugabyte-2.11.0.0-b7-linux-x86_64.tar.gz \
    && tar xvfz /tmp/yugabyte-2.11.0.0-b7-linux-x86_64.tar.gz \
    && mv /tmp/yugabyte-2.11.0.0/ /opt/yugabyte \
    && /opt/yugabyte/bin/post_install.sh \
    && echo "------------------------------------------------------ user" \
    && chown -R abc /opt/yugabyte

ENV PATH="/opt/yugabyte/bin:/opt/yugabyte/postgres/bin:${PATH}"

USER abc

ARG docker_registry=docker.io/alnoda
ARG image_tag=2.2-17

FROM ${docker_registry}/java-workspace:${image_tag}
USER root

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml

RUN apt-get -y update \
    && echo "------------------------------------------------------ Erlang requirements" \
    && apt-get -y install build-essential autoconf libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev \
    && echo "------------------------------------------------------ Kerl" \
    && cd /tmp && curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl \
    && chmod a+x kerl \
    && mv /tmp/kerl /usr/bin/ \
    && kerl update releases \
    && echo "------------------------------------------------------ user" \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

USER abc

RUN echo "------------------------------------------------------ Erlang/OTP (user) " \
    && kerl build 25.0 25.0 \
    && kerl install 25.0 /home/abc/erlang/25.0 \
    && export PATH="$PATH:/home/abc/erlang/25.0/bin" \
    && echo "------------------------------------------------------ Kiex, Elixir (user) " \
    && curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s \
    && export "PATH=$PATH:/home/abc/.kiex/bin" \
    && kiex install 1.13.4 

ENV PATH="$PATH:/home/abc/erlang/25.0/bin"
ENV PATH="$PATH:/home/abc/.kiex/bin"
ENV PATH="$PATH:/home/abc/.kiex/elixirs/elixir-1.13.4/bin"

ARG docker_registry=docker.io/alnoda
ARG image_tag=2.0

FROM ${docker_registry}/codeserver-workspace:${image_tag}
USER root

COPY docs/getting-started.md /home/docs/docs/getting-started.md

RUN apt-get -y update \
    && echo "------------------------------------------------------ rbenv (root) " \
    && wget -q https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer -O- | bash \
    && echo 'PATH="/home/abc/.rbenv/bin:$PATH"' >> /root/.zshrc \
    && echo "------------------------------------------------------ ruby (system) " \
    && apt-get install -y build-essential libssl-dev libyaml-dev zlib1g-dev libffi-dev \
    && /root/.rbenv/bin/rbenv install 3.1.2

USER abc

RUN echo "------------------------------------------------------ rbenv (abc) " \
    && wget -q https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer -O- | bash \
    && echo 'PATH="/home/abc/.rbenv/bin:$PATH"' >> /home/abc/.zshrc 




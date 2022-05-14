ARG docker_registry=docker.io/alnoda
ARG image_tag=2.0

FROM ${docker_registry}/codeserver-workspace:${image_tag}
USER root

COPY docs/getting-started.md /home/docs/docs/getting-started.md

RUN apt-get -y update \
    && echo "------------------------------------------------------ rbenv (root) " \
    && wget -q https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer -O- | bash \
    && echo 'PATH="/root/.rbenv/bin:$PATH"' >> /root/.zshrc \
    && echo 'eval "$(rbenv init -)"' >> /root/.zshrc \
    && export PATH="/root/.rbenv/bin:$PATH" \
    && echo "------------------------------------------------------ ruby (system global) " \
    && apt-get install -y build-essential libssl-dev libyaml-dev zlib1g-dev libffi-dev \
    && rbenv install 3.1.2 \
    && rbenv global 3.1.2 \
    && /root/.rbenv/shims/gem install bundler \
    && echo "------------------------------------------------------ user" \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

USER abc

RUN echo "------------------------------------------------------ rbenv (abc) " \
    && wget -q https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer -O- | bash \
    && echo 'PATH="/home/abc/.rbenv/bin:$PATH"' >> /home/abc/.zshrc \
    && echo 'eval "$(rbenv init -)"' >> /home/abc/.zshrc \
    && export PATH="/home/abc/.rbenv/bin:$PATH" \
    && rbenv install 3.1.2 \
    && rbenv global 3.1.2 \
    && /home/abc/.rbenv/shims/gem install bundler




ARG docker_registry=docker.io/alnoda
ARG image_tag=3.0

FROM ${docker_registry}/theia-workspace:${image_tag}
USER root

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml 
COPY ./mkdocs/ruby-circle.svg /home/docs/docs/assets/
COPY ./mkdocs/ruby-circle-white.svg /home/docs/docs/assets/
COPY ./mkdocs/extra.css /home/docs/docs/stylesheets/
COPY ./mkdocs/about.md /home/docs/docs/about.md

RUN apt-get -y update \
    && export HOME="/root" \
    && echo "------------------------------------------------------ rbenv (root) " \
    && wget -q https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer -O- | bash \
    && echo 'PATH="$HOME/.rbenv/bin:$PATH"' >> /root/.zshrc \
    && echo 'eval "$(rbenv init -)"' >> /root/.zshrc \
    && export PATH="$HOME/.rbenv/bin:$PATH" \
    && echo "------------------------------------------------------ ruby (system global) " \
    && apt-get install -y build-essential libssl-dev libyaml-dev zlib1g-dev libffi-dev \
    && rbenv install 3.1.2 \
    && rbenv global 3.1.2 \
    && $HOME/.rbenv/shims/gem install bundler \
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




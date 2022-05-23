ARG docker_registry=docker.io/alnoda
ARG image_tag=2.2

FROM ${docker_registry}/codeserver-workspace:${image_tag}
USER root

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml

RUN apt-get -y update \
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > /tmp/rustup.sh \
    && echo "------------------------------------------------------ rust (root) " \
    && echo 'CARGO_HOME="/root/.cargo/bin"' >> /root/.zshrc \
    && echo 'RUSTUP_HOME="/root/.rustup"' >> /root/.zshrc \
    && export PATH="/root/.cargo/bin:/root/.rustup/bin:$PATH" \
    && sh /tmp/rustup.sh -y \
    && echo "------------------------------------------------------ shell autocompetion (root) " \
    && mkdir /root/.zfunc \
    && rustup completions zsh > /root/.zfunc/_rustup \
    && echo 'fpath+=~/.zfunc' >> /root/.zshrc

USER abc

RUN echo "------------------------------------------------------ rust (abc) " \
    && echo 'CARGO_HOME="/home/abc/.cargo/bin"' >> /home/abc/.zshrc \
    && echo 'RUSTUP_HOME="/home/abc/.rustup"' >> /home/abc/.zshrc \
    && export PATH="/home/abc/.cargo/bin:/home/abc/.rustup/bin:$PATH" \
    && sh /tmp/rustup.sh -y 





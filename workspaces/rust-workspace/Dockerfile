ARG docker_registry=docker.io/alnoda
ARG image_tag=3.0

FROM ${docker_registry}/theia-workspace:${image_tag}
USER root

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml 
COPY ./mkdocs/rust.svg /home/docs/docs/assets/
COPY ./mkdocs/rust-white.svg /home/docs/docs/assets/
COPY ./mkdocs/extra.css /home/docs/docs/stylesheets/
COPY ./mkdocs/about.md /home/docs/docs/about.md

RUN apt-get -y update \
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > /tmp/rustup.sh \
    && echo "------------------------------------------------------ rust (root) " \
    && echo 'CARGO_HOME="/root/.cargo/bin"' >> /root/.zshrc \
    && echo 'RUSTUP_HOME="/root/.rustup"' >> /root/.zshrc \
    && export PATH="/root/.cargo/bin:/root/.rustup/bin:$PATH" 
RUN sh /tmp/rustup.sh -y \
    && echo "------------------------------------------------------ user" \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

USER abc

RUN echo "------------------------------------------------------ rust (abc) " \
    && echo 'CARGO_HOME="/home/abc/.cargo/bin"' >> /home/abc/.zshrc \
    && echo 'RUSTUP_HOME="/home/abc/.rustup"' >> /home/abc/.zshrc \
    && export PATH="/home/abc/.cargo/bin:/home/abc/.rustup/bin:$PATH" \
    && sh /tmp/rustup.sh -y 





ARG docker_registry=docker.io/alnoda
ARG image_tag=2.2-17

FROM ${docker_registry}/java-workspace:${image_tag}
USER root

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml

RUN echo "------------------------------------------------------ coursier" \
    && cd /tmp && curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs \
    && chmod +x /tmp/cs \
    && mv /tmp/cs /usr/bin/ \
    && echo "------------------------------------------------------ user" \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 
    
ENV PATH="$PATH:/home/abc/.local/share/coursier/bin"
ENV PATH="$PATH:/home/abc/.local/share/coursier/bin"

USER abc

RUN echo "------------------------------------------------------ coursier (user) " \
    && cs setup




ARG docker_registry=docker.io/alnoda
ARG image_tag=3.0

FROM ${docker_registry}/base-devspace:${image_tag}

USER root

COPY supervisord-codeserver.conf /etc/supervisord/

COPY ./mkdocs/ /home/docs/

RUN echo "------------------------------------------------------ code-server" \
	&& apt-get install -y build-essential pkg-config \
    && mkdir -p /opt/codeserver \
	&& cd /opt/codeserver && nodeenv --node=16.15.0 --npm=1.0.10 env \
	&& cd /opt/codeserver && . env/bin/activate &&  npm install -g yarn && yarn global add code-server@4.4.0 \
	&& mkdir -p /home/project \
	&& mkdir /opt/codeserver/data \
	&& mkdir -p mkdir /opt/vscode/extensions \ 
	&& mkdir -p /var/log/codeserver \
    && echo "------------------------------------------------------ utils" \
    && rm -rf /home/abc/utils || true \
    && git clone https://github.com/bluxmit/alnoda-workspaces /tmp/alnoda-workspaces \
    && mv /tmp/alnoda-workspaces/utils /home/abc/ \
    && rm -rf /tmp/alnoda-workspaces \
	&& echo "------------------------------------------------------ user" \
	&& chown -R abc /home/project \
	&& chown -R abc /opt/codeserver \
    && chown -R abc /var/log/codeserver \
    && chown -R abc  /opt/vscode \
    && chown -R abc /home/docs \
    && chown -R abc /home/abc/utils \
    && chown -R abc /home/abc/installed-python-packages \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

USER abc  

COPY code-server-run.sh /opt/codeserver/code-server-run.sh 





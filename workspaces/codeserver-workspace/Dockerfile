ARG docker_registry=docker.io/alnoda
ARG image_tag=2.2

FROM ${docker_registry}/base-workspace:${image_tag}

USER root

COPY supervisord-codeserver.conf /etc/supervisord/

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml 
COPY ./mkdocs/helpers.py /home/docs/macros
COPY ./mkdocs/IDE.jpg /home/docs/docs/assets/home/
COPY ./mkdocs/README.md /home/docs/docs/README.md

RUN echo "------------------------------------------------------ code-server" \
	&& apt-get install -y build-essential pkg-config \
    && mkdir -p -m 777 /opt/codeserver \
	&& cd /opt/codeserver && nodeenv --node=16.15.0 --npm=1.0.10 env \
	&& cd /opt/codeserver && . env/bin/activate &&  npm install -g yarn && yarn global add code-server@4.4.0 \
	&& mkdir -p -m 777 /home/project \
	&& mkdir -p -m 777 /opt/codeserver/data \
	&& mkdir -p -m 777 mkdir /opt/vscode/extensions \ 
	&& mkdir -p -m 777 /var/log/codeserver \
    && echo "------------------------------------------------------ utils" \
    && rm -rf /home/abc/utils || true \
    && git clone https://github.com/bluxmit/alnoda-workspaces /tmp/alnoda-workspaces \
    && mv /tmp/alnoda-workspaces/utils /home/abc/ \
    && rm -rf /tmp/alnoda-workspaces \
	&& echo "------------------------------------------------------ user" \
	&& chown -R abc /home/project \
	&& chown -R abc /opt/codeserver \
    && chown -R abc  /opt/vscode \
    && chown -R abc /home/docs \
    && chown -R abc /home/abc/utils \
    && chown -R abc /home/abc/installed-python-packages \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

USER abc  

COPY code-server-run.sh /opt/codeserver/code-server-run.sh 





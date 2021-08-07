ARG docker_registry=docker.io/alnoda
ARG image_tag=18.04-0.7

FROM ${docker_registry}/ubuntu-workspace:${image_tag}

USER root

################################################################# TOOLS: cronicle, filebrowser, ungit, static server


COPY Cronicle-0.8.61 /opt/cronicle

RUN echo "------------------------------------------------------ cronicle" \
	&& mkdir -p /opt/cronicle \
	&& cd /opt/cronicle && nodeenv --node=12.18.3 --npm=6.0.0 env \
	&& cd /opt/cronicle && . env/bin/activate && npm install; node bin/build.js dist

COPY cronicle-config.json /opt/cronicle/conf/config.json
COPY supervisord-workspace-base.conf /etc/supervisord/
COPY filebrowser.json /opt/filebrowser/.filebrowser.json

COPY mkdocs /home/docs
COPY README.md /home/docs/docs/docs.md
COPY mkdocs-requirements.txt /home/abc/installed-python-packages/mkdocs-requirements.txt

RUN echo "------------------------------------------------------ filebrowser, ungit, static server" \
	&& apt-get -y update \
	&& mkdir -p -m 777 /opt/filebrowser \
	&& curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash \
	&& apt-get install -y ssh net-tools --no-install-recommends \
	&& mkdir -p /opt/ungit \
	&& cd /opt/ungit && nodeenv --node=12.18.3 --npm=6.0.0 env \
	&& cd /opt/ungit && . env/bin/activate && npm install -g ungit@1.5.9 \
	&& mkdir -p /opt/serve \
	&& cd /opt/serve && nodeenv --node=12.18.3 --npm=6.0.0 env \
	&& cd /opt/serve && . env/bin/activate &&  npm install -g serve \
    && echo "------------------------------------------------------ mkdocs" \
	&& pip install -r /home/abc/installed-python-packages/mkdocs-requirements.txt \
    && echo "------------------------------------------------------ utils" \
    && git clone https://github.com/bluxmit/alnoda-workspaces /tmp/alnoda-workspaces \
    && mv /tmp/alnoda-workspaces/utils /home/abc/ \
    && rm -rf /tmp/alnoda-workspaces \
	&& echo "------------------------------------------------------ user" \
	&& mkdir -p /home/static-server \
	&& chown -R abc /opt/cronicle \
	&& chown -R abc /opt/filebrowser \
	&& chown -R abc /home/static-server \
	&& chown -R abc /home/docs \
	&& chown -R abc /opt/ungit \
	&& chown -R abc /opt/serve \
	&& mkdir -p /var/log/cronicle && chown -R abc /var/log/cronicle \
	&& mkdir -p /var/log/filebrowser && chown -R abc /var/log/filebrowser \
	&& mkdir -p /var/log/ungit && chown -R abc /var/log/ungit \
	&& mkdir -p /var/log/static-file-server && chown -R abc /var/log/static-file-server \
	&& mkdir -p /var/log/mkdocs && chown -R abc /var/log/mkdocs \
    && chown -R abc /home/abc/utils \
    && chown -R abc /home/abc/installed-python-packages
    
USER abc
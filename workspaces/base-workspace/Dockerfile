ARG docker_registry=docker.io/alnoda
ARG image_tag=20.04-2.2

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
COPY mkdocs-requirements.txt /home/abc/installed-python-packages/mkdocs-requirements.txt

RUN apt-get -y update \
    && echo "------------------------------------------------------ filebrowser" \
	&& cd /tmp && wget https://github.com/filebrowser/filebrowser/releases/download/v2.21.1/linux-amd64-filebrowser.tar.gz \
    && mkdir /tmp/filebrowser \
    && tar xvf /tmp/linux-amd64-filebrowser.tar.gz -C /tmp/filebrowser \
    && chmod +x /tmp/filebrowser/filebrowser \
    && mv /tmp/filebrowser/filebrowser /opt/filebrowser/ \
    && rm -rf /tmp/filebrowser/filebrowser \
    && echo "------------------------------------------------------ ungit" \
	&& apt-get install -y ssh net-tools --no-install-recommends \
	&& mkdir -p /opt/ungit \
	&& cd /opt/ungit && nodeenv --node=12.18.3 --npm=6.0.0 env \
	&& cd /opt/ungit && . env/bin/activate && npm install -g ungit@1.5.9 \
    && echo "------------------------------------------------------ static file server" \
	&& mkdir -p /opt/serve \
	&& cd /opt/serve && nodeenv --node=12.18.3 --npm=6.0.0 env \
	&& cd /opt/serve && . env/bin/activate &&  npm install -g serve \
    && echo "------------------------------------------------------ mkdocs" \
	&& pip install -r /home/abc/installed-python-packages/mkdocs-requirements.txt \
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
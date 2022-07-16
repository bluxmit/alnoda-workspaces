ARG docker_registry=docker.io/alnoda
ARG image_tag=20.04-3.0

FROM ${docker_registry}/ubuntu-workspace:${image_tag}

USER root

################################################################# TOOLS: cronicle, filebrowser, ungit, static server

COPY supervisord-devspace.conf /etc/supervisord/
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
    && echo "------------------------------------------------------ mkdocs" \
	&& pip install -r /home/abc/installed-python-packages/mkdocs-requirements.txt \
	&& echo "------------------------------------------------------ user" \
	&& chown -R abc /opt/filebrowser \
	&& chown -R abc /home/docs \
	&& chown -R abc /opt/ungit \
	&& mkdir -p /var/log/filebrowser && chown -R abc /var/log/filebrowser \
	&& mkdir -p /var/log/ungit && chown -R abc /var/log/ungit \
	&& mkdir -p /var/log/mkdocs && chown -R abc /var/log/mkdocs \
    && chown -R abc /home/abc/utils \
    && chown -R abc /home/abc/installed-python-packages \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 
    
USER abc
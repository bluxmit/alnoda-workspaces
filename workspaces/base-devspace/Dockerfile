FROM alnoda/ubuntu-workspace:20.04-4.0

# Make image Alnoda-compatible - add dir for logs
USER root
RUN echo "------------------------------------------------------ log dir for workspaces" \
    && mkdir /var/log/workspace \
    && chown abc /var/log/workspace 
USER abc

# Install workspace tools and applications
RUN sudo apt-get -y update \
    && mkdir /home/abc/apps \
    && sudo apt-get install -y socat \
    && echo "------------------------------------------------------ install filebrowser" \
	&& cd /tmp && wget https://github.com/filebrowser/filebrowser/releases/download/v2.21.1/linux-amd64-filebrowser.tar.gz \
    && mkdir /tmp/filebrowser \
    && tar xvf /tmp/linux-amd64-filebrowser.tar.gz -C /tmp/filebrowser \
    && chmod +x /tmp/filebrowser/filebrowser \
    && mkdir /home/abc/apps/filebrowser/ \
    && mv /tmp/filebrowser/filebrowser /home/abc/apps/filebrowser/ \
    && rm -rf /tmp/filebrowser \
    && rm /tmp/linux-amd64-filebrowser.tar.gz \
    && echo "------------------------------------------------------ install ungit" \
	&& sudo apt-get install -y ssh net-tools --no-install-recommends \
	&& mkdir -p /home/abc/apps/ungit \
	&& cd /home/abc/apps/ungit && nodeenv --node=12.18.3 --npm=6.0.0 env \
	&& cd /home/abc/apps/ungit && . env/bin/activate && npm install -g ungit@1.5.9 

# Copy Filebrowser config (it changes filebrowser standard port and host)
COPY --chown=abc:abc filebrowser.json /home/abc/apps/filebrowser/.filebrowser.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN echo "------------------------------------------------------ build workspace" \
    && pipx install alnoda-wrk \
    && alnoda-wrk build /tmp/workspace \ 
    && rm -rf /tmp/workspace
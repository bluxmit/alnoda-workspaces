FROM alnoda/ubuntu-workspace:0.1-22.04

# Make image Alnoda-compatible - add dir for logs
USER root
RUN echo "------------------------------------------------------ log dir for workspaces" \
    && mkdir /var/log/workspace \
    && chown abc /var/log/workspace 
USER abc

# Install workspace tools and applications
RUN sudo apt-get -y update \
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
    && echo "------------------------------------------------------ install frp" \
    && cd /tmp && wget https://github.com/fatedier/frp/releases/download/v0.44.0/frp_0.44.0_linux_amd64.tar.gz \
    && tar xvf /tmp/frp_0.44.0_linux_amd64.tar.gz \
    && mv /tmp/frp_0.44.0_linux_amd64 /home/abc/apps/frp \
    && rm /tmp/frp_0.44.0_linux_amd64.tar.gz \
    && sudo apt-get install -y timelimit

# Copy Filebrowser config (it changes filebrowser standard port and host)
COPY --chown=abc:abc filebrowser.json /home/abc/apps/filebrowser/.filebrowser.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN echo "------------------------------------------------------ build workspace" \
    && pipx install alnoda-wrk==0.4.27 \
    && alnoda-wrk build /tmp/workspace \ 
    && rm -rf /tmp/workspace
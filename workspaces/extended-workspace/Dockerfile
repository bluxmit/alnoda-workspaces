FROM alnoda/codeserver-workspace:4.0

# Set env variables for Cronicle and Static file server
ENV CRONICLE_VERSION="v0.9.10" \
    CRONICLE_DIR="/home/abc/apps/cronicle" \
    STATIC_FILESERVER_DIR="/home/abc/apps/static-file-server"

# Clone Cronicle & create node environment
RUN echo "------------------------------------------------------ Cronicle" \
	&& git clone --branch $CRONICLE_VERSION https://github.com/jhuckaby/Cronicle.git $CRONICLE_DIR \
    && rm -rf $CRONICLE_DIR/.git \
    && rm -rf $CRONICLE_DIR/.github \
    && cd $CRONICLE_DIR && nodeenv --node=12.18.3 --npm=6.0.0 env \
    && cd $CRONICLE_DIR && . env/bin/activate && npm install; node bin/build.js dist

# Copy Cronicle config
COPY --chown=abc:abc cronicle-config.json $CRONICLE_DIR/conf/config.json

# Create node environment & install Static file server 
RUN echo "------------------------------------------------------ Static file server" \
    && mkdir /home/static-server \
	&& mkdir -p $STATIC_FILESERVER_DIR \
	&& cd $STATIC_FILESERVER_DIR && nodeenv --node=16.17.0 --npm=6.0.0 env \
	&& cd $STATIC_FILESERVER_DIR && . env/bin/activate &&  npm install -g serve@14.0.1 

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
FROM alnoda/base-devspace:4.0

# Set environmental variables for Code-server
ENV CODESERVER_DIR="/home/abc/apps/code-server"
ENV VSCODE_CONFIG_DIR="/home/abc/.config/vscode"

# Install Code-server and create folders for data & extensions
RUN echo "------------------------------------------------------ code-server" \
	&& sudo apt-get install -y build-essential pkg-config \
    && mkdir -p "$CODESERVER_DIR" \
	&& cd $CODESERVER_DIR && nodeenv --node=16.15.0 --npm=1.0.10 env \
	&& cd $CODESERVER_DIR && . env/bin/activate &&  npm install -g yarn && yarn global add code-server@4.4.0 \
	&& mkdir -p $VSCODE_CONFIG_DIR/data \
	&& mkdir -p $VSCODE_CONFIG_DIR/extensions 

# Copy Code-server startup script
COPY --chown=abc:abc code-server-run.sh $CODESERVER_DIR/code-server-run.sh

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
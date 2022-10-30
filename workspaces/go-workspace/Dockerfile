FROM alnoda/codeserver-workspace:4.0

# Istall Golang
RUN cd /tmp && curl -LO https://go.dev/dl/go1.18.2.linux-amd64.tar.gz \
    && tar -xvf go1.18.2.linux-amd64.tar.gz -C /home/abc \
    && rm /tmp/go1.18.2.linux-amd64.tar.gz 

# Set environmental variables 
ENV PATH="$PATH:/home/abc/go/bin"
ENV GOPATH="/home/abc/go"
ENV GOROOT="/home/abc/go"

RUN go install -v github.com/ramya-rao-a/go-outline@latest \
    && go install -v golang.org/x/tools/gopls@latest \
    && go get -v golang.org/x/tools/cmd/goimports \
    && go get -v github.com/uudashr/gopkgs/v2/cmd/gopkgs \
    && go get -v github.com/stamblerre/gocode

# Install additional codeserver extensions 
RUN echo "------------------------------------------------------ extensions" \
    && code-server --install-extension  ms-vscode.Go \
    && code-server --install-extension  tonsky.theme-alabaster \
    && code-server --install-extension  CoenraadS.bracket-pair-colorizer-2 


# Change default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
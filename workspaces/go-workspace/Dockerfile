FROM alnoda/codeserver-workspace:5.0

RUN wrk install go==1.18.2

# Set global environmental variables 
ENV PATH="$PATH:/home/abc/go/bin"
ENV GOPATH="/home/abc/go"
ENV GOROOT="/home/abc/go"

# Istall extra Go tools
RUN go install -v github.com/ramya-rao-a/go-outline@latest \
    && go install -v golang.org/x/tools/gopls@latest \
    && go install -v golang.org/x/tools/cmd/goimports@latest \
    && go install -v github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest \
    && go install -v github.com/stamblerre/gocode@latest

# Install additional codeserver extensions 
RUN echo "------------------------------------------------------ extensions" \
    && code-server --install-extension  ms-vscode.Go \
    && code-server --install-extension  tonsky.theme-alabaster \
    && code-server --install-extension  CoenraadS.bracket-pair-colorizer-2 

# Change default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
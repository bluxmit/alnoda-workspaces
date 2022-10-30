FROM alnoda/java-workspace:4.0-17

RUN sudo apt-get -y update \
    && echo "------------------------------------------------------ Erlang requirements" \
    && sudo apt-get -y install build-essential autoconf libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev \
    && echo "------------------------------------------------------ Kerl" \
    && cd /tmp && curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl \
    && chmod a+x kerl \
    && mv /tmp/kerl /home/abc/.local/bin/ \
    && kerl update releases 

RUN echo "------------------------------------------------------ Erlang/OTP (user) " \
    && kerl build 25.0 25.0 \
    && kerl install 25.0 /home/abc/erlang/25.0 \
    && export PATH="$PATH:/home/abc/erlang/25.0/bin" \
    && echo "------------------------------------------------------ Kiex, Elixir (user) " \
    && curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s \
    && export "PATH=$PATH:/home/abc/.kiex/bin" \
    && kiex install 1.13.4 

ENV PATH="$PATH:/home/abc/erlang/25.0/bin"
ENV PATH="$PATH:/home/abc/.kiex/bin"
ENV PATH="$PATH:/home/abc/.kiex/elixirs/elixir-1.13.4/bin"

# Install codeserver extensions 
RUN echo "------------------------------------------------------ common extensions" \
    && code-server --install-extension  erlang-ls.erlang-ls \
    && code-server --install-extension  elixir-lsp.elixir-ls \
    && code-server --install-extension  pantajoe.vscode-elixir-credo \
    && code-server --install-extension  lakshitsomani.best-themes-redefined 

# Set default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
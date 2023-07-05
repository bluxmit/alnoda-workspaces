FROM alnoda/java-workspace:5.0-17

RUN wrk install erlang==25.0
ENV PATH="$PATH:/home/abc/erlang/25.0/bin"
RUN wrk install elixir==1.13.4
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

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
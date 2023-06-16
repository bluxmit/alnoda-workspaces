FROM alnoda/base-devspace:4.0

RUN echo "------------------------------------------------------ nvim" \
    && cd /tmp && wget https://github.com/neovim/neovim/releases/download/v0.9.0/nvim-linux64.tar.gz \
    && tar -xzf nvim-linux64.tar.gz \
    && mv /tmp/nvim-linux64 /home/abc/apps/nvim \
    && echo "------------------------------------------------------ spacevim" \
    && curl -sLf https://spacevim.org/install.sh | bash \
    && pip install --user pynvim  \
    && pip install --user jedi \
    && mkdir -p /home/abc/.local/state/nvim/shada/ \
    && touch /home/abc/.local/state/nvim/shada/main.shada

ENV PATH="$PATH:/home/abc/apps/nvim/bin"

COPY --chown=abc:abc init.toml /home/abc/.SpaceVim.d/init.toml 

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN echo "------------------------------------------------------ build workspace" \
    && pipx install alnoda-wrk \
    && alnoda-wrk build /tmp/workspace \ 
    && rm -rf /tmp/workspace
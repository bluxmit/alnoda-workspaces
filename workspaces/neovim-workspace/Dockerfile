FROM alnoda/base-devspace:4.0

RUN echo "------------------------------------------------------ nvim" \
    && cd /tmp && wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.tar.gz \
    && tar -xzf nvim-linux64.tar.gz \
    && rm /tmp/nvim-linux64.tar.gz \
    && mv /tmp/nvim-linux64 /home/abc/apps/nvim \
    && mkdir /home/abc/.config/nvim/ \
    && echo "------------------------------------------------------ vim-plug" \
    && sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \
    && mkdir /home/abc/.config/nvim/plugged 

COPY --chown=abc:abc init.vim /home/abc/.config/nvim/init.vim 
ENV PATH="$PATH:/home/abc/apps/nvim/bin"
ENV EDITOR="cd /home/abc/apps/nvim-nodeenv && . env/bin/activate && nvim"

RUN echo "------------------------------------------------------ create node environment" \
    && mkdir /home/abc/apps/nvim-nodeenv \
    && cd /home/abc/apps/nvim-nodeenv && nodeenv --node=18.9.0 env && . env/bin/activate \
    && echo "------------------------------------------------------ install nvim plugins" \
    && nvim --headless +PlugInstall +qall \
    && echo "------------------------------------------------------ providers" \
    && python3 -m pip install --user --upgrade pynvim \
    && nvim --headless -c 'CocInstall -sync coc-json coc-pyright coc-tsserver coc-go coc-java coc-html|q'

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN echo "------------------------------------------------------ build workspace" \
    && pipx install alnoda-wrk \
    && alnoda-wrk build /tmp/workspace \ 
    && rm -rf /tmp/workspace

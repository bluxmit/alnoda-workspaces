FROM ubuntu:22.04

COPY unified-supervisord.conf supervisord.conf /etc/supervisord/
COPY mc.ini /home/abc/.config/mc/ini
COPY zsh-in-docker.sh /tmp/zsh-in-docker.sh

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y update \ 
    && echo "------------------------------------------------------ Common" \
    && apt-get install -y sudo jq git \
    && apt-get install -y curl wget telnet netcat dnsutils \
    && apt-get install -y software-properties-common \
    && apt-get install -y zip gzip tar \
    && apt-get install -y gdebi-core \
    && apt-get install -y acl \
    && apt-get install -y psmisc \
    && echo "------------------------------------------------------ tzdata" \
    && sudo ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
    && sudo apt-get install --reinstall tzdata \
    && echo "------------------------------------------------------ User" \
    && useradd -u 8877 -p $(openssl passwd -1 abc) abc \
    && chown -R abc /home \
    && mkdir -p /home/abc \
    && chown -R abc /home/abc \
    && mkdir -p /home/abc/apps \
    && chown -R abc /home/abc/apps \
    && setfacl -m u:abc:rwx /etc \
    && echo "------------------------------------------------------ Nix folder and conf" \
    && mkdir -m 0750 /nix && chown abc /nix \
    && echo "------------------------------------------------------ docker systemctl replacement" \
    && wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py -O /usr/local/bin/systemctl  \
    && chown -R abc /usr/local/bin/systemctl \ 
    && echo "------------------------------------------------------ Python" \
    && apt-get install -y python3-distutils \
    && apt-get install -y python3-pip \
    && pip install --upgrade pip \
    && pip install --upgrade setuptools \
    && pip install --upgrade distlib \
    &&  apt-get install -y python-is-python3 \
    && mkdir -p /usr/bin/pip3.8 \
    && chown abc /usr/bin/pip3.8 \
    && echo "------------------------------------------------------ Add abc user to sudo" \
    && sudo usermod -a -G sudo abc \
    && echo "abc ALL=(ALL) NOPASSWD: ALL " >> /etc/sudoers \
    && echo "------------------------------------------------------ Nodeenv" \
    && pip install nodeenv \
    && apt-get install -y yarn \
    && echo "------------------------------------------------------ Cron" \
    && apt-get install -y cron \
    && mkdir -p /var/log/supervisord/ \
    && chown -R abc /var/spool/cron/crontabs \
    && chown -R abc /var/log \
    && chmod gu+rw /var/run \
    && chmod gu+s /usr/sbin/cron \
    && echo "------------------------------------------------------ Supervisor" \
    && apt-get remove -y cmdtest \
    && apt-get install -y supervisor \
    && pip3 install supervisor==4.2.2 \
    && apt-get -y update \
    && apt-get install -y systemd \
    && chown -R abc /etc/supervisord/ \
    && chown -R abc /var/log/supervisord/ \
    && echo "------------------------------------------------------ ZSH root" \
    && HOME=/root \
    && chmod +x /tmp/zsh-in-docker.sh \
    && /tmp/zsh-in-docker.sh \
    -t https://github.com/pascaldevink/spaceship-zsh-theme \
    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
    -a 'export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"' \
    -a 'SPACESHIP_USER_SHOW="false"' \
    -a 'SPACESHIP_TIME_SHOW="true"' \
    -a 'SPACESHIP_TIME_COLOR="grey"' \
    -a 'SPACESHIP_DIR_COLOR="cyan"' \
    -a 'SPACESHIP_GIT_SYMBOL="⇡"' \
    -a 'SPACESHIP_BATTERY_SHOW="false"' \
    -a 'if [[ $(pwd) != /root  ]]; then cd /root; fi  # Set starting dir to /root ' \
    -a 'hash -d r=/root' \
    -p git \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-history-substring-search \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p 'history-substring-search' \
    -p https://github.com/bobthecow/git-flow-completion \
    -a 'bindkey "\$terminfo[kcuu1]" history-substring-search-up' \
    -a 'bindkey "\$terminfo[kcud1]" history-substring-search-down' \
    && printf '%s\n%s\n' "export ZSH_DISABLE_COMPFIX=true" "$(cat /root/.zshrc)" > /root/.zshrc \
    && echo "------------------------------------------------------ ZSH abc" \
    && mkdir -p /home/project \
    && HOME=/home/abc \
    && /tmp/zsh-in-docker.sh \
    -t https://github.com/pascaldevink/spaceship-zsh-theme \
    -a 'DISABLE_UPDATE_PROMPT="true"' \
    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
    -a 'export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"' \
    -a 'SPACESHIP_USER_SHOW="true"' \
    -a 'SPACESHIP_TIME_SHOW="true"' \
    -a 'SPACESHIP_TIME_COLOR="grey"' \
    -a 'SPACESHIP_DIR_COLOR="cyan"' \
    -a 'SPACESHIP_GIT_SYMBOL="⇡"' \
    -a 'SPACESHIP_BATTERY_SHOW="false"' \
    -a 'if [[ $(pwd) != /home/project  ]]; then cd /home/project; fi  # Set starting dir to /home/project ' \
    -a 'hash -d p=/home/project' \
    -p git \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-history-substring-search \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p 'history-substring-search' \
    -p https://github.com/bobthecow/git-flow-completion \
    -a 'bindkey "\$terminfo[kcuu1]" history-substring-search-up' \
    -a 'bindkey "\$terminfo[kcud1]" history-substring-search-down' \
    && rm /tmp/zsh-in-docker.sh \
    && printf '%s\n%s\n' "export ZSH_DISABLE_COMPFIX=true" "$(cat /home/abc/.zshrc)" > /home/abc/.zshrc \
    && echo "------------------------------------------------------ Code editors" \
    && apt-get install -y nano vim \
    && apt-get install -y tilde \
    && echo "------------------------------------------------------ File browsers: MC" \
    && apt-get install -y mc \
    && echo "------------------------------------------------------ multitasking in a terminal " \
    && apt-get install -y tmux \
    && echo "------------------------------------------------------ Sys monitoring" \
    && apt-get install -y ncdu htop \
    && echo "------------------------------------------------------ Web-based terminal" \
    && cd /tmp && wget https://github.com/tsl0922/ttyd/releases/download/1.7.1/ttyd.x86_64 \
    && mv ttyd.x86_64 /usr/bin/ttyd \
    && chmod +x /usr/bin/ttyd \
    && echo "------------------------------------------------------ User" \
    && chown abc /home/project \
    && mkdir -p /home/abc/bin \ 
    && chown abc /home/abc/bin \
    && mkdir -p /home/abc/.local/bin \ 
    && chown abc /home/abc/.local && chown abc /home/abc/.local/bin \
    && chown abc /home/abc/.local && chown abc /home/abc/.local/bin  \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} \
    && echo "------------------------------------------------------ Aliases" \
    && echo 'alias python="python3"' >> /root/.zshrc \
    && echo 'alias python="python3"' >> /home/abc/.zshrc \
    && echo "------------------------------------------------------ Clean" \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && apt-get -y autoclean \
    && rm -rf /home/abc/.oh-my-zsh/.git \
    && rm -rf /home/abc/.oh-my-zsh/.github \
    && rm -rf /home/abc/.oh-my-zsh/custom/plugins/git-flow-completion/.git \
    && rm -rf /home/abc/.oh-my-zsh/custom/plugins/zsh-autosuggestions/.git \
    && rm -rf /home/abc/.oh-my-zsh/custom/plugins/zsh-completions/.git \
    && rm -rf /home/abc/.oh-my-zsh/custom/plugins/zsh-history-substring-search/.git \
    && rm -rf /home/abc/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/.git \
    && rm -rf /home/abc/.oh-my-zsh/custom/themes/spaceship-zsh-theme/.git 

USER abc

RUN git config --global credential.helper cache \
    && echo "------------------------------------------------------ Nix" \
    && curl -L https://nixos.org/nix/install > /tmp/nix.sh \
    && chmod +x /tmp/nix.sh \
    && sh /tmp/nix.sh --no-daemon  \
    && rm /tmp/nix.sh \
    && echo "------------------------------------------------------ Pipx" \
    && sudo apt-get -y install python3.10-venv \
    && python3 -m pip install --user pipx \
    && python3 -m pipx ensurepath 

ENV PATH="/home/abc/bin:${PATH}"
ENV PATH="/home/abc/.local/bin:${PATH}"
ENV PATH="/home/abc/.nix-profile/bin:${PATH}"

RUN DEBIAN_FRONTEND=noninteractive \
    && echo "------------------------------------------------------ after PATH updates" \
    && pipx install rich-cli \
    && echo 'alias p="rich"' >> /home/abc/.zshrc \
    && nix-env -iA cachix -f https://cachix.org/api/v1/install \
    && echo "------------------------------------------------------ asdf" \
    && git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3 \
    && rm -rf /home/abc/.asdf/.git \
    && echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc \
    && echo 'fpath=(${ASDF_DIR}/completions $fpath)' >> ~/.zshrc \
    && echo 'autoload -Uz compinit && compinit' >> ~/.zshrc

###### ENTRY

# note! this will have consequences only when started as root (docker run ... --user root ...)  
# systemctl start systemd-journald 
#   I remove this from entrypoint, as it is not used significantly, but slows down the start

# this entrypoint should be the same for all images that are built on top of this one
ENTRYPOINT /etc/init.d/cron start; supervisord -c "/etc/supervisord/unified-supervisord.conf"

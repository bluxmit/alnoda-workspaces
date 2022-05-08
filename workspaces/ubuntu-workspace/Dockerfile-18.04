FROM ubuntu:18.04


COPY unified-supervisord.conf supervisord.conf /etc/supervisord/
COPY mc.ini /home/abc/.config/mc/ini
COPY zsh-in-docker.sh /tmp/zsh-in-docker.sh


# Systemctl within Docker and Python 3.9
RUN DEBIAN_FRONTEND=noninteractive apt-get update \ 
    && apt-get install -y wget \
    && wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -O /usr/local/bin/systemctl  \
    && chmod 0777 /usr/local/bin/systemctl \ 
    && apt-get install -y software-properties-common \
    && apt-get install -y apache2-utils \
    && apt-get install -y zip gzip tar \
    && echo "------------------------------------------------------ User" \
    && useradd -u 8877 abc \
    && chmod -R 777 /home \
    && mkdir -p /home/abc \
    && chown -R abc /home/abc \
    && echo "------------------------------------------------------ Python" \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get install -y python3.9 \ 
    && update-alternatives --install /usr/bin/python python /usr/bin/python3.9 10 \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 10 \
    && apt-get install -y python3-distutils \
    && apt-get install -y python3.9-distutils \
    && apt-get install -y python3-pip \
    && apt-get install python3.9-venv \
    && pip3 install --upgrade pip \
    && pip3 install --upgrade setuptools \
    && pip3 install --upgrade distlib \
    && update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1 \
    && echo "------------------------------------------------------ Common Packages" \
    && apt-get install -y sudo git curl wget telnet jq \
    && apt-get install -y mc ncdu htop \
    && apt-get install -y nano vim \
    && apt-get install -y git git-flow \
    && echo "# Allow non-admin users to install packages" >> /etc/sudoers \
    && echo "abc ALL = NOPASSWD : /usr/bin/apt, /usr/bin/apt-get, /usr/bin/aptitude, /usr/local/bin/pip, /usr/local/bin/systemctl, /usr/bin/dpkg, /usr/sbin/dpkg-reconfigure" >> /etc/sudoers \
    && echo "------------------------------------------------------ Nodeenv" \
    && pip install nodeenv \
    && apt-get install -y yarn \
    && echo "------------------------------------------------------ Cron" \
    && apt-get install -y cron \
    && mkdir -p /var/log/supervisord/ \
    && chmod -R 777 /var/spool/cron/crontabs \
    && chmod -R 777 /var/log \
    && chmod gu+rw /var/run \
    && chmod gu+s /usr/sbin/cron \
    && echo "# Allow cron for user abc" >> /etc/sudoers \
    && echo "abc ALL = NOPASSWD : /usr/sbin/cron " >> /etc/sudoers \
    && echo "------------------------------------------------------ Supervisor" \
    && apt-get remove -y cmdtest \
    && apt-get install -y supervisor \
    && pip3 install supervisor==4.2.2 \
    && apt-get update \
    && apt-get install -y systemd \
    && chmod -R 777 /etc/supervisord/ \
    && chmod -R 777 /var/log/supervisord/ \
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
    && echo "------------------------------------------------------ Docker" \
    && apt-get install -y apt-transport-https ca-certificates gnupg lsb-release \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io \
    && curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && echo "------------------------------------------------------ Web-based terminal" \
    && cd /tmp && wget https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.aarch64 \
    && mv ttyd.aarch64 /usr/bin/ttyd \
    && chmod +x /usr/bin/ttyd \
    && echo "------------------------------------------------------ utils" \
    && git clone https://github.com/bluxmit/alnoda-workspaces /tmp/alnoda-workspaces \
    && mv /tmp/alnoda-workspaces/utils /home/abc/ \
    && rm -rf /tmp/alnoda-workspaces \
    && echo "------------------------------------------------------ User" \
    && chown abc /home/project \
    && chmod 777 /etc/supervisord/ \
    && mkdir -p /home/abc/.local/bin \ 
    && chmod 755 /home/abc/.local && chmod 755 /home/abc/.local/bin \
    && chown abc /home/abc/.local && chown abc /home/abc/.local/bin  \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} \
    && echo "------------------------------------------------------ Clean" \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && apt-get -y autoclean


USER abc

ENV PATH="/home/abc/.local/bin:${PATH}"


###### ENTRY

# note! this will have consequences only when started as root (docker run ... --user root ...)  
# systemctl start systemd-journald 

# this entrypoint should be the same for all images that are built on top of this one
ENTRYPOINT /etc/init.d/cron start; systemctl start systemd-journald; supervisord -c "/etc/supervisord/unified-supervisord.conf"

FROM alnoda/ubuntu-workspace:20.04-2.2

USER root

RUN echo "------------------------------------------------------ Docker" \
    && apt-get install -y apt-transport-https ca-certificates gnupg lsb-release \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin \
    && echo "------------------------------------------------------ Ctop" \
    && echo "deb http://packages.azlux.fr/debian/ buster main" | tee /etc/apt/sources.list.d/azlux.list \
    && wget -qO - https://azlux.fr/repo.gpg.key | apt-key add - \
    && apt-get update \
    && apt-get install -y docker-ctop \
    && echo "------------------------------------------------------ Lazydocker" \
    && wget -P /tmp https://github.com/jesseduffield/lazydocker/releases/download/v0.12/lazydocker_0.12_Linux_x86.tar.gz \
    && mkdir /tmp/lazydocker  && tar -xzf /tmp/lazydocker_0.12_Linux_x86.tar.gz --directory /tmp/lazydocker \
    && chmod +x /tmp/lazydocker/lazydocker \
    && mv /tmp/lazydocker/lazydocker /usr/bin/ \
    && rm /tmp/lazydocker_0.12_Linux_x86.tar.gz \
    && rm -rf /tmp/lazydocker \
    && echo "------------------------------------------------------ Sen" \
    && pip install sen==0.6.2 \
    && echo "------------------------------------------------------ Dive" \
    && cd /tmp && wget https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb \
    && apt-get install /tmp/dive_0.9.2_linux_amd64.deb \
    && rm /tmp/dive_0.9.2_linux_amd64.deb 
    
USER abc

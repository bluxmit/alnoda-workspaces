FROM alnoda/ansible-terraform-workspace:4.0

RUN sudo apt-get -y update \
    && echo "------------------------------------------------------ Kubectl" \
    && cd /tmp && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install kubectl /home/abc/.local/bin/kubectl \
    && rm /tmp/kubectl \
    && echo "------------------------------------------------------ Helm" \
    && cd /tmp && wget https://get.helm.sh/helm-v3.9.0-linux-386.tar.gz \
    && tar -zxvf /tmp/helm-v3.9.0-linux-386.tar.gz \
    && chmod +x /tmp/linux-386/helm \
    && mv /tmp/linux-386/helm /home/abc/.local/bin/helm \
    && rm /tmp/helm-v3.9.0-linux-386.tar.gz \
    && rm -r /tmp/linux-386 \
    && echo "------------------------------------------------------ K9s" \
    && mkdir /tmp/k9s \
    && cd /tmp/k9s && wget https://github.com/derailed/k9s/releases/download/v0.25.18/k9s_Linux_x86_64.tar.gz \
    && tar -zxvf /tmp/k9s/k9s_Linux_x86_64.tar.gz \
    && chmod +x /tmp/k9s/k9s \
    && mv /tmp/k9s/k9s /home/abc/.local/bin/k9s \
    && rm -r /tmp/k9s \
    && echo "------------------------------------------------------ Octant" \
    && mkdir -p /tmp/octant \
    && cd /tmp/octant && wget https://github.com/vmware-tanzu/octant/releases/download/v0.25.1/octant_0.25.1_Linux-64bit.tar.gz \
    && tar -zxvf /tmp/octant/octant_0.25.1_Linux-64bit.tar.gz \
    && chmod +x /tmp/octant/octant_0.25.1_Linux-64bit/octant \
    && mv /tmp/octant/octant_0.25.1_Linux-64bit/octant /home/abc/.local/bin/ \
    && rm -rf /tmp/octant 

RUN echo "------------------------------------------------------ kubespray" \
    && git clone -b v2.19.0 --single-branch https://github.com/kubernetes-sigs/kubespray.git /home/project/kubespray \
    && pip install -r /home/project/kubespray/requirements-2.12.txt \
    && echo "------------------------------------------------------ Kube-shell" \
    && pipx install kube-shell \
    && echo "------------------------------------------------------ Kubescape" \
    && chmod 0750 /home/abc/.nix-profile/bin/ \
    && curl -s https://raw.githubusercontent.com/kubescape/kubescape/master/install.sh | /bin/bash \
    && echo "------------------------------------------------------ Krew" \
    && mkdir /tmp/krew \
    && cd /tmp/krew && wget https://github.com/kubernetes-sigs/krew/releases/download/v0.4.3/krew-linux_amd64.tar.gz \
    && tar -zxvf /tmp/krew/krew-linux_amd64.tar.gz \
    && chmod +x /tmp/krew/krew-linux_amd64 \
    && /tmp/krew/krew-linux_amd64 install krew \
    && rm -rf /tmp/krew/ \
    && echo "------------------------------------------------------ kubectl-aliases" \
    && cd /home/abc && wget https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases \
    && echo '[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases' >> /home/abc/.zshrc \
    && mkdir -p /home/abc/.ssh


# https://github.com/bloodorangeio/octant-helm

ENV OCTANT_DISABLE_OPEN_BROWSER=1 \ 
    OCTANT_LISTENER_ADDR=0.0.0.0:8035

ENV PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Install additional codeserver extensions 
RUN echo "------------------------------------------------------ extensions" \
    && code-server --install-extension  ms-kubernetes-tools.vscode-kubernetes-tools \
    && code-server --install-extension  ipedrazas.kubernetes-snippets

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
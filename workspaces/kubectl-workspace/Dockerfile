FROM alnoda/codeserver-workspace:5.0

RUN wrk install kubectl==stable
RUN wrk install helm==v3.9.0
RUN wrk install k9s==v0.25.18
RUN wrk install kdash==0.3.6
RUN wrk install octant==v0.25.1
RUN wrk install kubescape==latest
RUN wrk install kube-shell==latest
RUN wrk install krew==v0.4.3
RUN wrk install kube-hunter==0.6.8
RUN wrk install argocd-cli==v2.7.2
RUN wrk install trivy==0.43.0
RUN wrk install helmfile==0.155.0
RUN wrk install kubectl-aliases==latest
RUN wrk install velero-cli==1.10.3

# Install additional codeserver extensions 
RUN echo "------------------------------------------------------ extensions" \
    && code-server --install-extension  ms-kubernetes-tools.vscode-kubernetes-tools \
    && code-server --install-extension  ipedrazas.kubernetes-snippets

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
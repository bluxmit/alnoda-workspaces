FROM alnoda/codeserver-workspace:5.0

# Geeral tooling
RUN wrk install cronicle==0.9.10 admin
RUN wrk install serve==14.0.1 

# Ansible
RUN wrk install ansible-ara==6.3.0
RUN wrk install ansible-navigator==2.2.0
RUN wrk install ansible-lint==6.0.0
RUN wrk install ansible-doctor==1.4.3
RUN wrk install ansible-playbook-grapher==1.2.0
RUN wrk install ansible-inventory-grapher==2.5.0
RUN wrk install ansible-cmdb==1.31

# Terraform
RUN wrk install terraform==1.2.8 
RUN wrk install terrascan==1.15.2
RUN wrk install tfsec==1.27.5
RUN wrk install tflint==0.39.3
RUN wrk install terraform-docs==0.15.0
RUN wrk install inframap==0.6.7
RUN wrk install blast-radius==0.1.23
RUN wrk install rover-terraform-visualizer==0.3.3

# Copy Ansible & Terraform examples
COPY --chown=abc:abc ./examples/ /home/examples/

# Install additional codeserver extensions 
RUN echo "------------------------------------------------------ codeserver extensions" \
    && code-server --install-extension  robbowen.synthwave-vscode \
    && code-server --install-extension  hashicorp.terraform \
    && code-server --install-extension  redhat.ansible \
    && code-server --install-extension  samuelcolvin.jinjahtml 

# Change default codeserver theme synthwave84
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Update Alnoda workspace UI, icons, fonts
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
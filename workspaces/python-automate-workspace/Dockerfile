FROM alnoda/extended-workspace:4.0

COPY python-requirements.txt /home/abc/installed-python-packages
COPY ./examples/ /home/examples/
COPY .pylintrc /home/abc/

RUN pip install -r /home/abc/installed-python-packages/python-requirements.txt \
    && echo "------------------------------------------------------ graphviz" \
    && apt-get update \
    && apt-get install -y graphviz \
    && apt-get install -y python3-pydotplus \
    && echo "------------------------------------------------------ utils" \
    && echo "alias python-report='/home/abc/utils/python-report.sh'" >> /home/abc/.zshrc \
    && chmod +x /home/abc/utils/python-report.sh && chown abc /home/abc/utils/python-report.sh \
    && echo "------------------------------------------------------ user" \
    && chown -R abc /home/abc/installed-python-packages \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

# Install additional codeserver extensions 
RUN echo "------------------------------------------------------ extensions" \
    && code-server --install-extension  jolaleye.horizon-theme-vscode \
    && code-server --install-extension  eamodio.gitlens 

# Change default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
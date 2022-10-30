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
    && pipx install visidata

# Install additional codeserver extensions 
RUN echo "------------------------------------------------------ extensions" \
    && code-server --install-extension  jolaleye.horizon-theme-vscode \
    && code-server --install-extension  ms-python.python \
    && code-server --install-extension  samuelcolvin.jinjahtml \
    && code-server --install-extension  KevinRose.vsc-python-indent \
    && code-server --install-extension  janisdd.vscode-edit-csv \
    && code-server --install-extension  GrapeCity.gc-excelviewer \
    && code-server --install-extension  eamodio.gitlens \
    && code-server --install-extension  TabNine.tabnine-vscode 



# Change default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
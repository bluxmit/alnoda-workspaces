FROM alnoda/codeserver-workspace:4.0

# Install globally common packages 
COPY --chown=abc:abc common-requirements.txt /home/abc/python-requirements/
RUN pip install -r /home/abc/python-requirements/common-requirements.txt

# Poetry: before installation
ENV LANG=C.UTF-8
RUN sudo apt-get -y update \
    && sudo apt-get install -y language-pack-en \
    && pip install -U keyrings.alt 
# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
# Add poetry to the $PATH
ENV PATH="$HOME/.poetry/bin:${PATH}"

# Install additional codeserver extensions 
RUN echo "------------------------------------------------------ extensions" \
    && code-server --install-extension  eamodio.gitlens 

# Change default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk==0.2.16; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
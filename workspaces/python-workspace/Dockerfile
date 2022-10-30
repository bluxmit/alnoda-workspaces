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

RUN echo "------------------------------------------------------ Pyenv" \
    && sudo apt-get install -y libedit-dev \
    && sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \ 
    && sudo apt-get install -y llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \
    && curl https://pyenv.run | bash \
    && echo 'eval "$(pyenv init -)"' >> /home/abc/.zshrc 

ENV PYENV_ROOT="/home/abc/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PATH"

# Install additional codeserver extensions 
RUN echo "------------------------------------------------------ extensions" \
    && code-server --install-extension  ms-python.python \
    && code-server --install-extension  samuelcolvin.jinjahtml 

# Change default codeserver theme
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace

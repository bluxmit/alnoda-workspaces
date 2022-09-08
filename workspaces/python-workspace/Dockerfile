FROM alnoda/theia-workspace:4.0

# Install globally common packages 
COPY --chown=abc:abc python-requirements.txt /home/abc/python-requirements/
RUN pip install -r /home/abc/python-requirements/python-requirements.txt 

# Poetry: before installation
ENV LANG=C.UTF-8
RUN sudo apt-get -y update \
    && sudo apt-get install -y language-pack-en \
    && pip install -U keyrings.alt 
# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
# Add poetry to the $PATH
ENV PATH="$HOME/.poetry/bin:${PATH}"

# Set another color theme for IDE
COPY settings.json /home/abc/.theia/settings.json

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
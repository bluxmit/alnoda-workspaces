FROM alnoda/extended-workspace:4.0

# More dependencies for mkdocs and markdown
COPY mkdocs-requirements.txt /home/abc/python-requirements

RUN sudo apt-get -y update \
	&& echo "-------------------------------------------- weasyprint" \
	&& sudo apt-get install -y build-essential python3-dev python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info \
    && echo "-------------------------------------------- mkdocs plugins" \
    && pip install -r /home/abc/python-requirements/mkdocs-requirements.txt 

# Copy example project
COPY ./examples/ /home/examples/

# Change Theia color theme for this magic workspace to stand out
COPY settings.json /home/abc/.theia/settings.json 

bierner.markdown-mermaid
hall.draw

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
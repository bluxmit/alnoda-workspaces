FROM alnoda/theia-workspace:5.0

# More dependencies for mkdocs and markdown
COPY mkdocs-requirements.txt /tmp/

RUN sudo apt-get -y update \
	&& echo "-------------------------------------------- weasyprint" \
	&& sudo apt-get install -y build-essential python3-dev python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info \
    && echo "-------------------------------------------- mkdocs plugins" \
    && pip install -r /tmp/mkdocs-requirements.txt 

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
ARG docker_registry=docker.io/alnoda
ARG image_tag=2.2-3.8

## Images used:
ARG BUILD_IMAGE=node:12.18.3
ARG DEPLOY_IMAGE=${docker_registry}/python-workspace:${image_tag}

################################################################################ BUILD THEIA

ARG THEIA_VERSION=1.15.0
FROM ${BUILD_IMAGE} as theia-builder

ARG THEIA_VERSION

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils \
    && apt-get install -y git \
    && apt-get install -y libsecret-1-dev \
    && mkdir /opt/theia

WORKDIR /opt/theia
ADD ${THEIA_VERSION}.package.json ./package.json
ARG GITHUB_TOKEN
RUN yarn --pure-lockfile && \
    NODE_OPTIONS="--max_old_space_size=8192" yarn theia build && \
    yarn theia download:plugins && \
    yarn --production && \
    yarn autoclean --init && \
    echo *.ts >> .yarnclean && \
    echo *.ts.map >> .yarnclean && \
    echo *.spec.* >> .yarnclean && \
    yarn autoclean --force && \
    yarn cache clean

################################################################################ BUILD NBVIEWER

FROM python:3.8-buster as nbviewerbuilder

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    ca-certificates \
    libcurl4-gnutls-dev \
    git \
    nodejs \
    npm

RUN apt-get install -y libmemcached-dev zlib1g-dev

# Python requirements
COPY nbviewer/requirements-dev.txt /srv/nbviewer/
COPY nbviewer/requirements.txt /srv/nbviewer/
RUN python3 -mpip install -r /srv/nbviewer/requirements-dev.txt 
RUN python3 -mpip install -r /srv/nbviewer/requirements.txt

WORKDIR /srv/nbviewer

# Copy source tree in
COPY nbviewer /srv/nbviewer
RUN python3 setup.py build && \
    python3 -mpip wheel -vv . -w /wheels

################################################################################ IMAGE

FROM ${DEPLOY_IMAGE}

USER root

RUN apt-get update \
    && rm -rf /opt/theia \
    && mkdir -p -m 777 /opt/theia \
    && cd /opt/theia && nodeenv --node=12.18.3 env && . env/bin/activate \
    && mkdir -p -m 777 /home/project \
    && apt-get install -y libsecret-1-dev

COPY --from=theia-builder /opt/theia /opt/theia
COPY settings.json /home/abc/.theia/settings.json

COPY --from=nbviewerbuilder /wheels /wheels
# To change the number of threads use env var NBVIEWER_THREADS
ENV LANG=C.UTF-8 NBVIEWER_THREADS=2

COPY supervisord-notebooks.conf /etc/supervisord/

COPY notebooks-requirements.txt /home/abc/installed-python-packages
COPY luigi/ /opt/luigi/
COPY examples/ /home/examples/

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml
COPY ./mkdocs/img/* /home/docs/docs/assets/home/
COPY ./mkdocs/helpers.py /home/docs/macros
COPY ./mkdocs/README.md /home/docs/docs/README.md

RUN echo "------------------------------------------------------ Nbviewer" \
    && apt-get -y update \
    && apt-get install -yq --no-install-recommends ca-certificates libcurl4 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && mkdir /opt/nbviewer \
    && cd /opt/nbviewer && python3 -m venv venv && . venv/bin/activate \
    && pip install --no-cache /wheels/* && deactivate \
    && rm -rf /wheels \ 
    && mkdir -p /home/project/nbviewer \
    && echo "------------------------------------------------------ system nodejs-18" \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - \
    && apt-get install -y nodejs \
    && npm install --global yarn \
    && echo "------------------------------------------------------ Packages, prep" \
    && pip install -r /home/abc/installed-python-packages/notebooks-requirements.txt \
    && mkdir /var/log/jupyter \
    && echo "------------------------------------------------------ Luigi" \
    && mkdir -p /etc/service/luigid/ \
    && mkdir /var/log/luigi \
    && echo "------------------------------------------------------ user" \
    && chown -R abc /opt/theia \
    && chown -R abc /opt/nbviewer \
    && chown -R abc /home/project/nbviewer \
    && chown -R abc /etc/service/luigid/ \
    && chown -R abc /var/log/jupyter \
    && chown -R abc /var/log/luigi \
    && find /home -type d | xargs -I{} chown -R abc {} 

USER abc

RUN echo "------------------------------------------------------ Pipx" \
    && python3 -m pip install --user pipx \
    && echo "------------------------------------------------------ Miniconda" \
    && mkdir -p /home/abc/miniconda3/ \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.12.0-Linux-x86_64.sh -O /home/abc/miniconda3/miniconda.sh \
    && bash /home/abc/miniconda3/miniconda.sh -b -u -p /home/abc/miniconda3 \
    && rm /home/abc/miniconda3/miniconda.sh \
    && /home/abc/miniconda3/bin/conda init zsh \
    && /home/abc/miniconda3/bin/conda init bash \
    && echo "------------------------------------------------------ Jupyter" \
    && /home/abc/miniconda3/bin/conda install -y -c conda-forge jupyterlab==3.4.2 \
    && echo "------------------------------------------------------ Voila" \
    && mkdir /home/project/voila 

RUN echo "------------------------------------------------------ Mercury" \
    && pip install mljar-mercury==0.8.6 

ENV PATH="/home/abc/miniconda3/bin:$PATH"



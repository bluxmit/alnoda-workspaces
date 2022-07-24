ARG docker_registry=docker.io/alnoda
ARG image_tag=3.0-3.8

## Images used:
ARG BUILD_IMAGE=node:12.18.3
ARG DEPLOY_IMAGE=${docker_registry}/python-automate-workspace:${image_tag}

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

################################################################################ IMAGE

FROM ${DEPLOY_IMAGE}

USER root

RUN apt-get update \
    && rm -rf /opt/theia \
    && mkdir -p /opt/theia \
    && cd /opt/theia && nodeenv --node=12.18.3 env && . env/bin/activate \
    && mkdir -p /home/project \
    && apt-get install -y libsecret-1-dev

COPY --from=theia-builder /opt/theia /opt/theia

# Programs to start
COPY supervisord-notebooks.conf /etc/supervisord/
# Override - remove Ungit to reduce resource consumption
COPY supervisord-workspace-base.conf /etc/supervisord/

COPY notebooks-requirements.txt /home/abc/installed-python-packages
COPY jupyter-requirements.txt /home/abc/installed-python-packages
COPY luigi/ /home/abc/luigi/
COPY examples/ /home/examples/
COPY tutorials/ /home/project/tutorials/

COPY settings.json /home/abc/.theia/settings.json

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml
COPY ./mkdocs/img/* /home/docs/docs/assets/home/
COPY ./mkdocs/helpers.py /home/docs/macros
COPY ./mkdocs/README.md /home/docs/docs/README.md
COPY ./mkdocs/present.md /home/docs/docs/pages/present.md
COPY ./mkdocs/present /home/docs/docs/pages/present
COPY ./mkdocs/admin.md /home/docs/docs/pages/admin.md
COPY ./mkdocs/admin /home/docs/docs/pages/admin
COPY ./mkdocs/jupyter-circle.svg /home/docs/docs/assets/
COPY ./mkdocs/jupyter-circle-white.svg /home/docs/docs/assets/
COPY ./mkdocs/extra.css /home/docs/docs/stylesheets/
COPY ./mkdocs/about.md /home/docs/docs/about.md

RUN echo "------------------------------------------------------ system nodejs-18" \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - \
    && apt-get install -y nodejs \
    && npm install --global yarn \
    && echo "------------------------------------------------------ Packages, prep" \
    && apt-get install -y python-is-python3 \
    && pip install -r /home/abc/installed-python-packages/notebooks-requirements.txt \
    && mkdir /var/log/jupyter \
    && echo "------------------------------------------------------ Luigi" \
    && mkdir -p /etc/service/luigid/ \
    && mkdir /var/log/luigi \
    && echo "------------------------------------------------------ Pandoc (notebooks to PDF)" \
    && apt-get install -y pandoc \
    && apt-get install -y texlive-xetex texlive-fonts-recommended texlive-plain-generic \
    && echo "------------------------------------------------------ user" \
    && mkdir -p /usr/local/share/jupyter && chown -R abc /usr/local/share/jupyter \
    && chown -R abc /opt/theia \
    && chown -R abc /etc/service/luigid/ \
    && chown -R abc /var/log/jupyter \
    && chown -R abc /var/log/luigi \
    && mkdir /usr/etc && chown -R abc /usr/etc \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

USER abc

RUN echo "------------------------------------------------------ Pipx" \
    && python3 -m pip install --user pipx \
    && echo "------------------------------------------------------ Voila" \
    && mkdir /home/project/voila \
    && echo "------------------------------------------------------ Notebooks in terminal" \
    && pipx install nbterm \
    && pipx install nbclient \
    && pip install "nbconvert[webpdf]" \
    && echo "------------------------------------------------------ Jupyter-lux" \
    && jupyter nbextension install --py luxwidget \
    && jupyter nbextension enable --py luxwidget \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install luxwidget \
    && echo "------------------------------------------------------ Jupyter-qgrid (Jupyter only)" \
    && jupyter nbextension enable --py --sys-prefix widgetsnbextension \
    && jupyter nbextension enable --py --sys-prefix qgrid \
    && echo "------------------------------------------------------ lite/dark toggler" \
    && jupyter labextension install jupyterlab-topbar-extension jupyterlab-theme-toggle \
    && echo "------------------------------------------------------ Jupytext" \
    && jupyter serverextension enable jupytext \
    && jupyter nbextension install --py jupytext \
    && jupyter nbextension enable --py jupytext \ 
    && jupyter labextension install jupyterlab-jupytext \
    && jupyter labextension enable jupyterlab-jupytext 

COPY mercury/mercury-requirements.txt /home/abc/installed-python-packages
RUN echo "------------------------------------------------------ Mercury" \
    && pip install -r /home/abc/installed-python-packages/mercury-requirements.txt \
    && pip install mljar-mercury --ignore-installed --no-deps 

ENV PATH="/home/abc/miniconda3/bin:$PATH" \
    LUIGI_CONFIG_PATH="/home/abc/luigi/luigi.conf"




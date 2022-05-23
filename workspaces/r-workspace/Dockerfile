ARG docker_registry=docker.io/alnoda
ARG image_tag=2.2

FROM ${docker_registry}/base-workspace:${image_tag}
USER root

COPY supervisord-rstudio.conf /etc/supervisord/

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml 
COPY ./mkdocs/helpers.py /home/docs/macros
COPY ./mkdocs/RStudio.png /home/docs/docs/assets/home/
COPY ./mkdocs/README.md /home/docs/docs/README.md

### R
ENV R_VERSION=4.2.0 \
    R_HOME=/usr/local/lib/R \
    TZ=Etc/UTC \
    CRAN=https://packagemanager.rstudio.com/cran/__linux__/focal/latest \
    LANG=en_US.UTF-8 \
    S6_VERSION=v2.1.0.2 \
    RSTUDIO_VERSION=2022.02.2+485 \
    DEFAULT_USER=abc \
    PANDOC_VERSION=default \
    RSTUDIO_SERVER_HOST=0.0.0.0

ENV PATH=/usr/local/bin/:$PATH
ENV PATH=/usr/lib/rstudio-server/bin:$PATH

RUN cd /tmp && git clone https://github.com/rocker-org/rocker-versioned2.git \
    && mv /tmp/rocker-versioned2/scripts /rocker_scripts \
    && bash /rocker_scripts/install_R_source.sh \
    && bash /rocker_scripts/setup_R.sh \
    && mkdir /var/log/rstudio \
    && bash /rocker_scripts/install_rstudio.sh \
    && rstudio-server stop || true \
    && echo "------------------------------------------------------ user" \
    && chown -R abc /etc/rstudio \
    && chown -R abc /usr/lib/rstudio-server \
    && chown -R abc /var/lib/rstudio-server \
    && chown -R abc /var/log/rstudio \ 
    && chown -R abc /usr/local/lib/R \
    && mkdir /home/abc/.rserver && chown -R abc /home/abc/.rserver \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

USER abc

COPY rstudio/database.conf /home/abc/.rserver
ENV USER=abc

RUN echo "------------------------------------------------------ some cleaning because Rstudio workdir is /home/abc/" \
    && rm -rf /home/abc/installed-python-packages \
    && rm -rf /home/abc/utils

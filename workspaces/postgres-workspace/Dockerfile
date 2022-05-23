
ARG docker_registry=docker.io/alnoda
ARG image_tag=2.2

## Images used:
ARG BUILD_IMAGE=node:12.18.3
ARG DEPLOY_IMAGE=${docker_registry}/base-workspace:${image_tag}
ARG MKDOCS_COPY_IMAGE=${docker_registry}/ide-workspace:${image_tag}

################################################################################ BUILD

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

FROM ${MKDOCS_COPY_IMAGE} as docs_image
FROM dimitri/pgloader:ccl.latest as pgloader-builder
FROM ${DEPLOY_IMAGE}

USER root

RUN apt-get update \
    && mkdir -p -m 777 /opt/theia \
    && cd /opt/theia && nodeenv --node=12.18.3 env && . env/bin/activate \
    && mkdir -p -m 777 /home/project \
    && apt-get install -y libsecret-1-dev

COPY --from=theia-builder /opt/theia /opt/theia
COPY settings.json /home/abc/.theia/settings.json
COPY supervisord-postgres.conf /etc/supervisord/

COPY --from=docs_image /home/docs/ /home/docs/
COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml 

COPY schemaspy/schemaspy.sh /opt/schemaspy/schemaspy.sh

ENV SHELL=/bin/bash \
    THEIA_DEFAULT_PLUGINS=local-dir:/opt/theia/plugins \
    USE_LOCAL_GIT=true \
    HOME=/home/abc \
    PATH="/home/abc/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/postgresql/14/bin" \
    NVM_DIR=/home/abc/.nvm \
    PGDATA="/var/postgres"

COPY --from=pgloader-builder /usr/local/bin/pgloader  /usr/bin/pgloader

RUN echo "------------------------------------------------------ postgres" \
    && sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
    && apt-get update \
    && apt-get -y install postgresql-12 \
    && apt-get -y install postgresql-13 \
    && apt-get -y install postgresql-14 \
    && ln -s /usr/lib/postgresql/14/bin/pg_dump /usr/bin/pg_dump_14 \
    && ln -s /usr/lib/postgresql/14/bin/pg_dumpall /usr/bin/pg_dumpall_14 \
    && ln -s /usr/lib/postgresql/14/bin/pg_restore /usr/bin/pg_restore_14 \
    && ln -s /usr/lib/postgresql/14/bin/psql /usr/bin/psql_14 \
    && ln -s /usr/lib/postgresql/13/bin/pg_dump /usr/bin/pg_dump_13 \
    && ln -s /usr/lib/postgresql/13/bin/pg_dumpall /usr/bin/pg_dumpall_13 \
    && ln -s /usr/lib/postgresql/13/bin/pg_restore /usr/bin/pg_restore_13 \
    && ln -s /usr/lib/postgresql/13/bin/psql /usr/bin/psql_13 \
    && ln -s /usr/lib/postgresql/12/bin/pg_dump /usr/bin/pg_dump_12 \
    && ln -s /usr/lib/postgresql/12/bin/pg_dumpall /usr/bin/pg_dumpall_12 \
    && ln -s /usr/lib/postgresql/12/bin/pg_restore /usr/bin/pg_restore_12 \
    && ln -s /usr/lib/postgresql/12/bin/psql /usr/bin/psql_12 \
    && echo "------------------------------------------------------ java" \
    && apt-get -y update \
    && apt-get install -y openjdk-8-jre \
    && echo "------------------------------------------------------ python" \
    && apt-get install -y libpq-dev python-dev python3-dev python3.8-dev \
    && pip install psycopg2==2.9.3 \
    && pip install pgcli==3.3.1 \
    && echo "------------------------------------------------------ nodejs" \
    && apt-get -y install curl dirmngr apt-transport-https lsb-release ca-certificates \
    && curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
    && apt-get install -y nodejs \
    && echo "------------------------------------------------------ rclone" \
    && curl https://rclone.org/install.sh | bash \
    && echo "------------------------------------------------------ pspg" \
    && apt-get install -y pspg \
    && echo "------------------------------------------------------ pgmetrics" \
    && cd /tmp && wget https://github.com/rapidloop/pgmetrics/releases/download/v1.12.0/pgmetrics_1.12.0_linux_amd64.tar.gz \
    && tar -xzf /tmp/pgmetrics_1.12.0_linux_amd64.tar.gz  \
    && chmod +x /tmp/pgmetrics_1.12.0_linux_amd64/pgmetrics \
    && mv /tmp/pgmetrics_1.12.0_linux_amd64/pgmetrics /usr/bin/pgmetrics \
    && rm /tmp/pgmetrics_1.12.0_linux_amd64.tar.gz \
    && rm -rf /tmp/pgmetrics_1.12.0_linux_amd64 \
    && echo "------------------------------------------------------ pg_sample" \
    && git clone https://github.com/mla/pg_sample.git /opt/pg_sample \
    && ln -s /opt/pg_sample/pg_sample /usr/bin/pg_sample \
    && echo "------------------------------------------------------ pgcenter" \
    && cd /tmp && wget https://github.com/lesovsky/pgcenter/releases/download/v0.9.2/pgcenter_0.9.2_linux_amd64.deb \
    && apt-get install -y /tmp/pgcenter_0.9.2_linux_amd64.deb \
    && rm /tmp/pgcenter_0.9.2_linux_amd64.deb \
    && echo "------------------------------------------------------ pgclimb" \
    && cd /tmp && wget -O pgclimb https://github.com/lukasmartinelli/pgclimb/releases/download/v0.3/pgclimb_linux_amd64 \
    && chmod +x /tmp/pgclimb \
    && mv /tmp/pgclimb /usr/bin/pgclimb \
    && echo "------------------------------------------------------ pgfutter" \
    && cd /tmp && wget https://github.com/lukasmartinelli/pgfutter/releases/download/v1.2/pgfutter_linux_386 \
    && chmod +x /tmp/pgfutter_linux_386 \
    && mv /tmp/pgfutter_linux_386 /usr/bin/pgfutter \
    && echo "------------------------------------------------------ sqitch" \
    && apt-get install -y sqitch libdbd-pg-perl libdbd-sqlite3-perl sqlite3 \
    && echo "------------------------------------------------------ yuniql" \
    && curl https://github.com/rdagumampan/yuniql/releases/download/v1.1.55/yuniql-cli-linux-x64-latest.tar.gz -L -o /tmp/yuniql.tar.gz \
    && tar -xvzf /tmp/yuniql.tar.gz -C /bin \
    && rm /tmp/yuniql.tar.gz \
    && echo "------------------------------------------------------ migra" \
    && pip install migra==3.0.1621480950 \
    # && echo "------------------------------------------------------ pgsh" \
    # && npm i -g yarn@latest \
    # && yarn global add pgsh \
    && echo "------------------------------------------------------ yandex-pgmigrate" \
    && pip install yandex-pgmigrate==1.0.6 \
    && echo "------------------------------------------------------ synth" \
    && curl -sSL https://getsynth.com/install | sh \
    && echo "------------------------------------------------------ mock-data" \
    && curl https://github.com/faisaltheparttimecoder/mock-data/releases/download/v3.0/mock-linux-amd64-v3.0 -L -o /tmp/mock \
    && chmod +x /tmp/mock \
    && mv /tmp/mock /usr/bin/mock \
    && echo "------------------------------------------------------ pev-2" \
    && cd /tmp && wget https://github.com/dalibo/pev2/releases/download/v0.24.0/pev2.tar.gz \
    && tar -xzf /tmp/pev2.tar.gz \
    && mkdir /opt/pev2 && mv pev2 /opt/pev2 \
    && rm /tmp/pev2.tar.gz \
    && cd /opt/pev2 && nodeenv --node=12.18.3 env && . env/bin/activate && npm install -g http-server \
    && echo "------------------------------------------------------ pgflame" \
    && cd /tmp && wget https://github.com/mgartner/pg_flame/releases/download/v1.2/pg_flame_1.2_Linux_i386.tar.gz \
    && tar -xzf /tmp/pg_flame_1.2_Linux_i386.tar.gz \
    && chmod +x /tmp/pg_flame \
    && mv /tmp/pg_flame /usr/bin/pg_flame \
    && rm /tmp/pg_flame_1.2_Linux_i386.tar.gz \
    && echo "------------------------------------------------------ schemaspy" \
    && cd /tmp && wget https://github.com/schemaspy/schemaspy/releases/download/v6.1.0/schemaspy-6.1.0.jar \
    && mv /tmp/schemaspy-6.1.0.jar /opt/schemaspy/schemaspy.jar \
    && cd /opt/schemaspy && wget https://jdbc.postgresql.org/download/postgresql-42.3.1.jar \
    && apt-get install -y graphviz \
    && chmod +x /opt/schemaspy/schemaspy.sh \
    && ln -s /opt/schemaspy/schemaspy.sh /usr/bin/schemaspy \
    && echo "------------------------------------------------------ tbls" \
    && cd /tmp && wget https://github.com/k1LoW/tbls/releases/download/v1.54.2/tbls_v1.54.2_linux_amd64.tar.gz \
    && mkdir /tmp/tbls  && tar -xzf /tmp/tbls_v1.54.2_linux_amd64.tar.gz --directory /tmp/tbls \
    && chmod +x /tmp/tbls/tbls \
    && mv /tmp/tbls/tbls /usr/bin/ \
    && rm -rf /tmp/tbls && rm tbls_v1.54.2_linux_amd64.tar.gz \
    && echo "------------------------------------------------------ dbdesigner" \
    && git clone https://github.com/akreienbring/dbdesigner /opt/dbdesigner \
    && cd /opt/dbdesigner && nodeenv --node=12.18.3 env && . env/bin/activate && npm install --save express \
    && rm /opt/dbdesigner/dist/startUp.js \
    && echo "------------------------------------------------------ erd-go" \
    && cd /tmp && wget https://github.com/kaishuu0123/erd-go/releases/download/v2.0.0/linux_amd64_erd-go \
    && chmod +x /tmp/linux_amd64_erd-go \
    && mv /tmp/linux_amd64_erd-go /usr/bin/erd-go \
    && cd /tmp && wget https://github.com/kaishuu0123/erd-go/releases/download/v2.0.0/linux_amd64_erd-go \
    && echo "------------------------------------------------------ sqlfluff" \
    && pip install sqlfluff==0.9.4 \
    && echo "------------------------------------------------------ user" \
    && mkdir /var/log/postgres && chown -R abc /var/log/postgres \
    && chown -R abc /var/log/postgresql \
    && mkdir /var/postgres && chown -R abc /var/postgres \
    && chmod 777 /var/run/postgresql \
    && chown -R abc /opt/dbdesigner \
    && chown -R abc /opt/pev2 \
    && mkdir /var/log/dbdesigner && chown -R abc /var/log/dbdesigner \
    && chown -R abc /opt/schemaspy \
    && chown -R abc /opt/pg_sample \
    && echo "export PAGER='pspg -s 4 --interactive --no-mouse'" >> ~/.zshrc \
    && chown -R abc /opt/theia \
    && mkdir -p /var/log/theia && chown -R abc /var/log/theia \
    && chown -R abc /home/docs \
    && chown -R abc /home/abc/utils \
    && chown -R abc /home/abc/installed-python-packages \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {}

COPY dbdesigner/startUp.js /opt/dbdesigner/dist/startUp.js

USER abc

ARG docker_registry=docker.io/alnoda
ARG image_tag=3.0

FROM ${docker_registry}/ide-workspace:${image_tag}
USER root

COPY supervisord-sqlite.conf /etc/supervisord/

# Customize mkdocs
COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml 
COPY ./mkdocs/README.md /home/docs/docs/README.md
COPY ./mkdocs/img/* /home/docs/docs/assets/home/
COPY ./mkdocs/helpers.py /home/docs/macros 
COPY ./mkdocs/sqlite-circle.svg /home/docs/docs/assets/
COPY ./mkdocs/sqlite-circle-white.svg /home/docs/docs/assets/
COPY ./mkdocs/extra.css /home/docs/docs/stylesheets/
COPY ./mkdocs/about.md /home/docs/docs/about.md
COPY ./mkdocs/admin.md /home/docs/docs/pages/admin.md
COPY ./mkdocs/admin /home/docs/docs/pages/admin

RUN echo "------------------------------------------------------ sqlite3" \
    && cd /opt && wget https://sqlite.org/2021/sqlite-autoconf-3350400.tar.gz \
    && tar zxvf /opt/sqlite-autoconf-3350400.tar.gz \
    && cd /opt/sqlite-autoconf-3350400 \
    && ./configure --prefix=/usr     \
            --disable-static  \
            --enable-fts5     \
            CPPFLAGS="-DSQLITE_ENABLE_FTS3=1  \
            -DSQLITE_ENABLE_FTS4=1            \
            -DSQLITE_ENABLE_COLUMN_METADATA=1 \
            -DSQLITE_ENABLE_UNLOCK_NOTIFY=1   \
            -DSQLITE_ENABLE_DBSTAT_VTAB=1     \
            -DSQLITE_SECURE_DELETE=1          \
            -DSQLITE_ENABLE_FTS3_TOKENIZER=1" \
    && make \
    && make install \
    && rm /opt/sqlite-autoconf-3350400.tar.gz \
    && echo "------------------------------------------------------ cli" \
    && pip install litecli==1.9.0 \
    && echo "------------------------------------------------------ rclone" \
    && curl https://rclone.org/install.sh | bash \
    && echo "------------------------------------------------------ pspg" \
    && apt-get install -y pspg \
    && echo "------------------------------------------------------ sqlite-browser" \
    && pip install sqlite-web==0.4.0 \
    && echo "------------------------------------------------------ sqlean main extension set" \
    && mkdir /home/sqlite-extensions && cd /home/sqlite-extensions \
    && wget https://github.com/nalgeon/sqlean/releases/download/0.15.1/crypto.so \
    && wget https://github.com/nalgeon/sqlean/releases/download/0.15.1/fileio.so \
    && wget https://github.com/nalgeon/sqlean/releases/download/0.15.1/fuzzy.so \
    && wget https://github.com/nalgeon/sqlean/releases/download/0.15.1/ipaddr.so \
    && wget https://github.com/nalgeon/sqlean/releases/download/0.15.1/re.so \
    && wget https://github.com/nalgeon/sqlean/releases/download/0.15.1/spellfix.so \
    && wget https://github.com/nalgeon/sqlean/releases/download/0.15.1/stats.so \
    && wget https://github.com/nalgeon/sqlean/releases/download/0.15.1/text.so \
    && wget https://github.com/nalgeon/sqlean/releases/download/0.15.1/unicode.so \
    && wget https://github.com/nalgeon/sqlean/releases/download/0.15.1/uuid.so \
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
    && echo "------------------------------------------------------ sqlite viewers" \
    && git clone https://github.com/inloop/sqlite-viewer.git /home/static-server/sqlite-viewer \
    && git clone https://github.com/cyrilbois/Web-GUI-for-SQLite.git /home/static-server/web-gui-sqlite \
    && mv /home/static-server/web-gui-sqlite/Web-GUI-for-SQLite.html /home/static-server/web-gui-sqlite/index.html \
    && echo "------------------------------------------------------ user" \
    && chown -R abc /opt/theia \
    && mkdir -p /var/log/theia && chown -R abc /var/log/theia \
    && chown -R abc /opt/dbdesigner \
    && mkdir /var/log/dbdesigner && chown -R abc /var/log/dbdesigner \
    && mkdir /var/log/sqlite-web && chown -R abc /var/log/sqlite-web \
    && echo "export PAGER='pspg -s 4 --no-mouse'" >> /home/abc/.zshrc  \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

COPY dbdesigner/startUp.js /opt/dbdesigner/dist/startUp.js 

ENV SQLITE_VIEWER_URL=http://localhost:8022/sqlite-viewer/ \
    SQLITE_WEB_GUI_URL=http://localhost:8022/web-gui-sqlite/ \
    SQLITE_WEB_CUSTOM_URL=http://localhost:8034/ \
    PORT=8030 

USER abc





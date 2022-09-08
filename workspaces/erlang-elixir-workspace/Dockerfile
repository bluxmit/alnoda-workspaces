ARG BUILD_IMAGE=node:12.18.3
ARG MAIN_IMAGE=alnoda/java-workspace:4.0-17
################################################################################ BUILD THEIA
FROM ${BUILD_IMAGE} 
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils \
    && apt-get install -y git \
    && apt-get install -y libsecret-1-dev \
    && mkdir /opt/theia
WORKDIR /opt/theia
ADD theia_package.json ./package.json
ARG GITHUB_TOKEN
RUN yarn --pure-lockfile && \
    NODE_OPTIONS="--max_old_space_size=4096" yarn theia build && \
    yarn theia download:plugins && \
    yarn --production && \
    yarn autoclean --init && \
    echo *.ts >> .yarnclean && \
    echo *.ts.map >> .yarnclean && \
    echo *.spec.* >> .yarnclean && \
    yarn autoclean --force && \
    yarn cache clean
################################################################################ WORKSPACE IMAGE
FROM ${MAIN_IMAGE} 

# Replace Theia with the new build, which includes additional pre-installed extensions
# To do this, the existing Theia folder will be deleted, and new copied from the build stage
ENV THEIA_DIR="/home/abc/apps/theia"
RUN rm -rf $THEIA_DIR \
    && mkdir "$THEIA_DIR" \
    && cd $THEIA_DIR && nodeenv --node=12.18.3 env && . env/bin/activate 
# Copy built Theia from the build image
COPY --from=0 --chown=abc:abc /opt/theia $THEIA_DIR

RUN sudo apt-get -y update \
    && echo "------------------------------------------------------ Erlang requirements" \
    && sudo apt-get -y install build-essential autoconf libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev \
    && echo "------------------------------------------------------ Kerl" \
    && cd /tmp && curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl \
    && chmod a+x kerl \
    && mv /tmp/kerl /home/abc/.local/bin/ \
    && kerl update releases 

RUN echo "------------------------------------------------------ Erlang/OTP (user) " \
    && kerl build 25.0 25.0 \
    && kerl install 25.0 /home/abc/erlang/25.0 \
    && export PATH="$PATH:/home/abc/erlang/25.0/bin" \
    && echo "------------------------------------------------------ Kiex, Elixir (user) " \
    && curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s \
    && export "PATH=$PATH:/home/abc/.kiex/bin" \
    && kiex install 1.13.4 

ENV PATH="$PATH:/home/abc/erlang/25.0/bin"
ENV PATH="$PATH:/home/abc/.kiex/bin"
ENV PATH="$PATH:/home/abc/.kiex/elixirs/elixir-1.13.4/bin"

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN pipx uninstall alnoda-wrk; pipx install alnoda-wrk; alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace
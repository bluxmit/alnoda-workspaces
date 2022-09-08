ARG BUILD_IMAGE=node:12.18.3
ARG MAIN_IMAGE=alnoda/extended-workspace:4.0
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

RUN echo "------------------------------------------------------ openjdk" \
    && sudo apt-get -y update \
    && sudo apt-get install -y openjdk-17-jre \
    && echo "------------------------------------------------------ kafka" \
    && cd /tmp && wget https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz \
    && tar -xzf kafka_2.13-3.1.0.tgz \
    && mv kafka_2.13-3.1.0 /home/abc/kafka \
    && rm kafka_2.13-3.1.0.tgz \
    && echo "------------------------------------------------------ kafkacat" \
    && sudo apt-get -y install kafkacat \
    && echo "------------------------------------------------------ kt" \
    && cd /tmp && wget https://github.com/fgeller/kt/releases/download/v13.0.0/kt-v13.0.0-linux-amd64.txz \
    && tar Jxvf kt-v13.0.0-linux-amd64.txz \
    && chmod +x /tmp/kt \
    && mv /tmp/kt /home/abc/.local/bin/kt \
    && rm /tmp/kt-v13.0.0-linux-amd64.txz \
    && echo "------------------------------------------------------ kafkactl" \
    && cd /tmp && wget https://github.com/deviceinsight/kafkactl/releases/download/v1.24.0/kafkactl_1.24.0_linux_386.tar.gz \
    && tar -xzf kafkactl_1.24.0_linux_386.tar.gz \
    && chmod +x /tmp/kafkactl \
    && mv /tmp/kafkactl /home/abc/.local/bin/kafkactl \
    && rm /tmp/kafkactl_1.24.0_linux_386.tar.gz \
    && echo "------------------------------------------------------ kcli" \
    && cd /tmp && wget https://github.com/cswank/kcli/releases/download/1.8.3/kcli_1.8.3_Linux_x86_64.tar.gz \
    && tar -xzf kcli_1.8.3_Linux_x86_64.tar.gz \
    && chmod +x /tmp/kcli \
    && mv /tmp/kcli /home/abc/.local/bin/kcli \
    && rm kcli_1.8.3_Linux_x86_64.tar.gz \
    && echo "------------------------------------------------------ trubka" \
    && cd /tmp && wget https://github.com/xitonix/trubka/releases/download/v3.2.1/trubka_3.2.1_linux_amd64.tar.gz \
    && tar -xzf trubka_3.2.1_linux_amd64.tar.gz \
    && chmod +x /tmp/trubka \
    && mv /tmp/trubka /home/abc/.local/bin/trubka \
    && rm trubka_3.2.1_linux_amd64.tar.gz

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/
ENV PATH="/usr/lib/jvm/java-17-openjdk-amd64/bin:$PATH"
    
USER abc






ARG docker_registry=docker.io/alnoda
ARG image_tag=2.2

## Images used:
# ARG BUILD_IMAGE=node:12.18.3
ARG DEPLOY_IMAGE=${docker_registry}/ansible-terraform-workspace:${image_tag}

# Theia rebuild here


FROM ${DEPLOY_IMAGE} 
USER root

RUN echo "------------------------------------------------------ AWS CLI" \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
    && cd /tmp && unzip /tmp/awscliv2.zip \
    && sh /tmp/aws/install \
    && rm /tmp/awscliv2.zip \
    && rm -r /tmp/aws \
    && echo "------------------------------------------------------ Pipx" \
    && python3 -m pip install --user pipx \
    && echo "------------------------------------------------------ Saws" \
    && pipx install saws
    && echo "------------------------------------------------------ Infra-graph" \
    && pipx install aws-infra-graph

USER abc
COPY settings.json /home/abc/.theia/settings.json

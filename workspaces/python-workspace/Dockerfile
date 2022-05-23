ARG docker_registry=docker.io/alnoda
ARG image_tag=2.2

FROM ${docker_registry}/ide-workspace:${image_tag}

USER root

COPY python-requirements.txt /home/abc/installed-python-packages
COPY ./examples/ /home/examples/
COPY .pylintrc /home/abc/

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml

RUN pip install -r /home/abc/installed-python-packages/python-requirements.txt \
    && echo "------------------------------------------------------ graphviz" \
    && apt-get update \
    && apt-get install -y graphviz \
    && apt-get install -y python3-pydotplus \
    && echo "------------------------------------------------------ utils" \
    && echo "alias python-report='/home/abc/utils/python-report.sh'" >> /home/abc/.zshrc \
    && chmod +x /home/abc/utils/python-report.sh && chown abc /home/abc/utils/python-report.sh \
    && echo "------------------------------------------------------ user" \
    && chown -R abc /home/abc/installed-python-packages \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 

USER abc
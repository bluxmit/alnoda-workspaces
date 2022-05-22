ARG docker_registry=docker.io/alnoda
ARG image_tag=2.1-3.8

FROM ${docker_registry}/python-workspace:${image_tag}
USER root

COPY mkdocs /home/docs
COPY docs/getting-started.md /home/docs/docs/getting-started.md
COPY streamlit /home/abc/.streamlit

RUN echo "------------------------------------------------------ streamlit" \
    && pip install streamlit==1.9.0 \
    && echo "------------------------------------------------------ user" \
    && rm -rf /home/examples \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 
    
COPY examples /home/examples

USER abc






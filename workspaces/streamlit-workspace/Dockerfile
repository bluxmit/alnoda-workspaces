ARG docker_registry=docker.io/alnoda
ARG image_tag=2.2-3.8

FROM ${docker_registry}/python-workspace:${image_tag}
USER root

COPY streamlit /home/abc/.streamlit

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml 
COPY ./mkdocs/helpers.py /home/docs/macros
COPY ./mkdocs/Streamlit.png /home/docs/docs/assets/home/
COPY ./mkdocs/README.md /home/docs/docs/README.md

RUN echo "------------------------------------------------------ streamlit" \
    && pip install streamlit==1.9.0 \
    && echo "------------------------------------------------------ user" \
    && rm -rf /home/examples \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 
    
COPY examples /home/examples

USER abc






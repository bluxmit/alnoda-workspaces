ARG docker_registry=docker.io/alnoda
ARG image_tag=3.0-3.8

FROM ${docker_registry}/python-workspace:${image_tag}
USER root

COPY streamlit /home/abc/.streamlit
COPY streamlit-requirements.txt /home/abc/installed-python-packages

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml 
COPY ./mkdocs/helpers.py /home/docs/macros
COPY ./mkdocs/Streamlit.png /home/docs/docs/assets/home/
COPY ./mkdocs/README.md /home/docs/docs/README.md
COPY ./mkdocs/streamlit-circle.svg /home/docs/docs/assets/
COPY ./mkdocs/streamlit-circle-white.svg /home/docs/docs/assets/
COPY ./mkdocs/extra.css /home/docs/docs/stylesheets/
COPY ./mkdocs/about.md /home/docs/docs/about.md


RUN echo "------------------------------------------------------ streamlit" \
    && pip install -r /home/abc/installed-python-packages/streamlit-requirements.txt \
    && echo "------------------------------------------------------ user" \
    && rm -rf /home/examples \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 
    
COPY examples /home/examples

USER abc






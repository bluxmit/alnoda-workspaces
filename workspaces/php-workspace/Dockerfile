ARG docker_registry=docker.io/alnoda
ARG image_tag=3.0

FROM ${docker_registry}/theia-workspace:${image_tag}
USER root

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml 
COPY ./mkdocs/php-circle.svg /home/docs/docs/assets/
COPY ./mkdocs/php-circle-white.svg /home/docs/docs/assets/
COPY ./mkdocs/extra.css /home/docs/docs/stylesheets/
COPY ./mkdocs/about.md /home/docs/docs/about.md

COPY settings.json /home/abc/.theia/settings.json

RUN echo "------------------------------------------------------ PHP " \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get -y update \
    && apt-get -y install php8.1 \
    && echo "------------------------------------------------------ modules" \
    && apt-get install -y php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath \
    && echo "------------------------------------------------------ Composer" \
    && cd /tmp && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv ./composer.phar /usr/bin/composer \
    && echo "------------------------------------------------------ user" \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 



pwarchol.vscode-php-file-link
rangav.vscode-thunder-client

USER abc






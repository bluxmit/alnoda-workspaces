ARG docker_registry=docker.io/alnoda
ARG image_tag=2.2

FROM ${docker_registry}/codeserver-workspace:${image_tag}
USER root

COPY ./mkdocs/mkdocs.yml /home/docs/mkdocs.yml 

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
    && mv ./composer.phar /usr/bin/composer

USER abc







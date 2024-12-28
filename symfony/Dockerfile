FROM alpine:latest

ENV HELPER_SCRIPTS_FOLDER=/usr/share/scripts
ENV SYMFONY_WEB_PATH=/var/www/symfony/

RUN mkdir -p -v ${HELPER_SCRIPTS_FOLDER}

COPY symfonyWebPath.txt ${HELPER_SCRIPTS_FOLDER}
COPY initSymfonyProject.sh ${HELPER_SCRIPTS_FOLDER}

RUN apk add --no-cache \
    coreutils \
    gettext \
    php-fpm \
    php-ctype \
    php-curl \
    php-dom \
    php-gd \
    php-iconv \
    php-json \
    php-intl \
    php-fileinfo\
    php-mbstring \
    php-opcache \
    php-openssl \
    php-pdo \
    php-pdo_mysql \
    php-mysqli \
    php-xml \
    php-xsl \
    php-zlib \
    php-phar \
    php-tokenizer \
    php-session \
    php-simplexml \
    php-zip \
    php-xmlwriter \
    php-sodium \
    php-pecl-apcu \
    make \
    curl

# Enable php8-xdebug if $PHP_XDEBUG_MODE is not empty
ARG PHP_XDEBUG_MODE=off
ARG PHP_XDEBUG_CLIENT_PORT=5902
ARG PHP_XDEBUG_CLIENT_HOST=host.docker.internal
COPY xdebug.ini  /etc/php8/conf.d/xdebug.ini.template
RUN if [[ "$PHP_XDEBUG_MODE" != "" ]]; then \
        apk add --no-cache php8-pecl-xdebug; \
        export PHP_XDEBUG_MODE=$PHP_XDEBUG_MODE; \
        export PHP_XDEBUG_CLIENT_PORT=$PHP_XDEBUG_CLIENT_PORT; \
        export PHP_XDEBUG_CLIENT_HOST=$PHP_XDEBUG_CLIENT_HOST; \
        envsubst < /etc/php8/conf.d/xdebug.ini.template > /etc/php8/conf.d/xdebug.ini; \
    fi
RUN rm -f /etc/php8/conf.d/xdebug.ini.template

RUN curl -sS https://getcomposer.org/installer | tee composer-setup.php \
    && php8 composer-setup.php && rm composer-setup.php* \
    && chmod +x composer.phar && mv composer.phar /usr/bin/composer \
    && ln -s /usr/bin/php8 /usr/local/bin/php

RUN apk add --update nodejs npm \
    && npm install --global yarn

COPY symfony.ini /etc/php8/conf.d/
COPY symfony.ini /etc/php8/cli/conf.d/

COPY symfony.pool.conf /etc/php8/php-fpm.d/

WORKDIR /var/www/symfony

CMD ["php-fpm83", "-F"]

EXPOSE 9001

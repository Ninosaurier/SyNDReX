FROM alpine:latest

ENV HELPER_SCRIPTS_FOLDER=/usr/share/scripts
ENV SYMFONY_WEB_PATH=/var/www/symfony/

RUN mkdir -p -v ${HELPER_SCRIPTS_FOLDER}

COPY symfonyWebPath.txt ${HELPER_SCRIPTS_FOLDER}
COPY initSymfonyProject.sh ${HELPER_SCRIPTS_FOLDER}


RUN echo ${SYMFONY_WEB_PATH} > ${HELPER_SCRIPTS_FOLDER}/symfonyWebPath.txt

RUN apk add --update --no-cache \
    coreutils \
    php-fpm \
    php8-apcu \
    php-ctype \
    php-curl \
    php-dom \
    php-gd \
    php-iconv \
    php8-pecl-imagick \
    php-json \
    php-intl \
    libmcrypt-dev \
    php-fileinfo\
    php-mbstring \
    php-opcache \
    php-openssl \
    php-pdo \
    php-pdo_mysql \
    php-mysqli \
    php-xml \
    php-zlib \
    php-phar \
    php-tokenizer \
    php-session \
    php-simplexml \
    php8-xdebug \
    php-zip \
    php-xmlwriter \
    make \
    curl


RUN echo "$(curl -sS https://composer.github.io/installer.sig) -" > composer-setup.php.sig \
        && curl -sS https://getcomposer.org/installer | tee composer-setup.php | sha384sum -c composer-setup.php.sig \
        && php composer-setup.php && rm composer-setup.php* \
        && chmod +x composer.phar && mv composer.phar /usr/bin/composer

COPY symfony.ini /etc/php8/conf.d/
COPY symfony.ini /etc/php8/cli/conf.d/
COPY xdebug.ini  /etc/php8/conf.d/

COPY symfony.pool.conf /etc/php8/php-fpm.d/

CMD ["php-fpm8", "-F"]

WORKDIR ${SYMFONY_WEB_PATH}

EXPOSE 9001

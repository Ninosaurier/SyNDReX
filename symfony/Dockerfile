FROM php:8.1.0-fpm

ENV HELPER_SCRIPTS_FOLDER=/usr/share/scripts
ENV SYMFONY_WEB_PATH=/var/www/symfony/

RUN mkdir -p -v ${HELPER_SCRIPTS_FOLDER}

COPY symfonyWebPath.txt ${HELPER_SCRIPTS_FOLDER}
COPY initSymfonyProject.sh ${HELPER_SCRIPTS_FOLDER}


RUN echo ${SYMFONY_WEB_PATH} > ${HELPER_SCRIPTS_FOLDER}/symfonyWebPath.txt
RUN chmod +x ${HELPER_SCRIPTS_FOLDER}/initSymfonyProject.sh

RUN echo "$(curl -sS https://composer.github.io/installer.sig) -" > composer-setup.php.sig \
        && curl -sS https://getcomposer.org/installer | tee composer-setup.php | sha384sum -c composer-setup.php.sig \
        && php composer-setup.php && rm composer-setup.php* \
        && chmod +x composer.phar && mv composer.phar /usr/bin/composer

RUN apt-get update && apt-get install -y libzip-dev

RUN docker-php-ext-install zip

COPY symfony.ini /etc/php/conf.d/
COPY symfony.ini /etc/php/cli/conf.d/
COPY xdebug.ini  /etc/php/conf.d/

COPY symfony.pool.conf /etc/php/php-fpm.d/

CMD ["php-fpm", "-F"]

WORKDIR ${SYMFONY_WEB_PATH}

EXPOSE 9001

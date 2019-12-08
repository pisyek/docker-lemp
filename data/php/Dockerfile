FROM php:7.4-fpm

RUN apt-get update && \
    apt-get install -y git zip

RUN docker-php-ext-install bcmath mysqli pdo pdo_mysql

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

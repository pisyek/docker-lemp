FROM php:7.4-fpm-alpine

RUN apk update && \
    docker-php-ext-install bcmath mysqli pdo_mysql && \
    rm -rf /var/www/html

COPY ./zz-php.ini /usr/local/etc/php/conf.d/zz-php.ini
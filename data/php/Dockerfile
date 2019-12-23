FROM php:7.4-fpm-alpine

RUN apk update && \
    docker-php-ext-install bcmath mysqli pdo_mysql

COPY ./php.ini /usr/local/etc/php/php.ini
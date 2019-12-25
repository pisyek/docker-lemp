FROM php:7.4-fpm-alpine

ARG HOST_USER_ID
ARG HOST_GROUP_ID

RUN apk update && \
    docker-php-ext-install bcmath mysqli pdo_mysql && \
    rm -rf /var/www/html

COPY ./zz-php.ini /usr/local/etc/php/conf.d/zz-php.ini

RUN apk add shadow && \
    usermod -u ${HOST_USER_ID} www-data && groupmod -g ${HOST_GROUP_ID} www-data

FROM php:7.4-fpm-alpine

ARG HOST_USER_ID
ARG HOST_GROUP_ID

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

RUN apk update && \
    install-php-extensions bcmath exif imagick mysqli pdo_mysql gd zip && \
    # run php as current user
    apk add shadow && \
    usermod -u ${HOST_USER_ID} www-data && groupmod -g ${HOST_GROUP_ID} www-data

COPY ./zz-php.ini /usr/local/etc/php/conf.d/zz-php.ini
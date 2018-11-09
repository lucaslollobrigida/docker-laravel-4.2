FROM php:7.0.4-fpm

ENV PATH="~/.composer/vendor/bin:./vendor/bin:${PATH}"

RUN apt-get update && apt-get install -y libmcrypt-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install mcrypt pdo_mysql
    && composer install


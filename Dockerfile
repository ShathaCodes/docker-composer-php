FROM php:7.3.0-apache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get update && apt-get install -y git libzip-dev unzip \
    && docker-php-ext-install zip \
	&& docker-php-ext-install pdo_mysql \
    && a2enmod rewrite headers

COPY . /var/www/html

FROM php:5.6-apache

RUN sed -i 's/docker-php-\(ext-$ext.ini\)/\1/' /usr/local/bin/docker-php-ext-install

RUN apt-get update \
    && apt-get install -y git  zlib1g-dev \
    && docker-php-ext-install mysql pdo_mysql zip

ADD docker/docker.conf /etc/apache2/sites-available/

ADD docker/symfony.ini /usr/local/etc/php/conf.d/
ADD docker/symfony.ini /etc/php5/cli/conf.d/

RUN ln -s /etc/apache2/sites-available/docker.conf /etc/apache2/sites-enabled/docker.conf

RUN usermod -u 1000 www-data

RUN a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

EXPOSE 80
EXPOSE 443

WORKDIR /var/www/docker
FROM php:7.4-fpm
RUN apt-get update \
    && apt-get install -y ghostscript curl libzip-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev git mariadb-client libmagickwand-dev openssh-client mupdf-tools --no-install-recommends
RUN docker-php-ext-install pdo_mysql zip \
    && pecl install imagick \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-enable imagick \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && curl -sS https://getcomposer.org/installer \
                 | php -- --install-dir=/usr/local/bin --filename=composer


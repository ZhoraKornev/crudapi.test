FROM php:7.4-fpm-buster

RUN apt update \
	&& apt install -y \
	    sudo \
		zip \
		unzip \
		nano \
		wget \
		curl \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libwebp-dev \
        libvpx-dev \
		zlib1g-dev \
		libicu-dev \
		libpng-dev \
		libxpm-dev \
		libzip-dev \
		libmemcached-dev \
		postgresql \
		libpq-dev \
		g++ \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Run docker-php-ext-install for available extensions
RUN docker-php-ext-configure intl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-configure gd --with-freetype --with-jpeg

ADD ./docker/dev/php/php.ini /usr/local/etc/php/php.ini

# install xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug \
    && echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_enable = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.idekey = \"PHPSTORM\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
#    && echo "xdebug.remote_port = 9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

COPY ./docker/dev/php/php_init.sh /usr/bin/
RUN chmod +x /usr/bin/php_init.sh

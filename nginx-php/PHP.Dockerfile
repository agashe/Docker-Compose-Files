FROM php:fpm

# Set Working Directory
WORKDIR /var/www

# Install PHP Extensions
RUN docker-php-ext-install pdo pdo_mysql
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install System Dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

#Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Clear Cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
FROM php:7.2-fpm

RUN apt-get update && \
    apt-get install -y git zip curl 

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# this gets the use of PDO working
RUN docker-php-ext-install pdo_mysql && docker-php-ext-enable pdo_mysql

# this allows nginx to download xml config files
RUN echo "security.limit_extensions = .php .php3 .php4 .php5 .php7 .xml" >> /usr/local/etc/php-fpm.d/www.conf

# Uncomment to have mysqli extension installed and enabled
# RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

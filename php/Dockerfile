FROM php:7.1-fpm-alpine

WORKDIR /var/www
RUN rm -rf html

# Configure PHP extensions and dependencies
RUN set -ex && apk --no-cache add \
    ca-certificates \
    openssh-client \
    git \
    libxml2-dev \
    curl-dev && \
    apk --no-cache add postgresql-dev postgresql=9.6.5-r0 --repository http://dl-cdn.alpinelinux.org/alpine/v3.6/main/

RUN docker-php-ext-install pdo pdo_pgsql pgsql zip xml curl mbstring

COPY docker.conf /usr/local/etc/php-fpm.d/
COPY php.logs.ini /usr/local/etc/php/conf.d/logs.ini

ENV LOG_STREAM="/tmp/stdout"
RUN mkfifo $LOG_STREAM && chmod 777 $LOG_STREAM
CMD ["/bin/sh", "-c", "php-fpm -D | tail -f $LOG_STREAM"]

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

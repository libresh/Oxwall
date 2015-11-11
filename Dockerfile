FROM php:5.6-fpm

RUN apt-get update && apt-get install -y \
      cron \
      libjpeg-dev \
      libfreetype6-dev \
      libpng12-dev \
      ssmtp \
      zip \
 && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr --with-png-dir=/usr --with-jpeg-dir=/usr \
 && docker-php-ext-install gd mbstring mysql pdo_mysql zip

ENV OXWALL_VERSION 1.8.0

VOLUME /var/www/html/

RUN curl -fsSL -o oxwall.zip \
      "http://www.oxwall.org/dl/oxwall-$OXWALL_VERSION.zip" \
 && mkdir -p /usr/src/oxwall \
 && mv oxwall.zip /usr/src \
 && cd /usr/src \ 
 && unzip oxwall.zip \
 && rm oxwall.zip

COPY php.ini /usr/local/etc/php/php.ini
COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]

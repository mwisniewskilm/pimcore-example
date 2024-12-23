FROM --platform=linux/amd64 pimcore/pimcore:PHP8.2-fpm-debug

ARG UID
ARG GID
ARG LOCAL_IP

WORKDIR /var/www/html

RUN usermod -s /bin/bash www-data \
    && groupmod --non-unique --gid $GID www-data \
    && usermod --non-unique --uid $UID --gid $GID www-data

RUN chown -R www-data:www-data /var/www

COPY xdebug.ini /usr/local/etc/php/conf.d/99-xdebug.ini
RUN echo "xdebug.client_host = $LOCAL_IP" >> /usr/local/etc/php/conf.d/99-xdebug.ini
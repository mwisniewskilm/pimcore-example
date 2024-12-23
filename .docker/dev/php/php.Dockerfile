FROM pimcore/pimcore:PHP8.2-fpm

ARG UID
ARG GID

WORKDIR /var/www/html

RUN usermod -s /bin/bash www-data \
    && groupmod --non-unique --gid $GID www-data \
    && usermod --non-unique --uid $UID --gid $GID www-data

RUN chown -R www-data:www-data /var/www
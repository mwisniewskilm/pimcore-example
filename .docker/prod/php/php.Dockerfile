FROM pimcore/pimcore:PHP8.2-fpm

ARG UID
ARG GID

WORKDIR /var/www/html

RUN usermod -s /bin/bash www-data \
    && groupmod --non-unique --gid $GID www-data \
    && usermod --non-unique --uid $UID --gid $GID www-data

# Update the package lists and install nginx
RUN apt update && apt install nginx -y && apt clean

# Copy the Nginx configuration
COPY default.conf /etc/nginx/sites-enabled/default
COPY start_pimcore.sh /var/www/html
RUN chmod +x /var/www/html/start_pimcore.sh

# Change ownership of the web directory to www-data
RUN chown -R www-data:www-data /var/www/html

# Switch to the www-data user
USER www-data

# Copy the application code
COPY ./app /var/www/html

# Install Composer dependencies
RUN composer install --no-cache

# Switch back to the root user (needed to start nginx)
USER root

CMD [ "/var/www/html/start_pimcore.sh" ]
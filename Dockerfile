FROM php:7.2-apache
RUN docker-php-ext-install mysqli
# Copy local code to the container image.
COPY src /var/www/html/

# Use port 8080 in Apache configuration files.
RUN sed -i 's/80/8080/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# Configure PHP for development.
# Switch to the production php.ini for production operations.
# RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
# https://hub.docker.com/_/php#configuration
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
EXPOSE 80
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]

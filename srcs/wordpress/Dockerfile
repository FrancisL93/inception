# Use the Nginx container we built earlier as the base image
FROM alpine:3.16.0

# Install PHP, PHP extensions, Nginx, and other dependencies
RUN apk update && apk add \
    php7 \
    php7-fpm \
    php7-mysqli \
    php7-zlib \
    php7-curl \
    php7-mbstring \
    php7-json \
    php7-session \
    nginx \
    supervisor \
    && rm -rf /var/cache/apk/*

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy the WordPress files into the container
COPY wordpress /usr/share/nginx/html

# Copy the default configuration file for PHP-FPM
COPY php-fpm.conf /etc/php7/php-fpm.conf

# Copy the supervisor configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose port 80 to the outside world
EXPOSE 80

# Set the entrypoint to the WordPress setup script
ENTRYPOINT ["/usr/share/nginx/html/wp-setup.sh"]

# Start supervisord to manage PHP-FPM and Nginx processes
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

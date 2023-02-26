# Use the Nginx container we built earlier as the base image
FROM alpine:3.16.0

# Install PHP and other dependencies
RUN apk update && apk add \
    php7 \
    php7-fpm \
    php7-mysqli \
    php7-zlib \
    php7-curl \
    php7-mbstring \
    php7-json \
    php7-session \
    && rm -rf /var/cache/apk/*

# Copy the WordPress files into the container
COPY wordpress /usr/share/nginx/html

# Copy the default configuration file for PHP-FPM
COPY php-fpm.conf /etc/php7/php-fpm.conf

# Expose port 80 to the outside world
EXPOSE 80

# Start PHP-FPM and Nginx
CMD ["php-fpm7", "-F", "-R", "-O", "-D", "&", "nginx", "-g", "daemon off;"]

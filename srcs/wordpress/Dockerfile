# Use Alpine Linux as the base image
FROM alpine:3.16

# Install required packages for WordPress and Apache
RUN apk add --no-cache \
    apache2 \
    apache2-utils \
    php8 \
    php8-apache2 \
    php8-json \
    php8-mysqli \
    php8-pdo \
    php8-pdo_mysql \
    php8-session \
    curl \
    tar \
    gzip \
    wget

# Download and extract the latest version of WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm -f latest.tar.gz && \
    rm -rf /var/www/localhost/htdocs && \
    mv wordpress /var/www/localhost/htdocs

RUN apk add --no-cache curl mysql-client php8-phar php8-json php8-mbstring
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp


# Set the working directory to /var/www/localhost/htdocs
WORKDIR /var/www/localhost/htdocs

# Copy the custom WordPress configuration file into the container
COPY wp-config.php .

# Expose port 80 for Apache
EXPOSE 80

# Start the Apache service when the container starts
CMD ["httpd", "-DFOREGROUND"]

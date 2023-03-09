FROM wordpress:latest

RUN apt-get update && \
    apt-get install -y curl less default-mysql-client

COPY ./install-wp.sh /var/www/html/
RUN chmod +x /var/www/html/install-wp.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]

#!/bin/bash

# Set database credentials
DB_NAME="wordpress"
DB_USER="root"
DB_PASSWORD="mysecretpassword"
DB_HOST="mysql"

# Wait for MySQL database to be ready
until mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD -e 'show databases'; do
  echo "Waiting for MySQL database to be ready..."
  sleep 1
done

# Download and extract WordPress
curl -O https://wordpress.org/latest.tar.gz
tar -zxvf latest.tar.gz
rm latest.tar.gz

# Move WordPress files to web server
cp -r wordpress/* /var/www/html/
rm -r wordpress

# Configure WordPress
wp core config --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --dbprefix=wp_ --extra-php <<PHP
define( 'WP_DEBUG', true );
PHP

# Install WordPress
wp core install --url=http://localhost:8000 --title="My WordPress Site" --admin_user=admin --admin_password=admin --admin_email=admin@example.com


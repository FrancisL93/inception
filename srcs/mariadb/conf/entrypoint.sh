#!/bin/bash

set -e

# Start MySQL
mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 --innodb-flush-method=O_DIRECT

# Create the phpmyadmin database
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS phpmyadmin"

# Import the phpmyadmin tables
mysql -u root -p$MYSQL_ROOT_PASSWORD phpmyadmin < /var/www/html/phpmyadmin/sql/create_tables.sql

# Set permissions
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES"

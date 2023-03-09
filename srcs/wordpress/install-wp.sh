#!/bin/bash

wp core install \
  --url="${WP_HOME}" \
  --title="${WORDPRESS_SITE_TITLE}" \
  --admin_user="${WORDPRESS_ADMIN_USER}" \
  --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
  --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
  --skip-email \
  --dbhost="${WORDPRESS_DB_HOST}"

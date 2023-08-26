#!/bin/bash

wp core download --allow-root
wp core config --dbname="$DB_DB" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HOST":"$DB_PORT" --dbprefix='wp_' --allow-root
wp core install --url="https://127.0.0.1" --title="My WordPress Site" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" --admin_email="admin@example.com" --allow-root
wp user create "$WP_DEFAULT_USER" "$WP_DEFAULT_USER@example.com" --role='subscriber' --user_pass="$WP_DEFAULT_PASS" --allow-root
wp option update comment_registration 1 --allow-root
exec /usr/sbin/php-fpm7.4 -F

#!/bin/bash

# Download WordPress core
wp core download --allow-root

# Configure WordPress
wp core config --dbname="$D_B" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HOST:$DB_PORT" --dbprefix='wp_' --allow-root

# Install WordPress
wp core install --url="$DOMAIN_NAME" --title="My WordPress Site" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" --admin_email="admin@example.com" --allow-root

# Create a subscriber user
wp user create "$WP_DEFAULT_USER" "$WP_DEFAULT_USER@example.com" --role='subscriber' --user_pass="$WP_DEFAULT_PASS" --allow-root

# Enable user registration
wp option update users_can_register 1 --allow-root

# Set default role to Subscriber
wp option update default_role subscriber --allow-root

# Start PHP-FPM
exec /usr/sbin/php-fpm7.4 -F
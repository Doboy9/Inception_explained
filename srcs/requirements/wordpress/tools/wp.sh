#!/bin/bash

# Wait for MariaDB to be available
echo "Waiting for MariaDB to be available..."
for i in {1..30}; do
    if mysqladmin ping -h mariadb --silent; then
        echo "MariaDB is up."
        break
    else
        echo "MariaDB not available, retrying in 10 seconds..."
        sleep 1
    fi
done

cd /var/www/html

if [ -f wp-config.php ]; then
    rm -rf wp-admin wp-content wp-includes wp-config.php
fi

if [ ! -f /usr/local/bin/wp ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
fi

mkdir -p /run/php


# wp cli is for configuring wordpress without writing directly the data in the wp config, with the variables contained in the .env
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${WORDPRESS_DATABASE} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PWD} --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=${WORDPRESS_URL} --title=${TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PWD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root
./wp-cli.phar user create ${WORDPRESS_USER} ${WORDPRESS_EMAIL} --role=subscriber --user_pass=${WORDPRESS_PASSWORD} --allow-root

chmod -R 775 wp-content

php-fpm7.4 -F
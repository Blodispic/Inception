#!/bin/bash

if [ ! -f "wp-config.php" ]; then

	wp config create --dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASS \
		--dbhost=$DB_HOST \
		--skip-check --allow-root

	wp core install --title=$WP_TITLE \
		--url=$WP_URL \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_APASS \
		--admin_email=$WP_AMAIL \
		--allow-root

	wp user create $WP_USER $WP_MAIL \
		--user_pass=$WP_PASS \
		--porcelain
		--allow-root
fi
php-fpm7.3 -F -R
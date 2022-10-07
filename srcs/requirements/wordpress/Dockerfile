FROM debian:buster

RUN     apt-get update \
                && apt-get upgrade -y

RUN apt-get install -y php-fpm php-mysql curl

EXPOSE 9000

RUN sed -i '36s/.*/listen = wordpress:9000/' /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
        && chmod +x wp-cli.phar \
        && mv wp-cli.phar /usr/local/bin/wp

RUN service php7.3-fpm start &&\
        wp core download --allow-root

COPY conf/wp_launcher.sh ./wp_launcher.sh

RUN chmod +x wp_launcher.sh

CMD sh wp_launcher.sh
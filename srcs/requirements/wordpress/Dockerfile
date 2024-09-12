FROM debian:bullseye

RUN apt update
RUN apt install -y php7.4-fpm php7.4-mysql curl mariadb-client unzip php-redis
RUN mkdir -p /usr/src/wordpress/wp-content/plugins
RUN curl -o /tmp/redis-cache.zip -fSL "https://downloads.wordpress.org/plugin/redis-cache.latest-stable.zip"
RUN unzip /tmp/redis-cache.zip -d /usr/src/wordpress/wp-content/plugins/

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY tools/wp.sh .

RUN chmod +x wp.sh

CMD ["./wp.sh"]
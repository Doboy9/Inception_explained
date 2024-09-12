FROM debian:bullseye

RUN apt update
RUN apt install -y redis-server

COPY conf/redis.conf /etc/redis/.

CMD ["redis-server", "/etc/redis/redis.conf"]
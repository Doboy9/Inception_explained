FROM debian:bullseye

RUN apt update
RUN apt install -y redis-server

COPY conf/redis.conf /usr/local/etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "--protected-mode", "no"]
FROM debian:bullseye

RUN apt update
RUN apt install -y npm
RUN npm install --global http-server
RUN mkdir /public


EXPOSE 8050
COPY conf/index.html /public/index.html

CMD ["http-server", "/public", "-p", "8050"]
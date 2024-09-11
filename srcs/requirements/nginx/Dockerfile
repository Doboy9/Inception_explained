FROM debian:bullseye
# We begin the installation of nignx by getting an image of debian bullseye version to work with 

RUN apt update && apt install -y nginx
#We update to see if everything is up to date and we download nginx, the -y is to say Y to a bash script, if not defined it would quit the image creation.
RUN mkdir -p /etc/nginx/ssl
# Creating a directory that will stock the certificate and the key for the secure connexion.
RUN apt install openssl -y
# OpenSSL is the tool for creationg and using SSL certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=42/CN=dboire.42.fr/UID=dboire"
# openssl req generate an SSL certificate / -x509 is the type of the certificate / -nodes out private key will not have a password / 
# out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key where to stock SSL certificate and key / 
# -subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=42/CN=dboire.42.fr/UID=dboire" will put these informations for us so we don't have to type anything
RUN mkdir -p /var/run/nginx
# Creating a directory that will stock nginx's config files
COPY conf/nginx.conf /etc/nginx/nginx.conf
# Copying the configuration file of nginx to the container so it can have access to it
CMD ["nginx", "-g", "daemon off;"]
# Will execute nginx with the directive to run in the foreground (foreground is very important because Docker expects the main process running in froeground, if it was run in background (with daemon) it would have exited directly, thinking that the main process has finished)

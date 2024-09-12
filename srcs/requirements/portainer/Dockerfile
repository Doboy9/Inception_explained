# Use debian:bullseye as the base image
FROM debian:bullseye

# Install necessary packages
RUN apt-get update && apt-get install -y curl ca-certificates

COPY conf/portainer.tar.gz .
RUN tar -xvf /portainer.tar.gz -C /usr/local/bin/ && chmod +x /usr/local/bin/portainer/portainer
RUN rm -rf portainer.tar.gz

# Create a directory for Portainer data
VOLUME /data

# Expose the necessary ports
EXPOSE 8000 9443

# Command to run Portainer
CMD ["/usr/local/bin/portainer/portainer"]
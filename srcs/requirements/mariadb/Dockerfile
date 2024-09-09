FROM debian:bullseye

# Installing mariadb
RUN apt-get update
RUN apt-get install -y mariadb-server
# Creating the directory /run/mysqld for MariaDB to store runtime files such as PID and socket file.
RUN mkdir /run/mysqld


# Copies a custom MariaDB config from the host to the container
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# Copies a script from the host to the container
COPY tools/mariadb.sh .

# Add execute permissions to the script bash we copied
RUN chmod +x mariadb.sh

# Launching it
CMD ["./mariadb.sh"]
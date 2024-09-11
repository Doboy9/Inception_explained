#!/bin/bash

# Initialization of the db owned by the mysql user and specifying where the database is (/var/lib/mysql which is the default data directory) 
mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Load mariadb in bootstrap mode as the mysql user, and passing an heredoc document that will be sent to the mariaDB server.
mariadbd --user=mysql --bootstrap <<EOF
# switching to the mysql database
USE mysql;
FLUSH PRIVILEGES;

# Removing the default user and database
DROP USER IF EXISTS ''@'localhost';
DROP DATABASE IF EXISTS test;

# Creating the Wordpress db and user with our environmment
CREATE DATABASE IF NOT EXISTS $WORDPRESS_DATABASE;
CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PWD';
GRANT ALL PRIVILEGES ON $WORDPRESS_DATABASE.* TO '$WORDPRESS_DB_USER'@'%';

# Changing the password of root user
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

# Launching MariaDB
exec mariadbd
#!/bin/bash

# Initialize the MariaDB database if it hasn't been initialized yet
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start the MariaDB server temporarily in the background
mysqld_safe --skip-networking &
until mysqladmin ping --silent; do
    echo "Waiting for MariaDB to start..."
    sleep 1
done

# Create the database and user using environment variables
cat << EOF > init.sql
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

mysql -u root -p${DB_ROOT_PASSWORD} < init.sql
rm -f init.sql

mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown

exec mysqld --bind-address=0.0.0.0

# To check if mariadb isn't empty, use the following command:
# mariadb
# SHOW DATABASES;
# USE <database>;
# SHOW TABLES;
# SELECT <anything> FROM <table>;
# EXIT;
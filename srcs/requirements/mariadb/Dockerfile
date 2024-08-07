FROM debian:buster

# mariadb installation
RUN apt upgrade -y
RUN apt update -y
RUN apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/mariadb.sh usr/local/bin/

RUN mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld && chmod 755 /var/run/mysqld

RUN chmod +x usr/local/bin/mariadb.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]


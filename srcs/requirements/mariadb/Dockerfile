FROM debian:buster

# mariadb installation
RUN apt upgrade
RUN apt update
RUN apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadb.sh usr/local/bin/mariadb.sh

RUN chmod +x usr/local/bin/mariadb.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]


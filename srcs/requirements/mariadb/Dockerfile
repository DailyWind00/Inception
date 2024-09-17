FROM debian:bullseye

COPY . .

RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y

EXPOSE 3306

ENTRYPOINT [ "sh", "tools/config.sh" ]

CMD [ "mysqld --bind-address=0.0.0.0" ]
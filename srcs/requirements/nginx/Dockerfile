FROM debian:buster

# nginx installation
RUN apt upgrade
RUN apt update
RUN apt install nginx -y

# TSL/SSL certificate installation
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y 
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=LeHavre/L=LeHavre/O=42/OU=42/CN=mgallais.42.fr/UID=mgallais"

# nginx config
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]

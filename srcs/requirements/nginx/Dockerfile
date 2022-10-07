FROM debian:buster

RUN apt-get update \
	&& apt-get upgrade -y

RUN apt-get install -y \
	nginx \
	openssl

COPY ./conf/default /etc/nginx/sites-available/default

RUN mkdir /path/ \
    && openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj \
    "/C=FR/ST=Rhone/L=Lyon/O=42/CN=rozhou.42.fr/emailAddress=rozhou@student.42lyon.fr" \
     -keyout /path/rozhou.42.fr.key -out /path/rozhou.42.fr.crt
     
CMD ["nginx", "-g", "daemon off;"]
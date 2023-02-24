# syntax=docker/dockerfile:1
FROM debian:buster

ENV TERM xterm

RUN apt-get update && apt-get install -y apt-utils \
libterm-readline-gnu-perl dialog \
    nginx \
    openssl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/jrasser.42.fr.crt -keyout /etc/ssl/jrasser.42.fr.key -subj "/C=FR/ST=Mulhouse/L=Mulhouse/O=42 School/OU=jrasser/CN=jrasser.42.fr"

COPY conf/nginx.conf /etc/nginx/conf.d
COPY ssl/jrasser.42.fr.crt /etc/ssl/
COPY ssl/jrasser.42.fr.key /etc/ssl/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

# syntax=docker/dockerfile:1
FROM debian:buster

ENV TERM xterm
ENV PATH /usr/local/bin:/usr/bin:/bin

#Install necessary package from php
RUN apt-get update && apt-get -y install apt-utils \
libterm-readline-gnu-perl dialog \
mariadb-client \
wget \
php \
php-cgi \
php-mysql \
php-fpm \
php-pdo \
php-gd php-cli \
php-mbstring \
&& rm -rf /var/lib/apt/lists/*

# COPY ./conf/www.conf /var/www/wordpress

#Create the folder to enable php start
RUN mkdir -p /run/php
WORKDIR /var/www/html

#Launch script
COPY ./conf/www.conf .
COPY ./conf/create_wp.sh .
RUN chmod +x create_wp.sh
ENTRYPOINT ["/var/www/html/create_wp.sh"]
# RUN /var/www/html/create_wp.sh

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]

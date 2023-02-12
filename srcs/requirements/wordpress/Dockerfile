# syntax=docker/dockerfile:1




















FROM alpine:3.15.6

#RUN adduser blog
#RUN chown -R blog:www-data /var/www/blog
#RUN chmod -R o-rwx /var/www/blog

RUN apk update
RUN apk add php7.3 php-mysqli php-fpm mariadb-client
#RUN apk add lighttpd php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml
#RUN apk add php-cli
#RUN apk add php-mysql
#RUN apk add php-curl
#RUN apk add php-gd
#RUN apk add php-intl
#RUN apk add php-fpm



# COPY ./blog.conf /etc/php/7.3/fpm/pool.d

# ADD https://ru.wordpress.org/wordpress-5.7.2-ru_RU.tar.gz /var/www/
# RUN cd /var/www && tar -xzvf wordpress-5.7.2-ru_RU.tar.gz
# RUN rm -f /var/www/wordpress-5.7.2-ru_RU.tar.gz
# RUN rm -f /var/www/wordpress/wp-config-sample.php
# COPY ./wp-config.php ./var/www/wordpress/

# RUN mkdir ./run/php/
# CMD ./usr/sbin/php-fpm7.3 -F












#COPY ./conf/blog.conf /etc/php/7.4/fpm/pool.d/blog.conf


# https://howto.wared.fr/installation-wordpress-ubuntu-nginx/





# docker build -t wp-image .
# docker run --name wordpress --network docker-network -d wp-image
# docker run --name wordpress -p 9000:80 wp-image
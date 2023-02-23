# syntax=docker/dockerfile:1
FROM debian:buster

ENV TERM xterm

#Install necessary package from php

RUN apt-get update && apt-get -y install apt-utils \
libterm-readline-gnu-perl dialog \
mariadb-client mariadb-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/run/mysqld \
    && chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./conf/mariadb-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/wp_save.sql /usr/local/bin/
COPY ./conf/create_db.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/create_db.sh
ENTRYPOINT [ "create_db.sh" ]
# USER mysql
CMD ["mysqld", "--skip-log-error", "--bind-address=0.0.0.0"]
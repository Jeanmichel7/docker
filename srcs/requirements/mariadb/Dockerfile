# syntax=docker/dockerfile:1
FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-client mariadb-server\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/run/mysqld \
    && chmod 777 /var/run/mysqld

# COPY ./conf/mariadb-server.cnf /etc/mysql/mariadb.conf.d/
# COPY ./conf/createdb.sql /
# RUN service mysql start && mysql < createdb.sql


# RUN service mysql start && mysql < createdb.sql
# RUN rm -f createdb.sql
EXPOSE 3306

COPY ./conf/mariadb-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/create_db.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
COPY ./conf/savedb.sql /usr/local/bin/

RUN chmod +x /usr/local/bin/create_db.sh
ENTRYPOINT [ "create_db.sh" ]
# USER mysql
CMD ["mysqld", "--skip-log-error", "--bind-address=0.0.0.0"]
# CMD ["service mysql start", "--skip-log-error"]
# CMD service mysql start --skip-log-error && mysql < createdb.sql




# ########################################################
# # syntax=docker/dockerfile:1
# #FROM nginx:1.23.1-alpine
# #COPY static-html-directory /usr/share/nginx/html



# #sudo apt-get install -y mariadb-server mariadb-client











# ################################################################################

# # syntax=docker/dockerfile:1
# #FROM nginx:1.23.1-alpine
# #COPY static-html-directory /usr/share/nginx/html
# #docker network create networ


# # attention latest avec nginx ?
# #docker run --detach --network network --name mariadb --env MARIADB_USER=example-user --env MARIADB_PASSWORD=my_secret --env MARIADB_ROOT_PASSWORD=my-secret-pw  mariadb:latest


# # connnection :
# # docker run -it --network network --rm mariadb mysql -hmariadb -uexample-user -p
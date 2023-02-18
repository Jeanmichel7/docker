# FROM alpine:3.16

# ARG DB_NAME \
#     DB_USER \
#     DB_PASS

# RUN apk update && apk add --no-cache mariadb mariadb-client

# RUN mkdir /var/run/mysqld; \
#     chmod 777 /var/run/mysqld; \
#     { echo '[mysqld]'; \
#       echo 'skip-host-cache'; \
#       echo 'skip-name-resolve'; \
#       echo 'bind-address=0.0.0.0'; \
#     } | tee  /etc/my.cnf.d/docker.cnf; \
#     sed -i "s|skip-networking|skip-networking=0|g" \
#       /etc/my.cnf.d/mariadb-server.cnf

# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# EXPOSE 3306

# COPY ./conf/create_db.sh .
# RUN sh create_db.sh && rm create_db.sh
# USER mysql
# CMD ["/usr/bin/mysqld", "--skip-log-error"]

# syntax=docker/dockerfile:1
FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-client mariadb-server\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

# RUN chmod 777 /run/mysqld/
# RUN chmod -R 777 /run/mysqld/
# RUN chmod -R 777 /var/run/mysqld/
# RUN chmod -R 777 /var/lib/mysql

# RUN chmod -R 777 /var
    # { echo '[mysqld]'; \
    #   echo 'skip-host-cache'; \
    #   echo 'skip-name-resolve'; \
    #   echo 'bind-address=0.0.0.0'; \
    # } | tee  /etc/my.cnf.d/docker.cnf; \
    # sed -i "s|skip-networking|skip-networking=0|g" \
    #   /etc/my.cnf.d/mariadb-server.cnf

# RUN mkdir /var/run/mysqld; \
#     chmod 777 /var/run/mysqld; 
#     # { echo '[mysqld]'; \
#     #   echo 'skip-host-cache'; \
#     #   echo 'skip-name-resolve'; \
#     #   echo 'bind-address=0.0.0.0'; \
#     # } | tee  /etc/my.cnf.d/docker.cnf; \
#     # sed -i "s|skip-networking|skip-networking=0|g" \
#     #   /etc/my.cnf.d/mariadb-server.cnf
# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# COPY ./conf/mariadb-server.cnf /etc/mysql/mariadb.conf.d/
# COPY ./conf/createdb.sql /
# RUN service mysql start && mysql < createdb.sql


# RUN service mysql start && mysql < createdb.sql
# RUN rm -f createdb.sql
EXPOSE 3306


COPY ./conf/create_db.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
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
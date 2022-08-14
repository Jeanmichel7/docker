# syntax=docker/dockerfile:1
FROM alpine:3.15.6

RUN apk update 
RUN apk add mariadb-server
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/createdb.sql /
RUN service mysql start && mysql < createdb.sql
RUN rm -f createdb.sql
CMD /usr/bin/mysqld_safe











########################################################
# syntax=docker/dockerfile:1
#FROM nginx:1.23.1-alpine
#COPY static-html-directory /usr/share/nginx/html



#sudo apt-get install -y mariadb-server mariadb-client











################################################################################

# syntax=docker/dockerfile:1
#FROM nginx:1.23.1-alpine
#COPY static-html-directory /usr/share/nginx/html
#docker network create networ


# attention latest avec nginx ?
#docker run --detach --network network --name mariadb --env MARIADB_USER=example-user --env MARIADB_PASSWORD=my_secret --env MARIADB_ROOT_PASSWORD=my-secret-pw  mariadb:latest


# connnection :
# docker run -it --network network --rm mariadb mysql -hmariadb -uexample-user -p
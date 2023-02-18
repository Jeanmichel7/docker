#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

#Check if the database exists

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 

	echo "Database already exists"
else

# Set root option so that connexion without root password is not possible
        echo "Securing mysql installation"
-S /bin/bash mysql_secure_installation <<_EOF_
Y
root4life
root4life
Y
n
Y
Y
_EOF_

#Add a root user on 127.0.0.1 to allow remote connexion

	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Create database and user for wordpress
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Import database
mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

fi

/etc/init.d/mysql stop

exec "$@"


# do_query() {
#   mariadb --protocol=socket -uroot -hlocalhost  <<< "$@"
# }

# if [ "$1" = 'mariadb' ]; then
#   if [ ! -f "$DATA_DIR/.mariadb" ]; then
#     # init mariadb datadir
#     mysql_install_db --rpm --auth-root-authentication-method=normal

#     # start temporary server for bootstrapping
#     gosu mysql mysqld --skip-networking --default-time-zone=SYSTEM --wsrep_on=OFF --expire-logs-days=0 --loose-innodb_buffer_pool_load_at_startup=0 &

#     # wait for server to start
#     while ! mysqladmin ping --silent; do
#         sleep 1
#     done

#     # get passwords from secret files
#     MARIADB_ROOT_PASSWORD=$(< /run/secrets/mariadb_root_password)
#     MARIADB_WORDPRESS_PASSWORD=$(< /run/secrets/mariadb_wordpress_password)

#     # change root password
#     do_query "UPDATE mysql.user SET Password=PASSWORD('$MARIADB_ROOT_PASSWORD') WHERE User='root';"

#     # delete remote root user
#     do_query "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

#     # delete anonymous users
#     do_query "DELETE FROM mysql.user WHERE User='';"

#     # # drop test database
#     do_query "DROP DATABASE IF EXISTS test;"
#     do_query "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"

#     # create wordpress database
#     do_query "CREATE DATABASE IF NOT EXISTS wordpress;"

#     # create wordpress user
#     do_query "CREATE USER 'wordpress' IDENTIFIED BY '$MARIADB_WORDPRESS_PASSWORD';"
#     do_query "GRANT ALL ON wordpress.* TO 'wordpress' ;"

#     # apply changes
#     do_query "FLUSH PRIVILEGES;"

#     # stop temporary server
#     MYSQL_PWD=$MARIADB_ROOT_PASSWORD mysqladmin shutdown -uroot

#     touch $DATA_DIR/.mariadb
#   fi

#   exec gosu mysql mysqld
# fi

# exec "$@"

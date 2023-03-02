#!/bin/sh
# sudo -u root /usr/bin/

#Check if the database exists

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 

	echo "Database already exists"
else
	mysql_install_db

	/etc/init.d/mysql start

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
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;\
        GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;\
        " | mysql -uroot

#Import database
	mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wp_save.sql
	# mysqladmin -u root password $MYSQL_ROOT_PASSWORD
	/etc/init.d/mysql stop
fi

# sudo -u root /usr/bin/mysqld_safe --datadir='/var/lib/mysql' --user=mysql --log-error=/var/log/mysql/error.log --pid-file=/var/run/mysqld/mysqld.pid

exec "$@"


# #!/bin/sh




# #Check if the database exists
# if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
# then 
# 	echo "Database already exists"

# else
# 	mysql_install_db --datadir=/var/lib/mysql
# 	/etc/init.d/mysql start

# 	#Create database and user for wordpress
# 	mysql_secure_installation << _EOF_
# Y
# $MYSQL_ROOT_PASSWORD
# $MYSQL_ROOT_PASSWORD
# Y
# Y
# Y
# Y
# _EOF_
	

# 	# echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -uroot

# 	# #Add a root user on 127.0.0.1 to allow remote connexion
# 	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

# 	# # #Create database and user for wordpress
# 	# echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -uroot
# 	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;\
#     #     GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;\
#     #     " | mysql -uroot

# 	#Import database
# 	mysql uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wp_save.sql
# 	# mysqladmin -u root password $MYSQL_ROOT_PASSWORD
# 	/etc/init.d/mysql stop
# fi

# # /etc/init.d/mysql stop

# exec "$@"

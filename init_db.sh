#!/bin/bash



/usr/bin/mysqld_safe &
sleep 5
mysql -u root -e "CREATE DATABASE test"
mysql -u root test < test.sql




PASS=123456
echo "=> Creating MySQL test user with ${_word} password"

mysql -uroot -e "CREATE USER 'test'@'%' IDENTIFIED BY '$PASS'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'test'@'%' WITH GRANT OPTION"

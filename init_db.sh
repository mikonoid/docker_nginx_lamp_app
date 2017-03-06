#!/bin/bash

/usr/bin/mysqld_safe &
sleep 5
mysql -u root -e "CREATE DATABASE test"
mysql -u root test < test.sql

#create user for test DB
PASS=123456
mysql -uroot -e "CREATE USER 'test'@'%' IDENTIFIED BY '$PASS'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'test'@'%' WITH GRANT OPTION"

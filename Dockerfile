FROM ubuntu:trusty
MAINTAINER Mike Ivanov mikonoid@gmail.com
#nginx_reverse_proxy+lamp stack+php_app

# Install all packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -y install nginx supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apc php5-mcrypt && \
  echo "ServerName localhost" >> /etc/apache2/apache2.conf

#Add configs and scripts
ADD start-apache2.sh /start-apache2.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD start-nginx.sh /start-nginx.sh
ADD start.sh /start.sh
RUN chmod 755 /*.sh
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf
ADD supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf
ADD supervisord-nginx.conf /etc/supervisor/conf.d/supervisord-nginx.conf

# Remove pre-installed database directory
RUN rm -rf /var/lib/mysql/*

# Add MySQL scripts 
ADD test.sql /test.sql
ADD init_db.sh /init_db.sh
RUN chmod 755 /*.sh

# apache config
ADD apache_default /etc/apache2/sites-available/000-default.conf
ADD apache_ports /etc/apache2/ports.conf
RUN a2enmod rewrite

#nginx config
ADD nginx_default /etc/nginx/sites-enabled/default

# Configure /www folder with php-application
RUN git clone https://github.com/mikonoid/-php_app_for_docker /www
RUN mkdir -p /www && rm -fr /var/www/html && ln -s /www /var/www/html

# Add volumes for MySQL 
VOLUME  ["/etc/mysql", "/var/lib/mysql" ]

EXPOSE 80 3306
CMD ["/start.sh"]

FROM php:7.1.2-apache 
RUN docker-php-ext-install mysqli
RUN apt-get install openssl
RUN a2enmod ssl
RUN service apache2 restart

COPY ./configs/ /etc/apache2/sites-available/


COPY ./cert/ /etc/apache2/ssl/

RUN mkdir -p /var/run/apache2/
RUN a2ensite 001-default.conf
RUN service apache2 restart

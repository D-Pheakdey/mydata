FROM php:8.3-apache

WORKDIR /var/www/html

COPY . /var/www/html/

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Install necessary PHP extensions
RUN apt-get update && apt-get upgrade -y && docker-php-ext-install mysqli pdo pdo_mysql

# Enable installed extensions
RUN docker-php-ext-enable mysqli pdo_mysql

# Set environment variables for MySQL
ENV MYSQL_HOST=db
ENV MYSQL_DATABASE=mydb
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=pass
ENV MYSQL_PORT=3306

# Expose port 80
EXPOSE 80

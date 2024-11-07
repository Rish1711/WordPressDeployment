# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Install dependencies
RUN docker-php-ext-install mysqli

# Copy the Apache configuration file
COPY config/apache-config.conf /etc/apache2/sites-available/000-default.conf

# Copy application files
COPY app/index.php /var/www/html/index.php

# Set up persistent storage for /wp-content
VOLUME /var/www/html/wp-content

# Set permissions for Apache
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Use the official PHP image with Apache
FROM php:8.1-apache

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli

# Copy website files to the Apache document root
COPY . /var/www/html/

# Set appropriate permissions for Apache access
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Copy custom Apache configuration file
COPY apache-custom.conf /etc/apache2/conf-enabled/

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]

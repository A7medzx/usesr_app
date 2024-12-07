# Use the official PHP 7.4 Apache image
FROM php:7.4-apache

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Update Apache's DocumentRoot to point to the right directory
RUN echo 'DocumentRoot /var/www/html' > /etc/apache2/sites-available/000-default.conf

# Update the Apache config to allow access to the htdocs directory
RUN sed -i 's#Directory /var/www/html#Directory /var/www/html/htdocs#' /etc/apache2/apache2.conf

# Copy only necessary files (you should create a .dockerignore file to ignore unwanted files)
COPY . /var/www/html/

# Change ownership of the files in the /var/www/html directory (for Apache to access them)
RUN chown -R www-data:www-data /var/www/html/

# Expose port 80 (default for Apache)
EXPOSE 80

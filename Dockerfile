# Use the official WordPress image from the Docker Hub
FROM wordpress:php8.3-apache

# Set environment variables for database connection
# These should be customized via the DigitalOcean App Platform environment variables settings
# ENV WORDPRESS_DB_HOST=your_database_host
# ENV WORDPRESS_DB_USER=your_database_user
# ENV WORDPRESS_DB_PASSWORD=your_database_password
# ENV WORDPRESS_DB_NAME=your_database_name

# Optionally, you can set the table prefix and other configurations
ENV WORDPRESS_TABLE_PREFIX=wp_
ENV WORDPRESS_DEBUG=1

# If you're using a different port (other than 3306) for MySQL
# ENV WORDPRESS_DB_PORT=your_database_port

# Install additional PHP extensions or perform any other necessary tasks
RUN apt-get update && \
    apt-get install -y --no-install-recommends ssl-cert && \
    a2enmod ssl && \
    a2ensite default-ssl && \
    service apache2 restart

# Copy any custom themes or plugins into the image
# Ensure you have the themes or plugins in the respective directories within your project
# COPY ./your-theme-path /var/www/html/wp-content/themes/your-theme
# COPY ./your-plugin-path /var/www/html/wp-content/plugins/your-plugin

# Expose port 80 for HTTP traffic
EXPOSE 80

# The base image handles the rest (configuring Apache, running WordPress, etc.)


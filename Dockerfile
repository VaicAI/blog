# Use the official WordPress image with PHP and Apache
FROM wordpress:php8.3-apache

# Install mysql-client
RUN apt-get update && \
    apt-get install -y mysql-client && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for MySQL database connection
# These should be customized via the DigitalOcean App Platform environment variables settings
ENV WORDPRESS_DB_HOST=db_host_here
ENV WORDPRESS_DB_USER=db_user_here
ENV WORDPRESS_DB_PASSWORD=db_password_here
ENV WORDPRESS_DB_NAME=db_name_here

CMD ["apache2-foreground"]

# Expose port 80 for HTTP access
EXPOSE 80


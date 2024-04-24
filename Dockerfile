# Use the official WordPress image with PHP and Apache
FROM wordpress:php8.3-apache

# Install mysql-client
RUN apt-get update && \
    apt-get install -y mysql-client && \
    rm -rf /var/lib/apt/lists/*


CMD ["apache2-foreground"]

# Expose port 80 for HTTP access
EXPOSE 80


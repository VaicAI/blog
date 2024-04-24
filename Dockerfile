# Use the official WordPress image with PHP and Apache
FROM wordpress:php8.3-apache

# Install openssl for base64 decoding (might already be included, but ensuring it)
RUN apt-get update && \
    apt-get install -y openssl && \
    rm -rf /var/lib/apt/lists/*

# Create a directory for SSL certificates if it doesn't already exist
RUN mkdir -p /etc/ssl/certs

# Assuming WORDPRESS_DB_CA contains the Base64-encoded certificate
# Decode and save the SSL CA certificate from an environment variable
RUN echo $WORDPRESS_DB_CA | base64 -d > /etc/ssl/certs/ca-cert.crt

# Ensure the certificate is readable
RUN chmod 644 /etc/ssl/certs/ca-cert.crt

ENV WORDPRESS_DB_SSL_CA=/etc/ssl/certs/ca-cert.crt

# Expose port 80 for HTTP traffic
EXPOSE 80

# The base image's ENTRYPOINT and CMD handle running Apache and managing WordPress


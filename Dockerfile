# Use the official Nginx image as the base
FROM nginx:stable

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy the custom configuration file into place
COPY reverse-proxy.conf /etc/nginx/conf.d/

# Expose port 80 to the outside once the container has launched
EXPOSE 80

# Use the default CMD from the nginx image which starts Nginx
CMD ["nginx", "-g", "daemon off;"]


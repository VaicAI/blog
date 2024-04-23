# Use the official Ghost image
FROM ghost:4-alpine

# Set the environment variable for the URL
ENV url=https://www.vaicai.com/blog

# Expose the default Ghost port
EXPOSE 2368


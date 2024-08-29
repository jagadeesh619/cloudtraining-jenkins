# Use the official Nginx image from Docker Hub
FROM nginx:latest

# Copy custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy your application files
COPY * /usr/share/nginx/html

# Expose port 80
EXPOSE 80

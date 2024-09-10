# Use Ubuntu as the base image
FROM ubuntu:latest

# Update package lists and install nginx
RUN apt-get update && apt-get install -y nginx

# Create index.html and index_tar.html in the /var/www/html directory
RUN echo "Welcome to my custom Nginx page!" > /var/www/html/index.html
RUN echo "Welcome to my tarred Nginx page!" > /var/www/html/index_tar.html

# Create a .tar file that contains index_tar.html
RUN tar -cvf /var/www/html/index.tar -C /var/www/html index_tar.html

# Expose port 80 to allow web traffic
EXPOSE 80

# Start nginx in the foreground (required by Docker containers)
CMD ["nginx", "-g", "daemon off;"]


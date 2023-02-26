# Use an official Alpine Linux runtime as a parent image
FROM alpine:3.16.0

# Install Nginx
RUN apk update && apk add nginx

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy the content of the current directory to the working directory
COPY . .

# Copy the default configuration file into the container
COPY ./nginx.conf /etc/nginx/nginx.conf

# Expose port 80 to the outside world
EXPOSE 80

# Set Nginx to use the default configuration file
CMD ["nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;"]
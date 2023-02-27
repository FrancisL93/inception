# Use an official Alpine Linux runtime as a parent image
FROM alpine:3.16.0

# Install Nginx
RUN apk update && apk add nginx openssl && \
	mkdir -p /etc/nginx/ssl && openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
	-subj "/C=US/ST=State/L=City/O=Organization/CN=localhost" \
	-keyout /etc/nginx/ssl/example.key \
	-out /etc/nginx/ssl/example.crt

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy the content of the current directory to the working directory
COPY . .

# Copy the default configuration file into the container
COPY ./nginx.conf /etc/nginx/nginx.conf

# Expose port 443 to the outside world
EXPOSE 443

# Set Nginx to use the default configuration file
CMD ["nginx", "-g", "daemon off;"]
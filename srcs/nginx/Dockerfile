FROM alpine:3.16

# Install nginx and other dependencies
RUN apk update && \
    apk add --no-cache nginx

# Copy the nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 for nginx
EXPOSE 80

# Start the nginx server
CMD ["nginx", "-g", "daemon off;"]
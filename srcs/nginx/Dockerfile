FROM alpine:3.16

# Install nginx and other dependencies
RUN apk update && \	
    apk add --no-cache nginx

# Copy the nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

COPY ./certs /etc/nginx/certs
RUN chmod 600 /etc/nginx/certs/*

# Expose port 443 for nginx
EXPOSE 443

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl -f -s -I http://localhost || exit 1

# Sets NGINX as the entry point to be executed when the container starts 
ENTRYPOINT ["nginx", "-g", "daemon off;"]
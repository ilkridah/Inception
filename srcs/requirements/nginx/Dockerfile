# Use the official Debian Bullseye base image
FROM debian:bullseye

# Expose port 443 for HTTPS
EXPOSE 443

# Update and install required packages
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get -y install nginx openssl

# Generate a self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -subj "/CN=ilkridah" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt

# Copy the Nginx configuration file
COPY ./conf/default /etc/nginx/sites-enabled/default

# Start Nginx with daemon off mode
CMD ["nginx", "-g", "daemon off;"]

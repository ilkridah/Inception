FROM debian:bullseye

# Set up port forwarding
EXPOSE 9000

# Install base components
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install --no-install-recommends php7.4 php-mysqli php-fpm mariadb-client && \
    apt-get -y install wget curl 


# Set up FPM config
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d
RUN mkdir /run/php/

# Install wordpress CLI tool
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

# Create wordpress working directory
RUN mkdir -p /var/www/wordpress
WORKDIR /var/www/wordpress

COPY ./conf/tool.sh ./
RUN chmod +x tool.sh

CMD ["./tool.sh"]

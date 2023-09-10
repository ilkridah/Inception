FROM debian:bullseye
EXPOSE 443

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install --no-install-recommends nginx openssl 


RUN openssl req -x509 -nodes -days 365 -subj "/CN=ilkridah" -newkey rsa:4096 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;
COPY ./conf/default etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
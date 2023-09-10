FROM debian:bullseye
EXPOSE 3306

ARG D_B
ARG DB_USER
ARG DB_PASS

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y --no-install-recommends install mariadb-server 


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY conf/db.sql /

RUN sed -i "s/D_B/$D_B/g" /db.sql && \
    sed -i "s/DB_USER/$DB_USER/g" /db.sql && \
    sed -i "s/DB_PASS/$DB_PASS/g" /db.sql

RUN service mariadb start && mariadb < db.sql && rm -f db.sql

CMD ["mysqld"]
FROM debian:bullseye
EXPOSE 3306

ARG DB_DB
ARG DB_USER
ARG DB_PASS

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY conf/db.sql /

RUN sed -i "s/DB_DB/$DB_DB/g" /db.sql && \
    sed -i "s/DB_USER/$DB_USER/g" /db.sql && \
    sed -i "s/DB_PASS/$DB_PASS/g" /db.sql

RUN service mariadb start && mariadb < db.sql && rm -f db.sql

CMD ["mysqld"]
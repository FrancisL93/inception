# FROM debian:latest

# # Install MariaDB server and client
# RUN apt-get update && \
#     apt-get install -y mariadb-server mariadb-client && \
#     rm -rf /var/lib/apt/lists/*

# # Copy custom configuration files
# COPY my.cnf /etc/mysql/my.cnf

# # Copy custom scripts
# COPY init_db.sh /usr/local/bin/
# COPY run_db.sh /usr/local/bin/

# # Set permissions
# RUN chmod +x /usr/local/bin/init_db.sh /usr/local/bin/run_db.sh

# # Expose port 3306 for MariaDB
# EXPOSE 3306

# # Set entrypoint to run the custom script
# ENTRYPOINT ["run_db.sh"]

FROM alpine:3.16

RUN apk add mysql mysql-client

EXPOSE 3306

LABEL version="1.0"
LABEL description="MariaDB Server"

HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD ["mysqld"]
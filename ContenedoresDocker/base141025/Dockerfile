## Dockerfile personalizado para mariaDB 

FROM mariadb:11.4   

# Instalación de logrotate para la gestión de logs 
# y limpieza de la cache de apt
RUN apt-get update && \
    apt-get install -y logrotate && \
    rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /var/log/mysql && \
    chown -R mysql:mysql /var/log/mysql && \
    chown 750 /var/log/mysql

EXPOSE 3306
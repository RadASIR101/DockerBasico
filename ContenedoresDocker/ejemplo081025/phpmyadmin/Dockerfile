FROM phpmyadmin
RUN apt update && \
    apt install -y  inetutils-ping net-tools && \
    rm -rf /var/lib/apt/lists/*
EXPOSE 80

# Docker Compose y multiples contenedores

```docker
version: '3'
services:
  web:
    image: httpd
    ports:
      - "80:80"
    volumes:
      - ./www:/usr/local/apache2/htdocs/
  db:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: example
        MYSQL_DATABASE: exampledb
        MYSQL_USER: user
        MYSQL_PASSWORD: password
```
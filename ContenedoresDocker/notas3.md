# Notas de contenedores

- Nunca usar lastest

---

- El comando build se usa para construir las imagenes 

- Las imagenes se construyen a partir del dockerfile 

- Los ficheros docker-compose.yml se usan para definir y ejecutar aplicaciones multi-contenedor de Docker

- El comando up se usa para crear y arrancar los contenedores a partir de las imagenes

```docker
docker compose build
```

- Este comando se usa para levantar el servicio
- Crea un contenedor nuevo pero como tiene persistencia  

```docker
docker compose up -d 
```

- Para ver los contenedores

```docker
docker ps -a
```

- Para entrar en un contenedor
```docker
docker exec -it base01 bash
```

- Para parar el docker compose
```docker
docker compose down
```

- listar volumenes - muestra el nombre de la carpeta donde esta el docker-compose.ymls
```docker
docker volume ls
```

```
#DRIVER    VOLUME NAME
          carpeta:nombre_volumes
local     maria1_datos_mariadb1
```

---

- Conexión al servidor mariadb desde cmd

```
C:\Users\BlackMetal>mariadb -u root -p -h 127.0.0.1
```
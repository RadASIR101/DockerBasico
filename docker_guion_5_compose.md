
# Docker Contenedores

-v = volumenes gestionado por carpeta  

./www → ruta de la carpeta mi ordenador 

```docker
docker run -d --rm -p 80:80 -v www
```

- este comando monta la carpeta "www" del host en el contenedor en la ruta "/usr/local/apache2/htdocs/", que es la ubicación predeterminada de los archivos web en un contenedor Apache HTTP Server. Esto permite que los archivos HTML y otros contenidos web almacenados en la carpeta "www" del host sean servidos por el servidor web Apache dentro del contenedor.

                                      carpeta remota a la que quiero conectar 

- La carpeta "www" esta conectada a la carpeta del contenedor "/usr/local/apache2/htdocs/"

                                 ":" Los dos puntos indican la relación entre las dos carpetas ( local y remota )

-P = puerto coge un puerto del ordenador que esta libre y lo conecta al puerto 80 del contenedor

```docker
docker run -d --rm -p 80:80 -v ./www:/usr/local/apache2/htdocs/ --name apacheconvolument httpd
```

```docker
docker run -d --rm -p 8000:80 -v ./www:/usr/local/apache2/htdocs/ --name apacheconvolument httpd
```


# Apuntes ampliados 

---

```docker
docker inspect <nombre_contenedor>
```

# entrar al contenedor 
```docker
```

```docker
docker exec -it <nombre_contenedor> bash 
```

- Los contenedores son instancias en ejecución de imágenes de Docker. 

- Son entornos ligeros y portátiles que permiten ejecutar aplicaciones de manera aislada.

- Los contenedores comparten el mismo núcleo del sistema operativo, lo que los hace más eficientes en términos de recursos en comparación con las máquinas virtuales.

- Los contenedores se usan para empaquetar aplicaciones y sus dependencias, lo que facilita la implementación y la escalabilidad.

## Comandos Útiles

- Crear una red personalizada para los contenedores

```docker
docker network create <nombre_red>
```

- Crear contenedores en una red específica

```docker   
docker run -dit --rm --name <nombre_contenedor> --network <nombre_red> <imagen>
```

- Crear un contenedor con un volumen montado

```docker
docker run -dit --rm --name <nombre_contenedor> -v <ruta_host>:<ruta_contenedor> <imagen>
```

- Crear un contenedor simple

```docker
docker run -dit --rm --name <nombre_contenedor> <imagen>
```

- Para ver los contenedores que estan corriendo

```docker
docker ps
```

- Para ver todos los contenedores, incluidos los que están detenidos

```docker
docker ps -a
```

- Para crear y ejecutar un contenedor en segundo plano

```docker
docker run -dit --rm --name <nombre_contenedor> <imagen>
```

- Para ver los logs de un contenedor
```docker
docker logs <nombre_contenedor>
```

## Comando Basicos  
- Este comando lanza un contenedor llamado alpine01 basado en la imagen de Alpine Linux, ejecutando el shell sh en modo interactivo.

```docker
docker run -it --rm --name alpine01 alpine sh
```
- Listar todos los contenedores, incluidos los que están detenidos

```docker
docker ps -a
```

---


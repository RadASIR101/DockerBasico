# Docker 

## Comando Basicos


- Este comando lanza un contenedor llamado alpine01 basado en la imagen de Alpine Linux, ejecutando el shell sh en modo interactivo.

``
docker run -it --name alpine 01 alpine sh
``

- Listar todos los contenedores, incluidos los que están detenidos

``
docker ps -a
``

- Salir del contenedor sin detenerlo 

``
control p + control q
``

- Detener el contenedor

``
docker stop 
``
 
- Eliminar el contenedor

``
docker rm alpine01
``

- Volver a crear y ejecutar el contenedor, esta vez con la opción --rm para que se elimine automáticamente al detenerlo

``
docker run -it --rm --name alpine01 alpine sh
``


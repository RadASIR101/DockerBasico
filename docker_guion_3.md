# Docker 

## Comando Basicos

docker run -dit --rm --name alpine01 alpine

- Contenedor corriendo

CONTAINER ID   IMAGE     COMMAND              CREATED         STATUS                  PORTS     NAMES
788c7f39a8a7   alpine    "/bin/sh"            9 seconds ago   Up 8 seconds                      alpine01
43d7c87ae7d6   httpd     "httpd-foreground"   4 days ago      Exited (0) 4 days ago             apache01
729f8629a3e6   httpd     "httpd-foreground"   4 days ago      Exited (0) 4 days ago             apache02

---

attach = si salgo se borra el contenedor
exec = si salgo no detiene el contenedor si me salgo

docker attach alpine01 -> se conecta al contenedor para verlo 

## Salir del contenedor

- Control p + Control q -> salir sin detener el contenedor

 82  docker rmi 43d7c8
   83  docker rmi 43d7c87
   84  docker image
   85  docker images
   86  docker rmi 027c678
   87  docker rmi 4bcff63911fc
   88  docker images
   89  cd apache/
   90  ll
   91  docker run -dit --rm --name alpine01 alpine
   92  docker ps -a
   93  docker attach alpine01
   94  docker ps -a
   95  docker run -dit --rm --name alpine01 alpine
   96  docker attach alpine01
   97  docker exec -it alpine02 sh
   98  docker ps -a
   99  docker exec -it alpine01 sh
  100  history

---

* Redirige el puerto 8080 de mi ordenador lo redirige al 80 del navegador del servidor web del contenedor

docker run -d --rm -p 8080:80 --name apache1 httpd

---

docker exec -it apache1 bash

dentro del contenedor : screenfetch

---

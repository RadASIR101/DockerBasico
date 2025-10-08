# Notas de contenedores

- Nunca usar lastest

---

volumenes gestionador por docker

   volumes: 
      - datos_mariadb1:/var/lib/mysql # Mapeo de volúmenes (host:contenedor)
      Volumen de docker gestionado por docker (no es un mapeo de un directorio del host)
      lo tengo que crear antes de levantar el servicio
      cuando haga docker build se crea automaticamente
      

Esto no es una carpeta 

docker volume create datos_mariadb1

   47  docker exec -it base01 bash
   48  docker ps -a
   49  docker compose down
   50  docker ps -a
   51  docker compose down
   52  docker ps -a
   53* docker compose
   54  docker compose build
   55  docker compose up -d
   56  docker compose build
   57  docker compose up -d
   58  docker ps -a
   59  docker exec -it base01 bash
   60  history
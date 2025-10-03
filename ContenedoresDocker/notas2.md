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
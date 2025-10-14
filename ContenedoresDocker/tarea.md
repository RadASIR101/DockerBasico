# Notas de contenedores

- Nunca usar lastest

---
 
3/10/2025

## Docker compose se instala con:

```bash
sudo apt-get install docker-compose
```

## Crear el fichero docker-compose.yml
```docker
docker-compose build # para construir las imagenes
```


## Levantar los servicios
```docker
docker-compose up -d    # para levantar los servicios en segundo plano y me devuelve el control de la terminal
```


## Para el docker-compose se usa:
```docker
docker-compose down # para el docker-compose
```
 
## Ver los contenedores

```docker
docker ps -a # ver todos los contenedores
```

## Ver los logs

```docker
docker-compose logs -f # ver todos los logs
docker-compose logs -f api # ver los logs de un servicio
docker-compose logs -f db # ver los logs de otro servicio
docker-compose logs -f web # ver los logs de otro servicio
docker-compose logs -f nginx # ver los logs de otro servicio
docker-compose logs -f --tail=10 # ver los ultimos 10 logs
```
## Ver los servicios

```docker
docker-compose ps # ver todos los servicios
docker-compose ps -a # ver todos los servicios (incluidos los detenidos)
docker-compose ps -q # ver solo los IDs de los servicios
```
## Reconstruir los servicios

```docker
docker-compose build # reconstruir todos los servicios
docker-compose build api # reconstruir solo el servicio api    
docker-compose up -d --build # reconstruir y levantar los servicios
docker-compose up -d --build --force-recreate # reconstruir y levantar los servicios forzando la recreación
```

# Servidor Nginx con Docker Compose
services:
  servidorweb2: # Nombre del contenedor (servidorweb) puedo poner el que quiera
    image: nginx # Imagen que voy a usar para crear el contenedor puede local o remota
    container_name: nginx01 # Nombre del contenedor puedo poner el que quiera ( es una etiqueta como --name en docker run)
    restart: unless-stopped # Politica de reinicio (siempre, a menos que se pare, nunca, etc)
    ports:
      - "8081:80" # Mapeo de puertos (host:contenedor)
    volumes:
      - ./www:/usr/share/nginx/html # Mapeo de volúmenes (host:contenedor)
      - ./nginx.conf:/etc/nginx/nginx.conf # Mapeo de volúmenes (host:contenedor)
    environment:
      - NGINX_HOST=localhost
      - NGINX_PORT=80   
# Volúmenes (si no existen se crean)
volumes:
  www:    
    driver: local
# Redes (si no existen se crean)

```docker
networks:
  nginx-net:
    driver: bridge
    ipam:
      config:
        - subnet: 172.20.0.0/16
          gateway: 172.20.0.1
    driver_opts:
      com.docker.network.bridge.name: br-nginx  
    internal: false
    attachable: true
    enable_ipv6: false
    labels:
      com.docker.network.bridge.enable_icc: "true"
      com.docker.network.bridge.enable_ip_masquerade: "true"
      com.docker.network.driver.mtu: "1500"
      com.docker.network.bridge.host_binding_ipv4: "172.20.0.1"
      com.docker.network.bridge.name: "br-nginx"
      com.docker.network.driver.overlay.vxlanid_list: "4096"
      com.docker.network.bridge.default_bridge: "false"
      com.docker.network.bridge.enable_bridge: "true"
      com.docker.network.bridge.enable_ip_masquerade: "true"  
      com.docker.network.driver.mtu: "1500"
```


# 2025-10-08

## Notas de contenedores

- Nunca usar lastest

```
# Levantaremos un servidor mariadb y un phpMyadmin
# 1º serviciso , volumen , red

services:
  basededatos:
    #Servidor MariaDB
    image: mariadb
    # Aqui vendria la etiqueta
    container_name: serv_mariadb
    ports: ["3306:3306"]
    environment:
      - MARIADB_ROOT_PASSWORD=asd1
    volumes:
      - volume1:/var/lib/mysql
  # PhpMyAdmin
  phpmyadmin:
    image: phpmyadmin
    container_name: phpmyadmin
    ports: ["80:80", "443:443"]
    depends_on:
      - basededatos
    environment:
      - PMA_ARBITRARY=1
volumes:
  volume1:
  # - volumen1:/var/lib/mysql # Aquí se monta el volumen
```

```
docker ps -a
```

```
docker-compose 
```

```
docker volume ls
```

## Redes tipo puente

```docker
NETWORK ID     NAME                    DRIVER    SCOPE
bd2657254f3a   bridge                  bridge    local
2d39e43cbdfc   ejemplo081025_default   bridge    local
1414e7441de7   host                    host      local
c6dbe89656cc   none                    null      local
```

docker network inspect <ID>


            }
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "4ba1ef342bcce92fe31a0fe5a6daca9ef130a8300614d897f46691e02f740233": {
                "Name": "serv_mariadb",
                "EndpointID": "43d162c2d3f01261803a6622b7c21d947ad3f61961fe88e3123ad2980be84433",
                "MacAddress": "36:8f:2b:e0:0d:70",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            },
            "70f0fd9ef015f30b551b4ff9cbac67677ede4bc3dce3a514a4ffd7c826ebbe5e": {
                "Name": "phpmyadmin",
                "EndpointID": "43ddaee34af70787e6c5d59919b0668d6fe48fde66b8c831731cda6347fed148",
                "MacAddress": "3a:bd:d9:d3:7f:8a",
                "IPv4Address": "172.18.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.enable_ipv4": "true",
            "com.docker.network.enable_ipv6": "false"
        },
        "Labels": {
            "com.docker.compose.config-hash": "2ca54f558a75af90e8f50c5ab8996545bed754abcc0151085c6b9b1e1ad338df",
            "com.docker.compose.network": "default",
            "com.docker.compose.project": "ejemplo081025",
            "com.docker.compose.version": "2.39.2"
        }
    }
]

Fijarse en DNSNames : 

# la red de nuestra bd es la 2
 "IPv4Address": "172.18.0.2/16",

todas las bd que haga se registra en esta red

- Accesos 

172.18.0.2 -> basededatos -> Viene en el DNSName

usuario root - pass : asd1 


docker exec -it phpMyadmin bash


- Nombre de la maquina como nombre de dominio

Cada dockerfile tiene redes diferentes y se pueden conectar entre ellas mediante configuración

ping 127.18.0.2
ping serv_mariadb
ping basededatos
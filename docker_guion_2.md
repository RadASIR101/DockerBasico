# Docker 

## Comando Basicos

- Este comando lanza un contenedor llamado alpine01 basado en la imagen de Alpine Linux, ejecutando el shell sh en modo interactivo.

```docker
docker run -it --rm --name alpine01 alpine sh
```

```docker
docker ps -a
```

```docker
Control p + Control q
```

```docker
docker stop 
```

```docker
docker ps -a 
```

```docker
docker rm alpine01
```

- Volver a crear y ejecutar el contenedor, esta vez con la opción --rm para que se elimine automáticamente al detenerlo

```docker
docker run -it --rm --name alpine01 alpine sh


- Este comando lanza un contenedor llamado alpine01 basado en la imagen de Alpine Linux, ejecutando el shell sh en modo interactivo, pero en segundo plano. El contenedor se eliminará automáticamente cuando lo detengas.

```docker
docker run -dit --rm --name alpine01 alpine sh
```

Quiero que se ejecute pero no meterme dentro de el
Esta ejecutando en una maquina de docker no de la maquina windows por eso no puede acceder

```bash
netstat -nat 
```

```docker
docker run -d --rm --name apache01 httpd
```

Expone el puerto 80 del contenedor en el puerto 8080 del host

```docker
docker run -d --rm --name apache01 -p 8080:80 httpd 
```

- Listar todos los contenedores, incluidos los que están detenidos

```docker
                                                                                                     IPv6
0e746ec9fa66   httpd     "httpd-foreground"   15 seconds ago   Up 15 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp apache01 fe850d1a2978  alpine "sh" 9 minutes ago Up 9 minutes                                              alpine01
```

- Puedo abrir otro servidor apache en un puerto distinto

                                      Puerto de mi maquina

```docker
docker run -d --rm --name apache01 -p 8085:80 httpd 
```

- Entrar al contenedor

```docker
docker exec -it apache01 bash
```

- Conectarme al servidor web
```
http://localhost:8080
```

- Cerrar contenedores

```docker
docker stop <nombre_contenedor>
```
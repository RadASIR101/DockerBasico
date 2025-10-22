# 2025-10-14

# Notas de la base

- Vamos a crear un docker compose de una base de datos mariaDB y phpmyadmin

- El docker compose debe tener los siguientes servicios:
  - mariaDB
  - phpmyadmin


- necesito un Dockerfile para el servicio de mariaDB


Estas líneas que muestras en tu `docker-compose.yml` corresponden a **montajes de volúmenes** en Docker. Sirven para indicar qué carpetas o archivos del host (tu máquina) se van a montar dentro del contenedor. Te explico cada una:

```docker
- db_data1:/var/lib/mysql
- ./mariadb-conf:/etc/mysql/conf.d
```

### 📂 Explicación línea por línea

- **`db_data1:/var/lib/mysql`**
  - `db_data1` es un **volumen nombrado** de Docker.
  - `/var/lib/mysql` es la ruta dentro del contenedor donde MariaDB guarda sus datos (tablas, índices, etc.).
  - Esto asegura que los datos de la base de datos **persistan** aunque el contenedor se borre o reinicie.  
    Sin esto, perderías toda la información al eliminar el contenedor.

- **`./mariadb-conf:/etc/mysql/conf.d`**
  - `./mariadb-conf` es una carpeta en tu máquina (ruta relativa al `docker-compose.yml`).
  - `/etc/mysql/conf.d` es la carpeta dentro del contenedor donde MariaDB busca archivos de configuración adicionales (`.cnf`).
  - Esto te permite **personalizar la configuración** de MariaDB (por ejemplo, cambiar el tamaño de buffers, activar logs, etc.) simplemente editando los archivos en `./mariadb-conf` de tu host.

### 📝 Resumen
- La primera línea: **persistencia de datos** de la base de datos.  
- La segunda línea: **configuración personalizada** de MariaDB.

👉 En pocas palabras: una guarda tus datos, la otra te deja ajustar cómo funciona el servidor.

¿Quieres que te muestre un ejemplo de cómo quedaría un archivo de configuración típico dentro de `./mariadb-conf` para que veas cómo se usa?

---- 
Ejecución

 docker compose build 

 docker exec -it mariadb_1 sh 

 logrotate --version
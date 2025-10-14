# 2025-10-08

## Notas de contenedores

- Nunca usar lastest

dockerfile : hacemos un guion de ejecución

Estas líneas en el Dockerfile sirven para crear una imagen personalizada basada en phpMyAdmin y agregarle algunas utilidades de red. Te explico cada línea:

Usa la imagen oficial de phpMyAdmin como base.

apt update: Actualiza la lista de paquetes disponibles.

apt install -y inetutils-ping net-tools: Instala dos utilidades:

inetutils-ping: Permite usar el comando ping para comprobar la conectividad de red.

net-tools: Incluye herramientas como ifconfig, netstat, etc., útiles para diagnosticar 
redes.

rm -rf /var/lib/apt/lists/*: Limpia los archivos temporales de apt para reducir el tamaño de la imagen.

Resumen:

Estas líneas permiten que el contenedor de phpMyAdmin tenga herramientas básicas de red para diagnóstico y pruebas, lo cual puede ser útil durante el desarrollo o troubleshooting.

https://docs.docker.com/reference/dockerfile/#expose

---

## Corrección

Aquí tienes tus apuntes mejorados y corregidos, incluyendo buenas prácticas, explicaciones más claras y consejo profesional para tus objetivos DevOps:

***

# Apuntes Dockerfile y Docker Compose – Creación de redes y scripts (guiones)

## **Notas sobre creación de contenedores**

- **Evita usar la etiqueta `latest`** en producción.
  - Siempre especifica una versión concreta para tener entornos reproducibles y evitar inconsistencias por cambios invisibles en la imagen base.

***

### **Ejemplo Dockerfile para phpMyAdmin personalizado con utilidades de red**

```dockerfile
# Usa la imagen oficial de phpMyAdmin como base
FROM phpmyadmin/phpmyadmin:5.2.1

# Actualiza lista de paquetes e instala utilidades de red
RUN apt-get update && \
    apt-get install -y inetutils-ping net-tools && \
    rm -rf /var/lib/apt/lists/*

# (Opcional) Configura variables de entorno, archivos custom, etc.
```

**Explicación técnica línea a línea:**

- `FROM phpmyadmin/phpmyadmin:5.2.1`: Utiliza una imagen concreta (no latest).
- `apt-get update`: Actualiza el índice de paquetes.
- `apt-get install -y inetutils-ping net-tools`: Agrega utilidades como:
  - `ping` (para diagnosticar conectividad entre contenedores).
  - `net-tools` (`ifconfig`, `netstat`, etc. útiles para troubleshooting).
- `rm -rf /var/lib/apt/lists/*`: Limpia archivos temporales y reduce tamaño final.

**Consejo DevOps:** Instala solo lo justo y necesario para minimizar vulnerabilidades y tamaño.

***

### **Ejemplo de docker-compose.yml con buenas prácticas**

```yaml
version: '3.8'

services:
  basededatos:
    image: mariadb:11.0
    container_name: serv_mariadb
    ports:
      - "3306:3306"
    environment:
      - MARIADB_ROOT_PASSWORD=asd1
    volumes:
      - volume1:/var/lib/mysql
    networks:
      - red_basedatos

  phpmyadmin:
    build: ./phpmyadmin/
    container_name: phpmyadmin
    ports:
      - "80:80"
      - "443:443"
    depends_on:
      - basededatos
    environment:
      - PMA_ARBITRARY=1
    networks:
      - red_basedatos

volumes:
  volume1:

networks:
  red_basedatos:
```

**Correcciones y consejos:**

- **Indentación:** Usa solo espacios, nunca tabulaciones ni entidades HTML.
- **Forma de listas en YAML:** Mejor así que con corchetes `[ ]`; es más legible.
- **build vs image en phpMyAdmin:** Usa `build:` si tienes un Dockerfile personalizado, si no simplemente usa la imagen oficial.
- **Variables de entorno:** Mantén las sensibles fuera del archivo (usa `.env` para producción).
- **Red personalizada:** Permite aislamiento, comunicación interna por el nombre del servicio y es clave para proyectos multi-servicio.

***

### **Preguntas de repaso**

1. ¿Por qué es importante usar una red personalizada en Docker Compose?
2. ¿Qué ocurre si eliminas el contenedor MariaDB pero mantienes el volumen? ¿Se pierde la base de datos o se conserva?

***

### **Referencia avanzada**
- [EXPOSE](https://docs.docker.com/reference/dockerfile/#expose) sirve para documentar puertos expuestos, pero recuerda que Docker Compose gestiona esto vía la sección `ports`.

***

**¿Quieres que te ayude a crear un mini-proyecto de “Wordpress + MariaDB + phpMyAdmin” solo con docker-compose como siguiente reto?**

[1](https://www.perplexity.ai/search/eres-un-ingeniero-devops-exper-U9RoIEdvRoicyU.JTbtehA)
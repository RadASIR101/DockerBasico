
# Docker Compose

-  es una herramienta que permite definir y ejecutar aplicaciones multi-contenedor con un solo archivo YAML y un comando, ideal para desarrollo, pruebas y despliegues locales reproducibles. Sirve para declarar servicios, redes y volúmenes de forma coherente y levantarlos/derribarlos juntos. 

### Concepto clave

- Compose usa un archivo compose.yaml/docker-compose.yml para describir servicios (contenedores), sus imágenes, variables, puertos, volúmenes y redes de manera declarativa. 

- Con un único comando se crea toda la aplicación: construcción de imágenes, creación de redes/volúmenes y arranque de servicios en el orden correcto. 

### Primer ejemplo: web estática con Nginx
```yaml
# compose.yaml
services:
  web:
    image: nginx:1.27-alpine
    ports:
      - "8080:80"
    volumes:
      - ./site:/usr/share/nginx/html:ro
```
- Qué hace: sirve los archivos estáticos de ./site en http://localhost:8080, montando el directorio como solo lectura. 

- Comandos: arrancar con docker compose up -d y parar con docker compose down (en el mismo directorio). 

### Ejemplo clásico: web + base de datos
```yaml
services:
  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_PASSWORD: example
      POSTGRES_DB: appdb
    volumes:
      - dbdata:/var/lib/postgresql/data
  app:
    build: ./app
    environment:
      DATABASE_URL: postgres://postgres:example@db:5432/appdb
    depends_on:
      - db
    ports:
      - "3000:3000"
volumes:
  dbdata:
```

- Qué hace: crea una base de datos Postgres persistente y una app que se conecta a “db” por nombre de servicio en la red interna de Compose. 

- Claves: depends_on asegura orden de arranque; el volumen dbdata mantiene datos aunque se haga down. 

### Desarrollo en caliente (bind mounts)
```yaml
services:
  api:
    build: .
    command: npm run dev
    ports:
      - "5173:5173"
    volumes:
      - ./:/usr/src/app
      - /usr/src/app/node_modules
```

- Qué hace: monta el código local para hot-reload y evita sobreescribir node_modules con un volumen anónimo. 

- Ventaja: ciclo de desarrollo rápido sin reconstruir la imagen en cada cambio. 

### Healthchecks y usuario no root
```yaml
services:
  web:
    image: httpd:2.4-alpine
    user: "1000:1000"
    healthcheck:
      test: ["CMD", "wget", "-qO-", "http://localhost/"]
      interval: 30s
      timeout: 5s
      retries: 3
    ports:
      - "8080:80"
```

- Qué hace: ejecuta el servicio sin privilegios y añade comprobaciones de salud para diagnósticos y dependencias. 

- Beneficio: seguridad y mayor observabilidad del estado del servicio. 

### Variables y perfiles
```yaml
services:
  cache:
    image: redis:7-alpine
    ports:
      - "${REDIS_PORT:-6379}:6379"
    profiles: ["dev"]
```

- Qué hace: usa variables de entorno y activa el servicio solo con perfil dev (docker compose --profile dev up). 

- Ventaja: diferentes entornos (dev/test/ci) con el mismo archivo. 

### Redes personalizadas
```yaml
services:
  api:
    image: my/api:latest
    networks: [backend]
  db:
    image: mariadb:11
    networks: [backend]
networks:
  backend:
    driver: bridge
```

- Qué hace: aísla la comunicación entre API y DB en una red bridge dedicada, separada de otros servicios. 

- Beneficio: control de tráfico y nombres DNS internos por servicio. 

### Logs, escalado y limpieza

- Logs: docker compose logs -f muestra logs agregados por servicio, útil para depuración centralizada. 

- Escalar: docker compose up -d --scale web=3 levanta varias réplicas del servicio web detrás de la misma red. 

- Limpieza: docker compose down borra contenedores y redes; añadir -v para eliminar volúmenes definidos (cuidado con datos). 

### Buenas prácticas

- Fijar etiquetas de imágenes (por ejemplo, nginx:1.27-alpine) y etiquetar builds propias para reproducibilidad. 

- Usar .env para credenciales y variables; en producción, preferir secretos o inyectar por entorno seguro. 

- Añadir healthcheck, user no root, y límites de recursos (deploy.resources en Swarm o en orquestadores). 

- Mantener archivos compactos y legibles: separar por servicios, usar comentarios y evitar configuraciones innecesarias. 

### Cómo empezar ya

1) Crear compose.yaml con uno de los ejemplos. 

2) Ejecutar docker compose up -d en el directorio del archivo. 

3) Verificar con docker compose ps y abrir el puerto publicado en el navegador. 

4) Revisar logs con docker compose logs -f y detener con docker compose down. 


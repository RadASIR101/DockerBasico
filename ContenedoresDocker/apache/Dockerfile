# Vamos a crear un archivo apache de forma constante mediante un Dockerfile
# Un Dockerfile es un archivo de texto que contiene una serie de instrucciones para construir una imagen de Docker personalizada.
# Estas instrucciones especifican la base de la imagen, los comandos a ejecutar, los archivos a copiar, las variables de entorno, los puertos a exponer, entre otros aspectos de la configuración del contenedor.
# El Dockerfile se utiliza junto con el comando `docker build` para crear una imagen de Docker que luego puede ser ejecutada como un contenedor.
# Crear un archivo llamado Dockerfile en un directorio específico, por ejemplo, ContenedoresDocker/apache/
# Asegúrate de que el archivo se llame exactamente "Dockerfile" (con D mayúscula) y no tenga ninguna extensión adicional como .txt.

# El archivo se llamara Dockerfile y no tiene extension
# El contenido del archivo sera el siguiente :
FROM httpd  

# Ruta donde quiero que se ejecute el servicio de apache
# Este comando copia el contenido del directorio local www al directorio htdocs del contenedor, que es donde Apache busca los archivos para servir.
# Asegúrate de que el directorio www exista en el mismo nivel que tu Dockerfile y contenga los archivos que deseas servir a través de Apache.
COPY ./www/ /usr/local/apache2/htdocs/

# Exponer el puerto 80 para que el servidor web sea accesible desde fuera del contenedor
# El comando EXPOSE informa a Docker que el contenedor escucha en el puerto 80 en tiempo de ejecución.
# Esto es importante para que puedas mapear este puerto a un puerto en tu máquina host cuando ejecutes el contenedor.
# Aunque EXPOSE no publica el puerto por sí mismo, es una buena práctica incluirlo en tu Dockerfile para documentar qué puertos utiliza tu aplicación.
# Para que el puerto 80 del contenedor sea accesible desde tu máquina host, necesitarás usar la opción -p al ejecutar el contenedor, como se muestra en los ejemplos anteriores.
EXPOSE 80

# Voy a construir la imagen utilizando la siguiente opcion : docker build

# Asegúrate de estar en el mismo directorio donde se encuentra tu Dockerfile (ContenedoresDocker/apache/) y ejecuta el siguiente comando en la terminal:
# Navega al directorio donde se encuentra tu Dockerfile
# cd ContenedoresDocker/apache/
# docker build -t miapache:1.0.0 .

# ¡Perfecto, ya tienes tu imagen personalizada de Apache construida! 
# El siguiente paso es ejecutar un contenedor basado en esa imagen 
# para que puedas ver tu servidor web en acción
# Ejecuta : 
# docker run -d --rm --name apache01 -p 8080:80 miapache:1.0.0
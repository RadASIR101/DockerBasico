# Vamos a crear un archivo apache de forma constante
FROM httpd  

# Ruta donde quiero que se ejecute el servicio de apache
COPY ./www/ /usr/local/apache2/htdocs/

EXPOSE 80

# Voy a construir la imagen utilizando la siguiente opcion : docker build


# docker build -t miapache:1.0.0 .

# ¡Perfecto, ya tienes tu imagen personalizada de Apache construida! 
# El siguiente paso es ejecutar un contenedor basado en esa imagen 
# para que puedas ver tu servidor web en acción
# Ejecuta : 
# docker run -d --rm --name apache01 -p 8080:80 miapache:1.0.0
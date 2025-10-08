# 2025-10-08

## Notas de contenedores

- Nunca usar lastest
 
dockerfile : hacemos un guion de ejecución

Estas líneas en el Dockerfile sirven para crear una imagen personalizada basada en phpMyAdmin y agregarle algunas utilidades de red. Te explico cada línea:

Usa la imagen oficial de phpMyAdmin como base.
apt update: Actualiza la lista de paquetes disponibles.
apt install -y inetutils-ping net-tools: Instala dos utilidades:
inetutils-ping: Permite usar el comando ping para comprobar la conectividad de red.
net-tools: Incluye herramientas como ifconfig, netstat, etc., útiles para diagnosticar redes.
rm -rf /var/lib/apt/lists/*: Limpia los archivos temporales de apt para reducir el tamaño de la imagen.
Resumen:
Estas líneas permiten que el contenedor de phpMyAdmin tenga herramientas básicas de red para diagnóstico y pruebas, lo cual puede ser útil durante el desarrollo o troubleshooting.

https://docs.docker.com/reference/dockerfile/#expose


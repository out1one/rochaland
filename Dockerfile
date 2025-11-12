# Usar OpenJDK 17
FROM openjdk:17-jdk-slim

# Carpeta de trabajo
WORKDIR /minecraft

# Copiar solo server.jar y eula.txt
COPY server.jar .
COPY eula.txt .

# Instalar utilidades necesarias
RUN apt-get update && apt-get install -y wget unzip ca-certificates && rm -rf /var/lib/apt/lists/*

# Descargar y descomprimir el mundo de Google Drive
# Sustituye el ID del archivo por tu mundo
RUN wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1jdHEIuuiC_-GuJTggdFsiL4bjPQf36oS' -O world.zip \
    && unzip world.zip \
    && rm world.zip

# Exponer el puerto de Minecraft
EXPOSE 25565

# Iniciar el servidor con memoria ajustable
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "server.jar", "nogui"]


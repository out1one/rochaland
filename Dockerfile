FROM openjdk:17-jdk-slim

WORKDIR /minecraft

# Copiar solo server.jar y eula.txt
COPY server.jar .
COPY eula.txt .

# Instalar wget y unzip
RUN apt-get update && apt-get install -y wget unzip

# Descargar y descomprimir el mundo
RUN wget -O world.zip "https://drive.google.com/file/d/1jdHEIuuiC_-GuJTggdFsiL4bjPQf36oS/view" && unzip world.zip && rm world.zip

# Exponer puerto de Minecraft
EXPOSE 25565

# Iniciar servidor
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "server.jar", "nogui"]

# Usar Java 17
FROM eclipse-temurin:17-jdk

WORKDIR /minecraft

# Copiar eula.txt
COPY eula.txt .

# Instalar utilidades necesarias y python3/pip
RUN apt-get update && apt-get install -y wget unzip python3 python3-pip ca-certificates && rm -rf /var/lib/apt/lists/*

# Instalar gdown para descargar archivos grandes de Google Drive
RUN pip3 install gdown

# Descargar server.jar versión 1.21.10
RUN wget -O server.jar "https://piston-data.mojang.com/v1/objects/45810d238246d90e811d896f87b14695b7fb6839/server.jar"

# Descargar y descomprimir tu mundo grande desde Google Drive usando gdown
RUN gdown --id 1jdHEIuuiC_-GuJTggdFsiL4bjPQf36oS -O world.zip \
    && unzip world.zip \
    && rm world.zip

# Exponer puerto de Minecraft
EXPOSE 25565

# Iniciar servidor Minecraft
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "server.jar", "nogui"]



FROM eclipse-temurin:17-jdk

WORKDIR /minecraft

# Copiar solo eula.txt
COPY eula.txt .

# Instalar utilidades necesarias
RUN apt-get update && apt-get install -y wget unzip ca-certificates && rm -rf /var/lib/apt/lists/*

# Descargar server.jar versión 1.21.10 con enlace verificado
RUN wget -O server.jar "https://piston-data.mojang.com/v1/objects/45810d238246d90e811d896f87b14695b7fb6839/server.jar"

# Descargar y descomprimir tu mundo desde Google Drive
RUN wget --no-check-certificate "https://docs.google.com/uc?export=download&id=1jdHEIuuiC_-GuJTggdFsiL4bjPQf36oS" -O world.zip \
    && unzip world.zip \
    && rm world.zip

EXPOSE 25565

CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "server.jar", "nogui"]



# Usar OpenJDK 17 oficial
FROM eclipse-temurin:17-jdk

WORKDIR /minecraft

# Copiar eula.txt
COPY eula.txt .

# Instalar wget, unzip y certificados
RUN apt-get update && apt-get install -y wget unzip ca-certificates && rm -rf /var/lib/apt/lists/*

# Descargar server.jar versión 1.21.10
RUN wget -O server.jar "https://launcher.mojang.com/v1/objects/8c546cb1b9d88e0cb2df34ed3173f3f4dd0ecb3e/server.jar"

# Descargar y descomprimir tu mundo desde Google Drive
RUN wget --no-check-certificate "https://docs.google.com/uc?export=download&id=1jdHEIuuiC_-GuJTggdFsiL4bjPQf36oS" -O world.zip \
    && unzip world.zip \
    && rm world.zip

# Exponer puerto de Minecraft
EXPOSE 25565

# Iniciar servidor (ajusta memoria si necesitas)
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "server.jar", "nogui"]


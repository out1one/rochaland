# Usar OpenJDK 17
FROM openjdk:17-jdk

# Carpeta de trabajo
WORKDIR /minecraft

# Copiar solo eula.txt
COPY eula.txt .

# Instalar utilidades necesarias
RUN apt-get update && apt-get install -y wget unzip ca-certificates && rm -rf /var/lib/apt/lists/*

# Descargar server.jar versión 1.21.10
RUN wget -O server.jar "https://launcher.mojang.com/v1/objects/78ea32f2db4da1acef7d9fa8f0ac6aa1f32fc895/server.jar"

# Descargar y descomprimir tu mundo desde Google Drive
RUN wget --no-check-certificate "https://docs.google.com/uc?export=download&id=1jdHEIuuiC_-GuJTggdFsiL4bjPQf36oS" -O world.zip \
    && unzip world.zip \
    && rm world.zip

# Exponer el puerto de Minecraft
EXPOSE 25565

# Iniciar servidor (ajusta memoria si necesitas)
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "server.jar", "nogui"]

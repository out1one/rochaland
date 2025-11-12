# Usar Java 17
FROM eclipse-temurin:17-jdk

WORKDIR /minecraft

# Copiar eula.txt
COPY eula.txt .

# Instalar utilidades necesarias
RUN apt-get update && apt-get install -y wget unzip ca-certificates curl gnupg && rm -rf /var/lib/apt/lists/*

# Instalar Mega CLI para descargar el mundo
RUN curl -s https://mega.nz/keys/MEGA_signing.key | gpg --import && \
    echo "deb http://mega.nz/linux/repo/ubuntu/$(lsb_release -cs)/ ./ " > /etc/apt/sources.list.d/mega.list && \
    apt-get update && apt-get install -y megatools && rm -rf /var/lib/apt/lists/*

# Descargar server.jar versión 1.21.10
RUN wget -O server.jar "https://piston-data.mojang.com/v1/objects/45810d238246d90e811d896f87b14695b7fb6839/server.jar"

# Descargar y descomprimir tu mundo desde Mega
RUN megadl "https://mega.nz/file/bd0xGIqC#0tEkvZ_zwghMFo-_UTvL674q7gdbIaR3oPrFhTP3B0k" --path ./world.zip && \
    unzip world.zip && rm world.zip

# Exponer puerto de Minecraft
EXPOSE 25565

# Iniciar servidor
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "server.jar", "nogui"]


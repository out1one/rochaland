FROM eclipse-temurin:17-jdk

# Carpeta de trabajo
WORKDIR /minecraft

# Copia los archivos del repo
COPY . /minecraft

# Instala dos2unix, convierte start.sh y da permisos de ejecución
RUN apt-get update && apt-get install -y dos2unix \
    && dos2unix start.sh \
    && chmod +x start.sh \
    && apt-get clean

# Expone el puerto de Minecraft
EXPOSE 25565

# Comando para iniciar el servidor
CMD ["./start.sh"]


# Usa Eclipse Temurin OpenJDK 17
FROM eclipse-temurin:17-jdk

# Carpeta de trabajo
WORKDIR /minecraft

# Copia los archivos del repo
COPY . /minecraft

# Da permisos de ejecución al start.sh
RUN chmod +x start.sh

# Expone el puerto de Minecraft
EXPOSE 25565

# Comando para iniciar el servidor
CMD ["./start.sh"]

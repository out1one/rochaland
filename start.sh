#!/bin/bash

# Configuración
MC_VERSION="1.21.10"
MC_RAM="2G"
MC_URL="https://launcher.mojang.com/v1/objects/0e4d35f15e50830251c49c0bbaf4a7db70f1c2e8/server.jar"

# Elimina cualquier server.jar viejo
rm -f server.jar

# Descargar server.jar oficial si no existe
echo "Descargando server.jar versión $MC_VERSION..."
curl -O $MC_URL

# Aceptar EULA automáticamente
echo "eula=true" > eula.txt

# Iniciar el servidor
echo "Iniciando Minecraft Server versión $MC_VERSION con $MC_RAM de RAM..."
java -Xmx$MC_RAM -Xms$MC_RAM -jar server.jar nogui
